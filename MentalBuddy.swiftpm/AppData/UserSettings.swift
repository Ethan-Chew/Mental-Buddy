//
//  UserSettings.swift
//  MentalBuddy
//
//  Created by Ethan Chew on 6/4/22.
//

import Foundation

class UserSettings: ObservableObject {
    let userDefaults = UserDefaults.standard
    
    @Published var username: String {
        didSet {
            userDefaults.set(username, forKey: "Username")
        }
    }
    
    @Published var isFirstOpen: Bool {
        didSet {
            userDefaults.set(isFirstOpen, forKey: "isFirstOpen")
        }
    }
    
    init() {
        self.username = userDefaults.string(forKey: "Username") ?? "User"
        if let firstOpen = userDefaults.object(forKey: "isFirstOpen") {
            self.isFirstOpen = firstOpen as! Bool
        } else {
            userDefaults.set(true, forKey: "isFirstOpen")
            self.isFirstOpen = userDefaults.bool(forKey: "isFirstOpen")
        }
    }
}
