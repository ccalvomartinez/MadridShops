//
//  PlaceCollectionViewCell.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    
    var place: Place?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    func refresh(place: Place) {
        self.place = place
        self.nombreLabel.text = place.name
        if let data = self.place?.logo {
            self.imageView.image = UIImage(data: data)
        }
        
       
    }
}
