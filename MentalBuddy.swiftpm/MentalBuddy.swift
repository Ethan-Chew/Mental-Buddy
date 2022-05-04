import SwiftUI

@main
struct MentalBuddy: App {
    @ObservedObject var userSettings = UserSettings()
    @State var reloadScreen = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if (userSettings.isFirstOpen) {
                    FirstOpenNotif(isFirstOpen: $userSettings.isFirstOpen, username: $userSettings.username)
                }
            }
            .preferredColorScheme(.light)
            .onChange(of: userSettings.isFirstOpen) { _ in
                reloadScreen.toggle()
            }
        }
    }
}

struct FirstOpenNotif: View {
    @Binding var isFirstOpen: Bool
    @Binding var username: String
    @State var tempUsername: String = "User"
    @State var showInfoText = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 1.0) {
                Text("MentalBuddy")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                VStack(spacing: 12.0) {
                    Text("MentalBuddy was built to help advocate the importance of Mental Health to people around the world. ").font(.title2)
                    Text("MentalBuddy includes a Quiz, an Informative Section and a page for important contacts.").font(.title2)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom, 80)
                .multilineTextAlignment(.center)
                
                VStack(spacing: 20) {
                    VStack(spacing: 8) {
                        HStack(spacing: 5) {
                            Text("Username: ").font(.title2)
                            TextField(text: $tempUsername, prompt: Text("Username")) {
                                Text("Username")
                            }
                            .frame(width: 400)
                            .textFieldStyle(.roundedBorder)
                            .disableAutocorrection(true)
                            .font(.title2)
                        }
                        if showInfoText {
                            Text("Done!").font(.title2)
                        }
                    }
                    
                    Button {
                        showInfoText = true
                        username = tempUsername
                    } label: {
                        Text("Save Username")
                            .padding()
                            .frame(width: UIScreen.main.bounds.width/4, height: (UIScreen.main.bounds.width/6)-90)
                            .background(.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                            .font(.title2)
                    }
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
                Spacer()
                
                Text("Tap the Frame TWICE to dismiss this message. This message will not show again.").font(.title3)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
            }
            .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/2)
            .background(.white)
            .cornerRadius(50)
            .padding()
            .shadow(radius: 7)
            .onTapGesture(count: 2) {
                isFirstOpen = false
            }
            .onAppear() {
                tempUsername = username
            }
        }
    }
}
