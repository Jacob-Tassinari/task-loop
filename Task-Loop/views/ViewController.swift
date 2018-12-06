//
//  ViewController.swift
//  Task-Loop
//
//  Created by Jacob Tassinari on 11/26/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titletext: UITextField!
    @IBOutlet weak var detailtext: UITextView!
    @IBOutlet weak var segmeantedControler: UISegmentedControl!
    @IBOutlet weak var numberofDays: UITextField!
    
    
    var newTask: task?
    
    @IBAction func Tap(_ sender: Any) {
        trySaving()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func trySaving() {
  
        // title
        guard let title = titletext.text else { return }
        
        // details
        guard let details = detailtext.text else { return }
        
        //date
        guard let date:Int = Int(numberofDays.text!) else { return }
        let currentCalender = Calendar.current
        let duedate = currentCalender.date(byAdding: .day, value: date, to: Date())
        
        //priorty
        let priortyT = segmeantedControler.selectedSegmentIndex
        let priorty:Bool?
        if priortyT == 1 {
            priorty = false
        } else {
            priorty = true
        }
        
        
        newTask = task(title: title, taskDescription: details, priorty: priorty!,dateOfComplete:duedate!)
        print("hello")
        
    
        self.performSegue(withIdentifier: "highway", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "highway" {
            let stocks = stock.sharedInstance
            stocks.tasks.append(newTask!)
            let vc = segue.destination as! table
            vc.tableView.reloadData()
        }
    }

    
}

