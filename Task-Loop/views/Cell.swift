//
//  Cell.swift
//  Task-Loop
//
//  Created by Jacob Tassinari on 11/30/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var priortyL: UILabel!
    @IBOutlet weak var dateL: UILabel!
    func setup(_ type:task){
        titleL.text = type.title
        if type.priorty {
            priortyL.text = "Important"
        }else{
            priortyL.text = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateL.text = dateFormatter.string(from: type.dateOfComplete)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
