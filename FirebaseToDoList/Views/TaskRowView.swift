//
//  TaskRowView.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 31/1/2565 BE.
//

import SwiftUI

struct TaskRowView: View {
    
    let title: String
    let isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: {
                // TODO: Handle Completed Task
            }) {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(isCompleted ? Color.green : Color.gray)
            }
            .buttonStyle(PlainButtonStyle())
            if isCompleted {
                Text(title).strikethrough().foregroundColor(.gray)
            }
            else {
                Text(title)
            }
            
            Spacer()
        }
        .padding()
    }
}

