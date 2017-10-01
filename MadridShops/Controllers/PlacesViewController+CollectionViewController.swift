//
//  PlacesViewController+CollectionViewController.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.places?.count())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlaceCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCell", for: indexPath) as! PlaceCollectionViewCell
        
        cell.refresh(place: (self.places?.get(index: indexPath.row))!)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
