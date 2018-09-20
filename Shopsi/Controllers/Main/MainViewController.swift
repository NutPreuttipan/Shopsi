//
//  MainViewController.swift
//  Shopsi
//
//  Created by Preuttipan Janpen on 17/9/2561 BE.
//  Copyright © 2561 Preuttipan Janpen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var collectionViewHotDeal: UICollectionView!
    @IBOutlet weak var collectionViewNewProduct: UICollectionView!
    
    @IBOutlet weak var scrollViewHighlightProduct: UIScrollView!
    
    var timer: Timer!
    
    let imageArray:[UIImage] = [UIImage(named: "dummy1.jpg")!, UIImage(named: "dummy7.jpg")!,UIImage(named: "dummy2.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupSlideScrollView()
        scrollViewHighlightProduct.delegate = self
        
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(setupScrollViewAutoScroll), userInfo: nil, repeats: true)
        
        
//        myButton.setTitle(RemoteControlValues.sharedInstance.text(forKey: .buttonText), for: .normal)
//        self.view.backgroundColor = RemoteControlValues.sharedInstance.color(forKey: .appPrimaryColor)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewHotDeal {
            let hotDealCell: MainCollectionViewCell = self.collectionViewHotDeal.dequeueReusableCell(withReuseIdentifier: "cellHotDeal", for: indexPath) as! MainCollectionViewCell
            
            hotDealCell.imageViewHotDealImage.image = UIImage(named: "dummy4.jpg")
            hotDealCell.labelHotDealDetail.text = "สกู๊ตเตอร์ไฟฟ้า Scooter Chuanglu มีดิสเบรค ทำความเร็วได้ 50+ กม./ชม."
            
            hotDealCell.labelHotDealPrice.text = "฿399.00"
            setupStrikeThroughLabel(label: hotDealCell.labelHotDealPrice)
            
            hotDealCell.labelHotDealSellPrice.text = "฿199.00"
            hotDealCell.labelHotDealDiscount.text = "50%"
            
            return hotDealCell
        } else {
            let newProductCell: MainCollectionViewCell = self.collectionViewNewProduct.dequeueReusableCell(withReuseIdentifier: "cellNewProduct", for: indexPath) as! MainCollectionViewCell
            
            
            newProductCell.imageViewNewProductImage.image = UIImage(named: "dummy5.jpg")
            newProductCell.labelNewProductDetail.text = "สกู๊ตเตอร์ไฟฟ้า Scooter Chuanglu มีดิสเบรค ทำความเร็วได้ 50+ กม./ชม."
            
            newProductCell.labelNewProductPrice.text = "฿399.00"
            setupStrikeThroughLabel(label: newProductCell.labelNewProductPrice)
            
            newProductCell.labelNewProductSellPrice.text = "฿199.00"
            newProductCell.labelNewProductDiscount.text = "50%"
            
            return newProductCell
        }
    }
    
    func setupSlideScrollView() {
        
        for i in 0 ..< imageArray.count {
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            let xPosition = self.scrollViewHighlightProduct.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.scrollViewHighlightProduct.frame.width, height: self.scrollViewHighlightProduct.frame.height)
    
            scrollViewHighlightProduct.contentSize.width = scrollViewHighlightProduct.frame.width * CGFloat(i + 1)
            scrollViewHighlightProduct.addSubview(imageView)

        }
    }
    
    @objc func setupScrollViewAutoScroll() {
        
        let pageWidth:CGFloat = self.scrollViewHighlightProduct.frame.width
        let maxWidth:CGFloat = pageWidth * CGFloat(imageArray.count)
        let contentOffset:CGFloat = self.scrollViewHighlightProduct.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth {
            slideToX = 0
        }
        
//        self.scrollViewHighlightProduct.setContentOffset(CGRect(x: slideToX, y: 0, width: pageWidth, height: self.scrollViewHighlightProduct.frame.height),animated: true)
        self.scrollViewHighlightProduct.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollViewHighlightProduct.frame.height), animated: true)
    }
    
    func setupStrikeThroughLabel(label: UILabel) {
        let strokeEffect: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.darkGray,
            ]
        let strokeString = NSAttributedString(string: label.text!, attributes: strokeEffect)
        label.attributedText = strokeString
    }
}
