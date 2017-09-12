//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    var shop: Shop?
    @IBOutlet weak var shopDetailDescription: UITextView!
    @IBOutlet weak var shopImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.shop?.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
