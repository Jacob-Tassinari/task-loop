//
//  info.swift
//  Task-Loop
//
//  Created by Jacob Tassinari on 11/30/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class info: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var textView: UITextView!
    var details = String()
    var name = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = name
        textView.text = details

        // Do any additional setup after loading the view.
    }
    

}
