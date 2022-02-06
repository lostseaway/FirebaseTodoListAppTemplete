//
//  LoginViewModel.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 1/2/2565 BE.
//

import Firebase
import Combine

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func login(email: String, password: String, completion: @escaping (_ isSuccess: Bool, _ message: String?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if(error != nil) {
                completion(false, error?.localizedDescription ?? "")
            }
            else {
                completion(true, nil)
            }
        }
    }
    
    func signup(email: String, password: String, completion: @escaping (_ isSuccess: Bool, _ message: String?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if(error != nil) {
                completion(false, error?.localizedDescription ?? "")
            }
            else {
                completion(true, nil)
            }
        }
    }
}
