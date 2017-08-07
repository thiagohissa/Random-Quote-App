//
//  CustomTableViewCell.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //MARK: Cell Properties
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
