//
//  PlaceDetailViewController.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController {

    var place: Place?
    @IBOutlet weak var placeDetailDescription: UITextView!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var openingHours: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.place?.name
        self.placeDetailDescription.text = place?.loalizedDescription
        self.openingHours.text = place?.localizedOpeningHours
        self.address.text = place?.address
        
        if let data = self.place?.map {
            self.placeImageView.image = UIImage(data: data)
        } else if let data = self.place?.image {
            self.placeImageView.image = UIImage(data: data)
        }
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
