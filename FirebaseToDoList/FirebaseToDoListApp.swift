//
//  FirebaseToDoListApp.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 30/1/2565 BE.
//

import SwiftUI
import Firebase

@main
struct FirebaseToDoListApp: App {
    @State var isLoggedIn: Bool
    
    init() {
        FirebaseApp.configure()
        isLoggedIn = Auth.auth().currentUser != nil
    }
    
    var body: some Scene {
        WindowGroup {
            if !isLoggedIn {
                LoginView(isLoggedIn: $isLoggedIn)
            }
            else {
                TodoListView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
