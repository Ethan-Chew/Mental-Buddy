//
//  ContentView.swift
//  MentalBuddy
//
//  Created by Ethan Chew on 6/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userSettings = UserSettings()
    @State var showFirstOpen = false
    
    var body: some View {
        ZStack {
            MainScreen()
        }
        .onChange(of: userSettings.isFirstOpen) { _ in
            if (userSettings.isFirstOpen == false) {
                showFirstOpen.toggle()
            }
        }
    }
}

struct MainScreen: View {
    @ObservedObject var userSettings = UserSettings()
    @State var username = "User"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    // Top Text
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Hello \(username),")
                                .bold()
                                .font(.system(size: 65))
                            Text("Welcome to MentalBuddy!")
                                .font(.title)
                        }
                        .padding(.leading, 30)
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                    
                    Spacer()
                    
                    Image("Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.width/1.9)
                    
                    Spacer()
                    
                    // Button Area
                    VStack(spacing: 15.0) {
                        // Information Button
                        NavigationLink(destination: InformationView()) {
                            HStack(spacing: 20.0) {
                                Image(systemName: "info.circle")
                                    .font(.title)
                                Text("Information Area")
                                    .font(.title)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-60, height: (UIScreen.main.bounds.width-60)/10)
                            .background(Color("DarkPurp")) // 202, 145, 191
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                        
                        // Mindfulness Button
                        NavigationLink(destination: MindfulnessView()) {
                            HStack(spacing: 20.0) {
                                Image(systemName: "heart")
                                    .font(.title)
                                Text("Mindfulness")
                                    .font(.title)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-60, height: (UIScreen.main.bounds.width-60)/10)
                            .background(Color("MedPurp"))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                        
                        // Quiz Button
                        NavigationLink(destination: QuizView()) {
                            HStack(spacing: 20.0) {
                                Image(systemName: "book")
                                    .font(.title)
                                Text("Quiz")
                                    .font(.title)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-60, height: (UIScreen.main.bounds.width-60)/10)
                            .background(Color("NewBlue"))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                        
                        // Contacts Button
                        NavigationLink(destination: ContactView()) {
                            HStack(spacing: 20.0) {
                                Image(systemName: "phone.arrow.up.right")
                                    .font(.title)
                                Text("Important Contacts")
                                    .font(.title)
                                Spacer()
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-60, height: (UIScreen.main.bounds.width-60)/10)
                            .background(.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                        }
                    }
                    Spacer()
                    Text("MentalBuddy was created by Ethan Chew for the Swift Student Challenge 2022")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding()
                }
                .onAppear() {
                    username = userSettings.username
                }
                .onChange(of: userSettings.isFirstOpen) { _ in
                    username = userSettings.username
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("Home")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
