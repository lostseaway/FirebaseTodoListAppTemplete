//
//  TodoListView.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 31/1/2565 BE.
//

import SwiftUI

struct TodoListView: View {
    
    enum Field: Hashable {
        case add
    }
    
    @State var newTaskTitle: String = ""
    @State var isAddingNewTask = false
    @FocusState private var textFieldFocus: Field?
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section("Todo") {
                        // TODO: Handle Dynamic Todo task
                        TaskRowView(title: "Doing Task", isCompleted: false)
                        if isAddingNewTask {
                            TextField("Add Your new Task!", text: $newTaskTitle)
                                .focused($textFieldFocus, equals: .add)
                                .onSubmit {
                                    isAddingNewTask = false
                                    newTaskTitle = ""
                                    
                                    // TODO: Handle Create task
                                }.padding()
                        }
                    }

                    Section("Done") {
                        // TODO: Handle Dynamic Done task
                        TaskRowView(title: "Done Task", isCompleted: true)
                    }
                }
                
                VStack {
                    Spacer()
                    if !isAddingNewTask {
                        Button(action: {
                            isAddingNewTask = true
                            textFieldFocus = .add
                        }, label: {
                            Image(systemName: "plus.circle").font(.system(size: 60))
                        })
                    }
                }
            }.navigationTitle("My Todo List")
                .toolbar(content: {
                    Button(action: {
                        // TODO: Handle User Sign Out
                    }, label: {
                        Label("", systemImage: "rectangle.portrait.and.arrow.right").foregroundColor(.red)
                    })
                })
            
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TodoListView()
        }
    }
}

