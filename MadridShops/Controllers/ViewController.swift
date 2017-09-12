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
        
     //let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadShopsInteractorNSOpImpl()
      let downloadShopsInteractor = DownloadAlShopsInteractorNSUrlSession()
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            self.shops = shops
            
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegway" {
            let vc = segue.destination as! ShopDetailViewController
            let indexPath = shopsCollectionView.indexPathsForSelectedItems![0]
            vc.shop = self.shops?.get(index: indexPath.row)
        }
    }
   
}

