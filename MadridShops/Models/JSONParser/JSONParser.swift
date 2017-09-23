//
//  JSONParser.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

func parseShops(data: Data) -> Shops {
    let shops = Shops()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
       
        for shopJson in result {
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shop.logo_url = shopJson["logo_img"] as! String
            shop.description_en = shopJson["description_en"] as! String
            shop.description_es = shopJson["description_es"] as! String
            shop.image_url = shopJson["img"] as! String
            shop.latitude = shopJson["gps_lat"] as? Float
            shop.longitude = shopJson["gps_lon"] as? Float
            shop.openingHours_en = shopJson["opening_hours_en"] as! String
            shop.openingHours_es = shopJson["opening_hours_es"] as! String
            
            shops.add(shop: shop)
        }
    } catch {}
    return shops
}
