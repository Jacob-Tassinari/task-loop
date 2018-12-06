//
//  stock.swift
//  Task-Loop
//
//  Created by Jacob Tassinari on 11/30/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation

class stock {
    // Singleton!😕
    static let sharedInstance = stock()
    var tasks = [task]()
}
