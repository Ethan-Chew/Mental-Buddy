//
//  QuizView.swift
//  MentalBuddy
//
//  Created by Ethan Chew on 7/4/22.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var quizManager = QuizManager()
    @State var mySwitch: Bool = false
    
    var body: some View {
        VStack(spacing: 15.0) {
            VStack(alignment: .leading, spacing: 25.0) {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("Quiz")
                        .font(.system(size: 65))
                        .bold()
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("This Quiz will test you on things that you have learnt from the Information Section of this App!")
                            .font(.title2)
                        Text("This will help you to better understand the importance of mental health, and signs that you have to watch out for.")
                            .font(.title2)
                    }
                }
                
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("How does it work?")
                        .font(.title)
                        .bold()
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("There will be 5 Questions, with 4 Options. Click on the Option you feel suits the question the best.")
                            .font(.title2)
                        Text("If you are wrong, the correct answer will be highlighted in green, and a prompt will appear to explain why. If you get the question correct, your answer will be highlighted green.")
                            .font(.title2)
                    }
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 20)
            .padding(.leading, 30)
            .padding(.trailing, 30)
                        
            Spacer()
            
            // Start Quiz Button
            NavigationLink(destination: QuestionsView()) {
                HStack(spacing: 20.0) {
                    Image(systemName: "pencil")
                        .font(.title)
                    Text("Start Quiz")
                        .font(.title)
                    Spacer()
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width-40, height: (UIScreen.main.bounds.width-40)/10)
                .background(Color.green) // 202, 145, 191
                .foregroundColor(.white)
                .cornerRadius(10.0)
            }
            
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationBarTitle("")
    }
}

struct QuestionsView: View {
    @ObservedObject var quizData = QuizData()
    
    @State var presentAlert: Bool = false
    @State var finishedQuiz: Bool = false
    @State var alertData: [String] = []
    @State var goToFinish: Bool = false
    
    @State var qna: [QuizQuestion] = [QuizQuestion(quizQn: "", quizOptions: ["", "", "", ""], correctOption: .option1, incorrectExplain: "")]
    @State var questionIndex: Double = 0
    @State var currentQuestion: QuizQuestion = QuizQuestion(quizQn: "", quizOptions: ["", "", "", ""], correctOption: .option1, incorrectExplain: "")
    @State var reloadView: Bool = false
    @State var submittedAns: Bool = false
    @State var results = [false, false, false, false, false]
    @State var selectedOption: CorrectOptn = .none
    
    func loadQuizData() {
        var randomisedData = quizData.mainQuizData
        
        for _ in 0...3 {
            randomisedData.shuffle()
        }
        
        qna = []
        
        for i in 0..<5 {
            qna.append(randomisedData[i])
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProgressView("", value: questionIndex+1, total: 5)
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .font(.title2)
                Spacer()
                Text(currentQuestion.quizQn)
                    .bold()
                    .font(.largeTitle)
                    .padding()
                Spacer()
                VStack {
                    VStack {
                        // Option 1
                        Button {
                            if !submittedAns {
                                selectedOption = .option1
                            }
                        } label: {
                            HStack(spacing: 20.0) {
                                Text(currentQuestion.quizOptions[0])
                                    .font(.title2)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: (UIScreen.main.bounds.width-60)/10)
                            .background(submittedAns ? (currentQuestion.correctOption == .option1 ? .green : (selectedOption == .option1 ? .red : .gray)) : (selectedOption == .option1 ? Color("MedPurp") : .gray))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                        
                        // Option 2
                        Button {
                            if !submittedAns {
                                selectedOption = .option2
                            }
                        } label: {
                            HStack(spacing: 20.0) {
                                Text(currentQuestion.quizOptions[1])
                                    .font(.title2)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: (UIScreen.main.bounds.width-60)/10)
                            .background(submittedAns ? (currentQuestion.correctOption == .option2 ? .green : (selectedOption == .option2 ? .red : .gray)) : (selectedOption == .option2 ? Color("MedPurp") : .gray))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                        
                        // Option 3
                        Button {
                            if !submittedAns {
                                selectedOption = .option3
                            }
                        } label: {
                            HStack(spacing: 20.0) {
                                Text(currentQuestion.quizOptions[2])
                                    .font(.title2)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: (UIScreen.main.bounds.width-60)/10)
                            .background(submittedAns ? (currentQuestion.correctOption == .option3 ? .green : (selectedOption == .option3 ? .red : .gray)) : (selectedOption == .option3 ? Color("MedPurp") : .gray))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                        
                        // Option 4
                        Button {
                            if !submittedAns {
                                selectedOption = .option4
                            }
                        } label: {
                            HStack(spacing: 20.0) {
                                Text(currentQuestion.quizOptions[3])
                                    .font(.title2)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-80, height: (UIScreen.main.bounds.width-60)/10)
                            .background(submittedAns ? (currentQuestion.correctOption == .option4 ? .green : (selectedOption == .option4 ? .red : .gray)) : (selectedOption == .option4 ? Color("MedPurp") : .gray))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    // Submit Button
                    Button {
                        if submittedAns {

                            submittedAns = false
                            selectedOption = .none
                            
                            if finishedQuiz {
                                goToFinish = true
                            }
                            
                            if questionIndex+1 == 5.0 {
                                finishedQuiz = true
                            } else {
                                questionIndex += 1
                                currentQuestion = qna[Int(questionIndex)]
                            }
                            
                            if questionIndex > 5 {
                                questionIndex = 5
                            }
                        } else {
                            if questionIndex+1 == 5.0 {
                                finishedQuiz = true
                            }
                            
                            switch selectedOption {
                            case .none:
                                alertData = ["Missing Input!", "Please click an option before submitting your answer!"]
                                presentAlert = false
                                presentAlert = true
                            default:
                                if selectedOption == currentQuestion.correctOption {
                                    alertData = ["Correct!", "Good Job! It is the correct answer! Keep it up."]
                                    presentAlert = false
                                    presentAlert = true
                                    results[Int(questionIndex)] = true
                                    submittedAns = true
                                } else {
                                    alertData = ["Incorrect!", currentQuestion.incorrectExplain]
                                    presentAlert = false
                                    presentAlert = true
                                    submittedAns = true
                                }
                            }
                        }
                    } label: {
                        HStack(spacing: 20.0) {
                            Image(systemName: "paperplane").font(.title)
                            Text(questionIndex+1 != 5 ? (submittedAns ? "Next" : "Submit") : (submittedAns ? "Finish" : "Submit"))
                                .font(.title)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width-80, height: (UIScreen.main.bounds.width-60)/10)
                        .background(Color("NewBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                    }.padding(.bottom, 20)
                }
            }
            .onAppear() {
                if questionIndex == 0 {
                    loadQuizData()
                    currentQuestion = qna[Int(questionIndex)]
                }
            }
            .alert(isPresented: $presentAlert) {
                Alert(title: Text(alertData[0]), message: Text(alertData[1]), dismissButton: .default(Text("Ok!")))
            }
            .sheet(isPresented: $goToFinish) {
                FinishedQuizView(results: $results, questions: $qna)
        }
        }
    }
}

struct FinishedQuizView: View {
    @Binding var results: [Bool]
    @Binding var questions: [QuizQuestion]

    @State var encouragementTxt = ""
    @State var colour: Color = Color.green
    @State var progress: Float = 0.0
    
    var body: some View {
        VStack {
            Text(encouragementTxt)
                .bold()
                .font(.largeTitle)
                .padding(.top, 30)
                .padding(.bottom, 40)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(colour)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(colour)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                Text(String(format: "%.0f %%", min(self.progress,1.0)*100.0))
                    .font(.title)
                    .bold()
            }
            .frame(width: UIScreen.main.bounds.width/2.2)
            .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text("Question Breakdown")
                    .bold()
                    .font(.title)
                    .padding()
                List {
                    ForEach(0..<5) { index in
                        Text("\(questions[index].quizQn) -- \(results[index] ? "Correct" : "Wrong")")
                    }
                }
            }
        }
        .onAppear() {
            var score: Double = 0
            for result in results {
                if result {
                    score += 1.0
                }
            }
            let percentage = Double((score/5)*100)
            if percentage >= 80.0 {
                colour = Color.green
                encouragementTxt = "Good Job!"
            } else if percentage >= 50.0 {
                colour = Color.yellow
                encouragementTxt = "So Close!"
            } else {
                colour = Color.red
                encouragementTxt = "You can do it!"
            }
            
            progress = Float(percentage/100)
        }
    }
}

class QuizManager: ObservableObject {
    enum QuizState {
        case notStarted
        case questions
        case endOfQuiz
    }
    
    @Published var quizState: QuizState = .notStarted
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
