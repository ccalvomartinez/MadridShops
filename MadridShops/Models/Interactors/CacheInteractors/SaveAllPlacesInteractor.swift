//
//  SaveAllPlacesInteractor.swift
//  MadridShops
//
//  Created by Administrador on 17/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

protocol SaveAllPlacesInteractor {
    // execute: saves all places. Return on the main thread
    func execute(places: PlacesProocol, areShops: Bool,  context: NSManagedObjectContext, onSuccess: @escaping (PlacesProocol) -> Void, onError: errorClosure)
    func execute(places: PlacesProocol, areShops: Bool, context: NSManagedObjectContext, onSuccess: @escaping (PlacesProocol) -> Void)
}
