//
//  ShopCollectionViewCell.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    var shop: Shop?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    func refresh(shop: Shop) {
        self.shop = shop
        self.nombreLabel.text = shop.name
        self.shop?.logo_url.loadImageNSUrlSession(into: self.imageView)
    }
}
