//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by Administrador on 17/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImpl: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        
        for i in 0..<shops.count() {
            if let shop = shops.get(index: i) {
                shop.image = shop.image_url.downloadImageFromUrl()
                shop.logo  = shop.logo_url.downloadImageFromUrl()
                let _ = mapShopIntoShopCD(context: context, shop: shop)
            }
        }
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            let nserror = error as NSError
            guard let errorClosure = onError else { return }
            errorClosure(nserror)
        }
        //context.saveContext(onError: onError)
        //onSuccess(shops)
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
}
