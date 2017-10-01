//
//  JSONParser.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

func parsePlaces(data: Data) -> Places {
    let places = Places()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
       
        for placeJson in result {
            let place = Place(name: placeJson["name"]! as! String)
            place.address = placeJson["address"]! as! String
            place.logo_url = placeJson["logo_img"] as! String
            place.description_en = placeJson["description_en"] as! String
            place.description_es = placeJson["description_es"] as! String
            place.image_url = placeJson["img"] as! String
            place.latitude = parseDouble(valueFromJSON: placeJson["gps_lat"])
            place.longitude = parseDouble(valueFromJSON: placeJson["gps_lon"])
            place.openingHours_en = placeJson["opening_hours_en"] as! String
            place.openingHours_es = placeJson["opening_hours_es"] as! String
            
            places.add(place: place)
        }
    } catch {}
    return places
}

func parseDouble(valueFromJSON: Any?) -> Double? {
    guard let value = valueFromJSON else {return nil}
    let valueToString = value as! String
    let valueTrimmed = valueToString.trimmingCharacters(in: .whitespacesAndNewlines)
    return Double(valueTrimmed)
}
