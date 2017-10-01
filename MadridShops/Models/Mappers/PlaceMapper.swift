//
//  PlaceMapper.swift
//  MadridShops
//
//  Created by Administrador on 18/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

func mapPlaceCDIntoPlace(placeCD: PlaceCD) -> Place {
    let place = Place(name: placeCD.name!)
    place.address = placeCD.address ?? ""
    place.description_en = placeCD.description_en ?? ""
    place.description_es = placeCD.description_es ?? ""
    place.image = placeCD.image
    place.image_url = placeCD.image_url ?? ""
    place.latitude = placeCD.latitude
    place.longitude = placeCD.longitude
    place.logo = placeCD.logo
    place.logo_url = placeCD.logo_url ?? ""
    place.openingHours_en = placeCD.openingHours_en ?? ""
    place.openingHours_es = placeCD.openingHours_es ?? ""
    place.map = placeCD.map
    
    return place
}

func mapPlaceIntoPlaceCD(context: NSManagedObjectContext, place: Place, isShop: Bool) -> PlaceCD {
    let placeCD = PlaceCD(context: context)
    placeCD.name = place.name
    placeCD.address = place.address
    placeCD.description_en = place.description_en
    placeCD.description_es = place.description_es
    placeCD.image = place.image
    placeCD.image_url = place.image_url
    placeCD.latitude = place.latitude ?? 0
    placeCD.longitude = place.longitude ?? 0
    placeCD.logo = place.logo
    placeCD.logo_url = place.logo_url
    placeCD.openingHours_en = place.openingHours_en
    placeCD.openingHours_es = place.description_es
    placeCD.isShop = isShop
    placeCD.map = place.map
    
    return placeCD
}
