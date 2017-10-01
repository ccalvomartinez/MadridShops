//
//  Shop.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

public class Shop{
    let name: String
    var description_en: String = ""
    var description_es: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image_url: String = ""
    var image: Data? = nil
    var logo_url: String = ""
    var logo: Data? = nil
    var openingHours_en: String = ""
    var openingHours_es: String = ""
    var address: String = ""

    public init(name: String) {
        self.name = name
    }
}
