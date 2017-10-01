//
//  SaveAllPlacesInteractorImpl.swift
//  MadridShops
//
//  Created by Administrador on 17/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

class SaveAllPlacesInteractorImpl: SaveAllPlacesInteractor  {
     
    func execute(places: PlacesProocol, areShops: Bool, context: NSManagedObjectContext, onSuccess: @escaping (PlacesProocol) -> Void, onError: errorClosure) {
        let returnPlaces = PlacesCD(context, areShops: areShops)
        
        for i in 0..<places.count() {
            if let place = places.get(index: i) {
                place.image = place.image_url.downloadImageFromUrl()
                place.logo  = place.logo_url.downloadImageFromUrl()
                if let latitude = place.latitude,
                    let longitude = place.longitude {
                    place.map = imageFromLocation(latitude: latitude, longitude: longitude)
                }
                let _ = mapPlaceIntoPlaceCD(context: context, place: place, isShop: areShops)
            }
        }
        do {
            try context.save()
            onSuccess(returnPlaces)
        } catch {
            let nserror = error as NSError
            print("Error catching data. Error: \(nserror.localizedDescription)")
            guard let errorClosure = onError else { return }
            errorClosure(nserror)
        }
    }
    
    func execute(places: PlacesProocol, areShops: Bool, context: NSManagedObjectContext, onSuccess: @escaping (PlacesProocol) -> Void) {
        execute(places: places, areShops: areShops, context: context, onSuccess: onSuccess, onError: nil)
    }
}
