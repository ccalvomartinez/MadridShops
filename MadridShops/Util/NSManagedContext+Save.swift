//
//  NSManagedContext+Save.swift
//  MadridShops
//
//  Created by Administrador on 17/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData
extension NSManagedObjectContext{
    public func saveContext(onError: ((Error) -> Void)?) {
        if self.hasChanges {
            do {
                try self.save()
            } catch {
                let nserror = error as NSError
                guard let errorClosure = onError else { return }
                errorClosure(nserror)
            }
        }
    }
}

