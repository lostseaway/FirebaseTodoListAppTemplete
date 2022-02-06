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
    
    @Binding var isLoggedIn: Bool
    
    @State var newTaskTitle: String = ""
    @State var isAddingNewTask = false
    @FocusState private var textFieldFocus: Field?
    
    @ObservedObject var viewModel: TodoListViewModel
    
    init(viewModel: TodoListViewModel = TodoListViewModel(), isLoggedIn: Binding<Bool>) {
        self.viewModel = viewModel
        self._isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section("Todo") {
                        ForEach(viewModel.todoTasks) { task in
                            TaskRowView(task: task, viewModel: viewModel)
                        }.onDelete(perform: { indexSet in
                            let index = indexSet[indexSet.startIndex]
                            viewModel.removeTask(task: viewModel.todoTasks[index])
                        })
                        
                        if isAddingNewTask {
                            TextField("Add Your new Task!", text: $newTaskTitle)
                                .focused($textFieldFocus, equals: .add)
                                .onSubmit {
                                    viewModel.addTask(title: newTaskTitle)
                                    
                                    isAddingNewTask = false
                                    newTaskTitle = ""
                                }.padding()
                        }
                    }

                    Section("Done") {
                        ForEach(viewModel.doneTasks) { task in
                            TaskRowView(task: task, viewModel: viewModel)
                        }.onDelete(perform: { indexSet in
                            let index = indexSet[indexSet.startIndex]
                            viewModel.removeTask(task: viewModel.doneTasks[index])
                        })
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
                        viewModel.signout()
                        isLoggedIn = false
                    }, label: {
                        Label("", systemImage: "rectangle.portrait.and.arrow.right").foregroundColor(.red)
                    })
                })
                .onAppear(perform: {
                    viewModel.initListener()
                })
            
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TodoListView(isLoggedIn: Binding.constant(true))
        }
    }
}

