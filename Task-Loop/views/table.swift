//
//  table.swift
//  Task-Loop
//
//  Created by Jacob Tassinari on 11/30/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class table: UITableViewController {

    let stocks = stock.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        stocks.tasks.append(task(title: "jkl", taskDescription: "jkl", priorty: false, dateOfComplete: Date()))
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func uncomplete(indexPath: IndexPath) {
        let task = stocks.tasks[indexPath.row]
        task.completed = false
        
        if let cell = tableView.cellForRow(at: indexPath) as? Cell {
            cell.setup(task)
        }
    }
    func complete(indexPath: IndexPath) {
        let task = stocks.tasks[indexPath.row]
        task.completed = true
        
        if let cell = tableView.cellForRow(at: indexPath) as? Cell {
            cell.setup(task)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showtaskInfo" {
            let indexPath = self.tableView!.indexPathsForSelectedRows!.first!
            let task = stocks.tasks[indexPath.row]
            let vc = segue.destination as! info
            vc.details = task.taskDescription
            vc.name = task.title
            
            
        }
    }
    @IBAction func unwindToLoopWithSegue(segue: UIStoryboardSegue) {}
}
extension table{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my cell", for: indexPath) as! Cell
        let taskie = stocks.tasks[indexPath.row]
        cell.setup(taskie)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.stocks.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if self.stocks.tasks.count == 0 {
                tableView.reloadData()
            }
        }
        
        let task = stocks.tasks[indexPath.row]
        
        switch task.completed{
        case false:
            let complete = UITableViewRowAction(style: .normal, title: "uncomplete") { _, indexPath in
                self.complete(indexPath: indexPath)
            }
            
            return [deleteAction, complete]
            
        case true:
            let uncomplete = UITableViewRowAction(style: .normal, title: "completed") { _, indexPath in
                self.uncomplete(indexPath: indexPath)
            }
            return [deleteAction, uncomplete]
        }
    }
}
