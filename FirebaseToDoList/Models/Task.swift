//
//  Task.swift
//  FirebaseToDoList
//
//  Created by Thunyathon  Jaruchotrattanasakul on 1/2/2565 BE.
//

import Foundation

struct Task: Codable, Identifiable {
    let id: String
    let title: String
    let created_on: Date
    var isCompleted: Bool
}
