//
//  ViewController.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shops: Shops?
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorFakeImpl()
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            self.shops = shops
            
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
        })
    }

   
}

