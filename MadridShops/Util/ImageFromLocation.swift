//
//  ImageFromLocation.swift
//  MadridShops
//
//  Created by Administrador on 30/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

public func imageFromLocation(latitude: Double, longitude: Double) -> Data? {
    let urlStringTemplate = Bundle.main.infoDictionary!["mapUrl"] as! String
    let urlString = String(format: urlStringTemplate, latitude, longitude, latitude,longitude)
    if let url = URL(string: urlString as String),
        let data = NSData(contentsOf: url){
        return data as Data
    }
    return nil
}

