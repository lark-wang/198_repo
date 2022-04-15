//
//  Quizlet_ishApp.swift
//  Quizlet-ish
//
//  Created by Ellen Zheng on 4/15/22.
//

import SwiftUI
import Firebase

@main
struct Quizlet_ishApp: App {
    
    init(){
        FirebaseApp.configure()
        AuthenticationService.signIn()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
