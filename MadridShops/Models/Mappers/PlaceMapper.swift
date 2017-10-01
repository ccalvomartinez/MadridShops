//
//  ShopMapper.swift
//  MadridShops
//
//  Created by Administrador on 18/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

func mapShopCDIntoShop(shopCD: ShopCD) -> Place {
    let shop = Place(name: shopCD.name!)
    shop.address = shopCD.address ?? ""
    shop.description_en = shopCD.description_en ?? ""
    shop.description_es = shopCD.description_es ?? ""
    shop.image = shopCD.image
    shop.image_url = shopCD.image_url ?? ""
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    shop.logo = shopCD.logo
    shop.logo_url = shopCD.logo_url ?? ""
    shop.openingHours_en = shopCD.openingHours_en ?? ""
    shop.openingHours_es = shopCD.openingHours_es ?? ""
    
    return shop
}

func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Place) -> ShopCD {
    let shopCD = ShopCD(context: context)
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.description_en = shop.description_en
    shopCD.description_es = shop.description_es
    shopCD.image = shop.image
    shopCD.image_url = shop.image_url
    shopCD.latitude = shop.latitude ?? 0
    shopCD.longitude = shop.longitude ?? 0
    shopCD.logo = shop.logo
    shopCD.logo_url = shop.logo_url
    shopCD.openingHours_en = shop.openingHours_en
    shopCD.openingHours_es = shop.description_es
    
    return shopCD
}
