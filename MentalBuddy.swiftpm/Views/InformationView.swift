//
//  InformationView.swift
//  MentalBuddy
//
//  Created by Ethan Chew on 6/4/22.
//

import SwiftUI

struct InformationView: View {
    
    @State var currentPage = 1
    
    var body: some View {
        ScrollView {
            VStack {
                switch currentPage {
                case 1:
                    PageOne()
                case 2:
                    PageTwo()
                case 3:
                    PageThree()
                case 4:
                    PageFour()
                case 5:
                    Credits()
                default:
                    PageOne()
                }
                
                Spacer()
                
                HStack(spacing: UIScreen.main.bounds.width/5) {
                    Button {
                        if currentPage != 1 {
                            currentPage -= 1
                        }
                    } label: {
                        if currentPage == 1 {
                            Image(systemName: "arrow.left")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "arrow.left")
                                .font(.largeTitle)
                        }
                    }
                    if currentPage == 5 {
                        Text("Credits")
                            .bold()
                            .font(.largeTitle)
                    } else {
                        Text("Page \(currentPage)")
                            .bold()
                            .font(.largeTitle)
                    }
                    Button {
                        if currentPage < 5 {
                            currentPage += 1
                        }
                    } label: {
                        if currentPage == 5 {
                            Image(systemName: "arrow.right")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "arrow.right")
                                .font(.largeTitle)
                        }
                    }
                }
                .padding(.top, 50)
                .padding(.bottom, 30)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            }
            .navigationBarTitle("")
        }
    }
}
struct PageOne: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 19) {
            VStack(alignment: .leading, spacing: 5) {
                Text("What is Mental Health?")
                    .font(.system(size: 40.0))
                    .bold()
                    .padding(.bottom, 2)
                HStack(spacing: 15) {
                    VStack {
                        Image("MentalHealth")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: (UIScreen.main.bounds.width/3)+2)
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading) {
                            Text("Mental Health is one's,")
                                .font(.title)
                            Group {
                                Text("1. ").font(.title2) + Text("Emotional").font(.title2).underline() + Text(" Wellbeing").font(.title2)
                            }
                            Group {
                                Text("2. ").font(.title2) + Text("Psychological").font(.title2).underline() + Text(" Wellbeing").font(.title2)
                            }
                            Group {
                                Text("3. ").font(.title2) + Text("Social").font(.title2).underline() + Text(" Wellbeing").font(.title2)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Affecting our Daily Activities such as being productive and having healthy relationships.").font(.title2)
                            Text("Which is a major issue as these things are something that every one of us needs to have.").font(.title2)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Why is Mental Health Important?")
                    .font(.system(size: 40.0))
                    .bold()
                    .padding(.bottom, 2)
                VStack(alignment: .leading, spacing: 4) {
                    Text("It affect how we Think, Feel and Act.").font(.title)
                    Text("A good mental state can keep us healthy and help prevent serious health conditions. However, poor mental health can lead to poor physical health or harmful behaviours.").font(.title2)
                    Text("But how can it affect us?").bold().font(.title)
                        .padding(.bottom, 5)
                        .padding(.top, 5)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("The Effects of Mental Wellness can affect anyone, from Children to the Elderly").font(.title2)
                        Text("For example, in the United States alone, more than a quarter of adults (aged 18 to 25 years old) had any mental illness in 2018, and nearly 8% of adults aged 18 to 25 years old had severe mental illness in 2018.").font(.title2)
                    }
                    Text("As you can see, Mental Illnesses can affect people of all ages, and it is also a widespread issue. So, what are some common mental illnesses and its symptoms").font(.title2)
                }
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct PageTwo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Common Mental Illnesses")
                .font(.system(size: 40.0))
                .bold()
                .padding(.bottom, 3)
            VStack(alignment: .leading, spacing: 5) {
                Text("Anxiety")
                    .bold().font(.title)
                    .padding(.bottom, 3)
                Text("Anxiety occurs in the form of regular panic attacks, which are sudden intense episodes of irrational fear, shortness of breath, dizziness and other physical symptoms.").font(.title2)
                Group {
                    Text("Affects").font(.title2) + Text(" 284 million people").font(.title2).bold() + Text(" in the world.").font(.title2)
                }
                Group {
                    Text("Anxiety disorders are highly treatable, yet only").font(.title2) + Text(" 36.9% ").font(.title2).bold() + Text(" of those suffering receive treatment.").font(.title2)
                }
                .padding(.bottom, 9)
                Text("What are the differences between normal Stress and Anxiety?").font(.title2).bold()
                Image("StressVSAnxiety")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width/3)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Depression")
                    .bold().font(.title)
                    .padding(.bottom, 3)
                HStack(spacing: 15) {
                    VStack {
                        Image("DepressionImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width/3)
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Depression is when one feels of unusually sad and/or have a loss of interest in activities one once enjoyed.").font(.title2)
                        Group {
                            Text("Affects").font(.title2) + Text(" 264 million people").font(.title2).bold() + Text(" in the world.").font(.title2)
                        }
                        Spacer()
                    }
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Obsessive Compulsive Disorder (OCD)")
                    .bold().font(.title)
                    .padding(.bottom, 3)
                HStack(spacing: 15) {
                    VStack {
                        Image("OCDImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width/3)
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("An uncontrollable, reoccurring thoughts and/or behaviors that he or she feels the urge to repeat over and over").font(.title2)
                        Group {
                            Text("Affects").font(.title2) + Text(" about 100 to 150 million people").font(.title2).bold() + Text(" in the world.").font(.title2)
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct PageThree: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            Text("Ways of Improving your Mental Health")
                .font(.system(size: 40.0))
                .bold()
                .padding(.bottom, 3)
            HStack(spacing: 15) {
                VStack {
                    Image("SupportSystem")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (UIScreen.main.bounds.width/8)-5)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("Build your Support System")
                        .bold().font(.title)
                        .padding(.bottom, 3)
                    Text("Stay connected with a group of people we can turn to when we need support. For example, a close friend, family members or anyone you are confortable talking to. It helps us feel better, and to see things from a different point of view.").font(.title2)
                }
            }
            HStack(spacing: 15) {
                VStack {
                    Image("SelfCare")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (UIScreen.main.bounds.width/8)-5)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("Taking some time off")
                        .bold().font(.title)
                        .padding(.bottom, 3)
                    Text("Despite our packed schedules, we should take at least 2-3 minutes off per day to do some self-reflection and meditate, taking off our minds from things that stress us.").font(.title2)
                }
            }
            HStack(spacing: 15) {
                VStack {
                    Image("Acceptance")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (UIScreen.main.bounds.width/8)-5)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("Acknowledging our Feelings")
                        .bold().font(.title)
                        .padding(.bottom, 3)
                    Text("Acknowledging our feelings is the first step in helping us understand how we truely feel. Identifying our feelings and thinking about what led to these feelings is a health and good practice to improve our Mental Wellness.").font(.title2)
                }
            }
            HStack(spacing: 15) {
                VStack {
                    Image("Acceptance2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (UIScreen.main.bounds.width/8)-5)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("Acceptance")
                        .bold().font(.title)
                        .padding(.bottom, 3)
                    Text("It is alright not to know the reason for how we came to feel a certain way. We can try to express this to the person we’re talking to in this manner instead, e.g. “I feel angry, but I don’t know why.”").font(.title2)
                }
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct PageFour: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("In Conclusion,")
                .font(.system(size: 40.0))
                .bold()
                .padding(.bottom, 3)
            VStack(alignment: .leading, spacing: 6) {
                Group {
                    Text("Always remember that it's ok").font(.title) + Text(" not to be ok").font(.title).foregroundColor(Color("DarkPurp")) + Text(".").font(.title)
                }
                Text("If you feel that you exhibit any symptoms or signs of Mental Illnesses, or is just not feeling well mentally, be sure to talk to someone you trust, or seek professional help.").font(.title)
                Text("As Human Beings, it is normal for us to feel disappointed or/and angry at ourselves from time to time. However, it's ok. Remember that you are not alone, and there will be people there to support you when you need it. :)").font(.title)
            }
            .padding(.bottom, 20)
            Group {
                Text("I hope that you have learnt a thing or two about Mental Wellness from reading this 'book'. If you do need additional information, try going online and searching. ").font(.title2) + Text("Thanks for reading!").font(.title2).italic()
            }
            Text("If you want to test yourselves about what you have learnt, feel free to go over to the Quiz Section of the app!").font(.title2).foregroundColor(.gray)
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct Credits: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Credits")
                .font(.system(size: 40.0))
                .bold()
                .padding(.bottom, 3)
            List {
                Section(header: Text("What is Mental Health?").bold().font(.title)) {
                    Button(action: {
                        guard let url = URL(string: "https://www.mentalhealth.gov/basics/what-is-mental-health") else { return }
                        UIApplication.shared.open(url)
                       }) {
                       Text("https://www.mentalhealth.gov/basics/what-is-mental-health").font(.title2)
                    }
                    Button(action: {
                        guard let url = URL(string: "https://www.psychiatry.org/patients-families/what-is-mental-illness") else { return }
                        UIApplication.shared.open(url)
                       }) {
                       Text("https://www.psychiatry.org/patients-families/what-is-mental-illness").font(.title2)
                    }
                }
            }
            Section(header: Text("Why is Mental Health Important?").bold().font(.title)) {
                Button(action: {
                    guard let url = URL(string: "https://www.mentalhealth.gov/basics/what-is-mental-health") else { return }
                    UIApplication.shared.open(url)
                   }) {
                   Text("https://www.mentalhealth.gov/basics/what-is-mental-health").font(.title2)
                }
                Button(action: {
                    guard let url = URL(string: "https://www.webmd.com/mental-health/how-does-mental-health-affect-physical-health#:~:") else { return }
                    UIApplication.shared.open(url)
                   }) {
                   Text("https://www.webmd.com/mental-health/how-does-mental-health-affect-physical-health#:~:").font(.title2)
                }
            }
            Section(header: Text("Common Mental Illnesses").bold().font(.title)) {
                Button(action: {
                    guard let url = URL(string: "https://www.emedicinehealth.com/what_are_seven_common_types_of_mental_disorders/article_em.htm") else { return }
                    UIApplication.shared.open(url)
                   }) {
                   Text("https://www.emedicinehealth.com/what_are_seven_common_types_of_mental_disorders/article_em.htm").font(.title2)
                }
                Button(action: {
                    guard let url = URL(string: "https://adaa.org/understanding-anxiety/facts-statistics") else { return }
                    UIApplication.shared.open(url)
                   }) {
                   Text("https://adaa.org/understanding-anxiety/facts-statistics").font(.title2)
                }
            }
            Section(header: Text("Ways of Improving your Mental Health").bold().font(.title)) {
                Button(action: {
                    guard let url = URL(string: "https://www.healthhub.sg/programmes/186/MindSG/Discover") else { return }
                    UIApplication.shared.open(url)
                   }) {
                   Text("https://www.healthhub.sg/programmes/186/MindSG/Discover").font(.title2)
                }
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
            .previewInterfaceOrientation(.portrait)
    }
}
