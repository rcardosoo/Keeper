//
//  NotaTableViewCell.swift
//  Keeper
//
//  Created by admin on 31/08/17.
//  Copyright © 2017 Kepper. All rights reserved.
//

import UIKit

class NotaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbData: UILabel!
    @IBOutlet weak var lbPrioridade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("CHEGOU NO SET SELECT DA TABLECELL")
        // Configure the view for the selected state
    }

}
