//
//  ViewController.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit
import CoreData

class PlacesViewController: UIViewController {

    var context: NSManagedObjectContext!
    var places: PlacesProocol?
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.places != nil {
            setCollectionViewDelegateAndDataSource()
        }
    }
    
    public func setCollectionViewDelegateAndDataSource() {
        self.placesCollectionView.delegate = self
        self.placesCollectionView.dataSource = self
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegway" {
            let vc = segue.destination as! ShopDetailViewController
            let indexPath = placesCollectionView.indexPathsForSelectedItems![0]
            vc.place = self.places?.get(index: indexPath.row)
        }
    }
 }

