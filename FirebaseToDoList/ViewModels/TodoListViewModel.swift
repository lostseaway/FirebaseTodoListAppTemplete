//
//  TodoListViewModel.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 1/2/2565 BE.
//

import Foundation
import Firebase
import CodableFirebase

class TodoListViewModel: ObservableObject {
    @Published var todoTasks: [Task] = []
    @Published var doneTasks: [Task] = []
    
    private let databaseRef: DatabaseReference
    private let uid: String
    
    init() {
        self.databaseRef = Database.database().reference()
        self.uid = Auth.auth().currentUser?.uid ?? ""
    }
    
    func signout() {
        try! Auth.auth().signOut()
    }
    
    func initListener() {
        self.databaseRef.child("users/\(uid)/tasks").observe(.value) { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let models = try FirebaseDecoder().decode(Dictionary<String, Task>.self, from: value)
                self.todoTasks = models.keys.compactMap { key in
                    return models[key]
                }
                .filter { task in !task.isCompleted }
                .sorted(by: { a, b in a.created_on < b.created_on })
                
                self.doneTasks = models.keys.compactMap { key in
                    return models[key]
                }
                .filter { task in task.isCompleted }
                .sorted(by: { a, b in a.created_on > b.created_on })
                
            } catch let error {
                print(error)
            }
            
        }
    }
    
    func addTask(title: String) {
        guard let autoId = self.databaseRef.child("users/\(uid)/tasks").childByAutoId().key else {
            return
        }
        
        let task = Task(id: autoId, title: title, created_on: Date(), isCompleted: false)
        self.databaseRef.child("users/\(uid)/tasks/\(task.id)").setValue(try! FirebaseEncoder().encode(task))
        
    }
    
    func markCompleted(task: Task) {
        self.databaseRef.child("users/\(uid)/tasks/\(task.id)").updateChildValues(["isCompleted": !task.isCompleted])
        
    }
    
    func removeTask(task: Task) {
        self.databaseRef.child("users/\(uid)/tasks/\(task.id)").removeValue()
        
    }
    
}
