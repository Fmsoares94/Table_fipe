//
//  MarcasTableViewCell.swift
//  tabela_fipe
//
//  Created by Felipe Moura Soares on 16/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import UIKit

class MarcasTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 4 
    }
    @IBOutlet weak var lbNameBrand: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
