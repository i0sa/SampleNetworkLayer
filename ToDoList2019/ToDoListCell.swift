//
//  ToDoListCell.swift
//  ToDoList2019
//
//  Created by Osama on 5/22/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class ToDoListCell: UITableViewCell {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: ToDoModel) {
        lbl.text = data.title
        desc.text = data.description
        date.text = data.date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
