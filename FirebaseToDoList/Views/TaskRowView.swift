//
//  TaskRowView.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 31/1/2565 BE.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: Task
    let viewModel: TodoListViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: {
                viewModel.markCompleted(task: task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(task.isCompleted ? Color.green : Color.gray)
            }
            .buttonStyle(PlainButtonStyle())
            if task.isCompleted {
                Text(task.title).strikethrough().foregroundColor(.gray)
            }
            else {
                Text(task.title)
            }
            
            Spacer()
        }
        .padding()
    }
}

