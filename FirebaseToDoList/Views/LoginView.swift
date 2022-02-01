//
//  LoginView.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 30/1/2565 BE.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
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
                        // TODO: Implement Login Function
                    }, label: { Label("Login", systemImage: "chevron.right") })
                }.padding()
                
                HStack {
                    Spacer()
                    Button(action: {
                        // TODO: Implement Sign Up Function
                    }, label: { Label("Sign Up", systemImage: "chevron.right") })
                }.padding()
                
            }.background(.white)
                .cornerRadius(20)
                .padding()
                
            // TODO: Notify User when Login / Signup Unsuccess
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



