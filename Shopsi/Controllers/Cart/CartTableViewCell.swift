//
//  CartTableViewCell.swift
//  Shopsi
//
//  Created by Preuttipan Janpen on 21/9/2561 BE.
//  Copyright © 2561 Preuttipan Janpen. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProductImage: UIImageView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var labelProductQutity: UILabel!
    @IBOutlet weak var buttonMinusQutity: UIButton!
    @IBOutlet weak var buttonPlusQutity: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
