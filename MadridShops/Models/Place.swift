//
//  Place.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

public class Place{
    let name: String
    var description_en: String = ""
    var description_es: String = ""
    var latitude: Double? = nil
    var longitude: Double? = nil
    var image_url: String = ""
    var image: Data? = nil
    var logo_url: String = ""
    var logo: Data? = nil
    var map: Data? = nil
    var openingHours_en: String = ""
    var openingHours_es: String = ""
    var address: String = ""

    var loalizedDescription: String {
        if (Locale.preferredLanguages[0] == "es") {
            return self.description_es
        }
        return self.description_en
    }
    
    var localizedOpeningHours: String {
        if (Locale.preferredLanguages[0] == "es") {
            return self.openingHours_es
        }
        return self.openingHours_en
    }
    public init(name: String) {
        self.name = name
    }
}
