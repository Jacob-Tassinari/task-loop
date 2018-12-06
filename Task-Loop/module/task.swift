//
//  task.swift
//  Task-Loop
//
//  Created by Jacob Tassinari on 11/30/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation

class task {
    let title:String
    let taskDescription:String
    var completed:Bool = false
    var dateOfComplete:Date
    var priorty:Bool
    init(title:String,taskDescription:String,priorty:Bool,dateOfComplete:Date) {
        self.title = title
        self.taskDescription = taskDescription
        self.priorty = priorty
        self.dateOfComplete = dateOfComplete
    }
}
