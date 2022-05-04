//
//  ContactView.swift
//  MentalBuddy
//
//  Created by Ethan Chew on 7/4/22.
//

import SwiftUI

struct ContactView: View {
    struct ContactList: Hashable {
        let id = UUID()
        let name: String
        let number: String
        let openClose: String?
    }
    
    let contacts: [ContactList] = [ContactList(name: "National Care Hotline", number: "1800 202 6868", openClose: "8am-12am Daily"), ContactList(name: "Samaritans of Singapore", number: "1800 221 444", openClose: nil), ContactList(name: "Silver Ribbon Singapore", number: "+65 6385 3714", openClose: nil), ContactList(name: "TOUCHline (Counselling)", number: "1800 377 2252", openClose: nil)]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Need to talk to someone?")
                            .font(.system(size: 40))
                            .bold()
                        Group {
                            Text("Don't worry, it's ok").font(.title) + Text(" not to be ok").font(.title).foregroundColor(Color("DarkPurp")) + Text(".").font(.title)
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 20)
                .padding(.bottom, 40)
                            
                HStack() {
                    VStack(alignment: .leading, spacing: 15.0) {
                        Text("Contacts")
                            .bold()
                            .font(.largeTitle)
                        VStack(alignment: .leading, spacing: 14.0) {
                            ForEach(contacts, id: \.id) { contact in
                                VStack(alignment: .leading, spacing: 8.0) {
                                    Text(contact.name)
                                        .bold()
                                        .font(.title2)
                                    VStack(alignment: .leading, spacing: 5.0) {
                                        HStack(spacing: 1.0) {
                                            Text("Phone Number: ").font(.title2)
                                            Button(action: {
                                                let telephone = "tel://"
                                                let formattedString = telephone + contact.number
                                                guard let url = URL(string: formattedString) else { return }
                                                UIApplication.shared.open(url)
                                               }) {
                                               Text(contact.number).font(.title2)
                                            }
                                        }
                                        if let openingHrs = contact.openClose {
                                            Text("Opening Hours: \(openingHrs)")
                                                .font(.title2)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
            }
            .padding()
            .navigationBarTitle("")
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
