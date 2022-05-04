//
//  QuizData.swift
//  MentalBuddy
//
//  Created by Ethan Chew on 7/4/22.
//

import Foundation

enum CorrectOptn {
    case option1, option2, option3, option4, none
}

struct QuizQuestion: Hashable {
    let id = UUID()
    let quizQn: String
    let quizOptions: [String]
    let correctOption: CorrectOptn
    let incorrectExplain: String
}

class QuizData: ObservableObject {
    @Published var mainQuizData: [QuizQuestion] = [QuizQuestion(quizQn: "How many people suffer from anxiety in the world?", quizOptions: ["284 Million", "264 Million", "210 Million", "240 Million"], correctOption: .option1, incorrectExplain: "In the world, 284 Million People suffer from Anxiety."), QuizQuestion(quizQn: "Who is most likely to get a Mental Illness?", quizOptions: ["Poorer People", "People that experience high stress", "People in poor health", "Anyone can get a Mental Illness"], correctOption: .option4, incorrectExplain: "Mental Illnesses can affect anyone, of all race, language, religion and socio-economic status."), QuizQuestion(quizQn: "Anxiety presents itself as, ", quizOptions: ["A feeling of being overwhelmed, Loneliness", "Anxious Thoughts", "A feeling of uneasiness, dread", "Loss of interest in activities one used to like"], correctOption: .option3, incorrectExplain: "Anxiety is one's body's response to stress. A symptom of Anxiety is feeling uneasiness and/or dread, while Option 1 and 2 are symptoms of Stress, and Option 4 is a symptom of Depression."), QuizQuestion(quizQn: "Can Mental Illnesses be treated?", quizOptions: ["Yes, it can be treated in different ways (Medication, Councelling, etc)", "Yes, it can be treated very quickly with medication", "No, it will always come back", "No, it is a life sentence"], correctOption: .option1, incorrectExplain: "Mental Illnesses can be treated through different ways like therapy, medication or councelling. However, it will not be an overnight cure, but will take time. People with Mental Illnesses do recover completely."), QuizQuestion(quizQn: "Mental Illnesses are,", quizOptions: ["Rare", "Very Common", "Quite Common", "Do not exist"], correctOption: .option2, incorrectExplain: "Mental Illnesses are very common, and affects nearly 1 billion people worldwide."), QuizQuestion(quizQn: "How can we help someone with poor Mental Health?", quizOptions: ["Cnnecting them to Mental Health helplines", "Allowing them learn about the facts and myths of Mental Health", "Reaching out and letting them know they are not alone", "All of the above"], correctOption: .option4, incorrectExplain: "If you do know someone with a poor Mental Health, you can help them by some of the ways stated, and if needed, you can always consult a Mental Health helpline to learn more about how to help them more effectively."), QuizQuestion(quizQn: "How can Mental Illnesses affect us?", quizOptions: ["It does not affect us", "Affects all of our Daily Activities", "It affects us in our work/school", "It affects our Social Life"], correctOption: .option2, incorrectExplain: "Having a Mental Illness can affect us in whatever you do.")]
}
