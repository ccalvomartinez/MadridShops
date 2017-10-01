//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by Administrador on 17/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

protocol SaveAllShopsInteractor {
    // execute: saves all shops. Return on the main thread
    func execute(shops: Places, context: NSManagedObjectContext, onSuccess: @escaping (Places) -> Void, onError: errorClosure)
    func execute(shops: Places, context: NSManagedObjectContext, onSuccess: @escaping (Places) -> Void)
}
