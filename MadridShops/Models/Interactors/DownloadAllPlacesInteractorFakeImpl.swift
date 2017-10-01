//
//  DownloadAllPlacesInteractorFakeImpl.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

class DownloadAllPlacesInteractorFakeImpl: DownloadAllPlacesInteractor {
    func execute(onSuccess: @escaping (Places) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Places) -> Void, onError: errorClosure = nil) {
        let places = Places()
        
        for i in 0...10 {
            let place = Place(name: "Shop number \( i )")
            place.address = "Address \( 1 )"
            
            places.add(place: place)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(places)
        }
    }
}
