//
//  LoginView.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 30/1/2565 BE.
//

import SwiftUI

struct LoginView: View {
    @State var email = "abc@gg.com"
    @State var password = "123456"
    @State var isAlertPresented = false
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    @ObservedObject var viewModel: LoginViewModel
    
    @Binding var isLoggedIn: Bool
    
    init(viewModel: LoginViewModel = LoginViewModel(), isLoggedIn: Binding<Bool>) {
        self.viewModel = viewModel
        self._isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Login").font(.title).fontWeight(.bold)
                    Text("Please sign in to continue").font(.subheadline).foregroundColor(.gray)
                }.padding()
                
                VStack(alignment: .leading, spacing: 32) {
                    TextField("Email", text: $email).textFieldStyle(.roundedBorder)
                    SecureField("Password", text: $password).textFieldStyle(.roundedBorder)
                }.padding()
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.login(email: email, password: password, completion: { isSuccess, message in
                            if(isSuccess) {
                                alertTitle = "Success"
                                alertMessage = "Login Successful!"
                                isAlertPresented = true
                                viewModel.isLoggedIn = true
                            }
                            else {
                                alertTitle = "Fail"
                                alertMessage = message ?? ""
                                isAlertPresented = true
                            }
                        })
                    }, label: { Label("Login", systemImage: "chevron.right") })
                }.padding()
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.signup(email: email, password: password, completion: { isSuccess, message in
                            print(message ?? "")
                        })
                    }, label: { Label("Sign Up", systemImage: "chevron.right") })
                }.padding()
                
            }.background(.white)
                .cornerRadius(20)
                .padding()
                .alert(isPresented: $isAlertPresented, content: {
                    Alert(
                        title: Text(alertTitle),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("Ok"),
                                                action: {
                                                    isLoggedIn = viewModel.isLoggedIn
                                                }))

                })
                
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: Binding.constant(false))
    }
}



