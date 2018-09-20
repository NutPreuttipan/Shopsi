//
//  MainCollectionViewCell.swift
//  Shopsi
//
//  Created by Preuttipan Janpen on 17/9/2561 BE.
//  Copyright © 2561 Preuttipan Janpen. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    //hot deal
    @IBOutlet weak var imageViewHotDealImage: UIImageView!
    @IBOutlet weak var labelHotDealDetail: UILabel!
    @IBOutlet weak var labelHotDealPrice: UILabel!
    @IBOutlet weak var labelHotDealSellPrice: UILabel!
    @IBOutlet weak var labelHotDealDiscount: UILabel!

    //new product
    @IBOutlet weak var imageViewNewProductImage: UIImageView!
    @IBOutlet weak var labelNewProductDetail: UILabel!
    @IBOutlet weak var labelNewProductPrice: UILabel!
    @IBOutlet weak var labelNewProductSellPrice: UILabel!
    @IBOutlet weak var labelNewProductDiscount: UILabel!
}
