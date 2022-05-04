//
//  MindfulnessView.swift
//  
//
//  Created by Ethan Chew on 8/4/22.
//

import Foundation
import SwiftUI
import AVFoundation
import AudioToolbox

struct MindfulnessView: View {
    @State var mindfulnessLength = 1
    @State var showMindfulnessView = false
    
    var body: some View {
        ScrollView {
            VStack() {
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack {
                        VStack(alignment: .leading, spacing:13.0) {
                            Text("Mindfulness")
                                .font(.system(size: 65))
                                .bold()
                            VStack(alignment: .leading, spacing: 11.0) {
                                Text("Overwhelmed with things in life? Take a breather using this Mindfulness Timer. It is recommended to turn your sound and turn off silent mode to be notified when the timer ends.")
                                    .font(.title2)
                                Text("During Mindfulness, close your eyes and focus on your breathing. Try to clear your mind as much as possible.")
                                    .font(.title2)
                            }
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Settings")
                                .bold()
                                .font(.title)
                            Stepper("Length of Mindfulness: \(mindfulnessLength) Minute\(mindfulnessLength == 1 ? "" : "s")", value: $mindfulnessLength, in: 1...10)
                                .frame(width: UIScreen.main.bounds.width/2)
                                .font(.title2)
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 70)
                
                Button {
                    showMindfulnessView.toggle()
                } label: {
                    Text("Start for \(mindfulnessLength) Minute\(mindfulnessLength == 1 ? "" : "s")")
                        .font(.title)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width-40, height: (UIScreen.main.bounds.width-40)/10)
                        .background(Color("MedPurp")) // 202, 145, 191
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                }
                
                .sheet(isPresented: $showMindfulnessView) {
                    MindfulnessTimerView(mindfulnessLength: $mindfulnessLength)
                }
                
                Spacer()
            }
        }
    }
}

struct MindfulnessTimerView: View {
    @State var reloadTimer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State var currentProgress: Float = 0
    @Binding var mindfulnessLength: Int
    
    var body: some View {
        VStack {
            CircularProgress(progress: $currentProgress, mindfulnessLength: $mindfulnessLength)
                .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/1.9)
        }
        .onReceive(reloadTimer) { _ in
            currentProgress += 1/(60*Float(mindfulnessLength))
        }
    }
}

struct CircularProgress: View {
    @Binding var progress: Float
    @Binding var mindfulnessLength: Int
    
    let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    @State var addTimer = Timer.publish(every: 60, on: .current, in: .common).autoconnect()
    @State var counter: Int = 0
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            Text("\(mindfulnessLength) Minute\(mindfulnessLength == 1 ? "" : "s") Mindfulness")
                .bold()
                .font(.largeTitle)
                .padding(.top, 10)
                .padding(.bottom, 40)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(.green)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                Text(String(format: "%.0f s", min(self.progress,1.0)*60.0*Float(mindfulnessLength)))
                    .font(.title)
                    .bold()
            }
            .padding(.bottom, 30)
            
            if (Int(String(format: "%.0f", min(self.progress,1.0)*60.0*Float(mindfulnessLength)))! >= 60*mindfulnessLength) {
                VStack(spacing: 12.0) {
                    Text("Congratulations!")
                        .bold()
                        .font(.title)
                    Text("You have completed \(mindfulnessLength) Minute\(mindfulnessLength == 1 ? "" : "s") of Mindfulness. Keep it Up!")
                        .font(.title2)
                }
            } else {
                Text("Refrain from looking at the screen, close your eyes.")
                    .multilineTextAlignment(.center)
            }
        }
        .onReceive(addTimer) { _ in
            counter += 1
            if counter == mindfulnessLength {
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
                
                if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
                    audioPlayer.stop()
                } else {
                    do {
                        try AVAudioSession.sharedInstance().setMode(.default)
                        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, options: AVAudioSession.CategoryOptions.duckOthers)
                        try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                        
                        let soundFile = Bundle.main.url(forResource: "Completed", withExtension: "mp3")
                        
                        guard soundFile != nil else {
                            return
                        }
                        
                        audioPlayer = try AVAudioPlayer(contentsOf: soundFile!)
                        audioPlayer?.volume = 60
                        audioPlayer?.numberOfLoops = 1
                        audioPlayer?.play()
                    } catch {
                        print(error.localizedDescription)
                    }
                }

                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
        }
    }
}

struct MindfulnessView_Previews: PreviewProvider {
    static var previews: some View {
        MindfulnessView()
    }
}
