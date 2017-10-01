//
//  SaveAllPlacesInteractorImpl.swift
//  MadridShops
//
//  Created by Administrador on 17/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

class SaveAllPlacesInteractorImpl: SaveAllPlacesInteractor  {
     
    func execute(places: Places, areShops: Bool, context: NSManagedObjectContext, onSuccess: @escaping (Places) -> Void, onError: errorClosure) {
        
        for i in 0..<places.count() {
            if let place = places.get(index: i) {
                place.image = place.image_url.downloadImageFromUrl()
                place.logo  = place.logo_url.downloadImageFromUrl()
                let _ = mapPlaceIntoPlaceCD(context: context, place: place, isShop: areShops)
            }
        }
        do {
            try context.save()
            onSuccess(places)
        } catch {
            let nserror = error as NSError
            guard let errorClosure = onError else { return }
            errorClosure(nserror)
        }
        //context.saveContext(onError: onError)
        //onSuccess(places)
    }
    
    func execute(places: Places, areShops: Bool, context: NSManagedObjectContext, onSuccess: @escaping (Places) -> Void) {
        execute(places: places, areShops: areShops, context: context, onSuccess: onSuccess, onError: nil)
    }
}
