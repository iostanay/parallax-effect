//
//  cell.swift
//  parallax effect
//
//  Created by apple on 24/03/18.
//  Copyright © 2018 Tanay Bhattacharjee. All rights reserved.
//

import UIKit

class cell: UITableViewCell {

    @IBOutlet weak var main_view: UIView!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
           selectionStyle = .none
    }

  

}
