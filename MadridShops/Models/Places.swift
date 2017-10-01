//
//  Shops.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

public protocol ShopsProocol {
    func count() -> Int
    func add(shop: Shop) -> Void
    func get(index: Int) -> Shop?
}
public class Shops: ShopsProocol {
    
    private var _shopsList: [Shop]?
    
    public init(){
        self._shopsList = []
    }
    public func count() -> Int {
        return _shopsList?.count ?? 0
    }
    
    public func add(shop: Shop) {
        _shopsList?.append(shop)
    }
    
    public func get(index: Int) -> Shop? {
        return (_shopsList?[index])!
    }
    
   
}

import CoreData
public class ShopsCD: ShopsProocol {
    
    private var _context: NSManagedObjectContext
    private var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    public init(_ context: NSManagedObjectContext){
        self._context = context
    }
    
    public func count() -> Int {
        let sectionInfo = fetchedResultsController.sections![0]
        return sectionInfo.numberOfObjects
    }
    
    public func add(shop: Shop) {
        let _ = mapShopIntoShopCD(context: self._context, shop: shop)
        _context.saveContext(onError: nil)
    }
    
    public func get(index: Int) -> Shop? {
        
        if let  shopCD = self._fetchedResultsController?.object(at: IndexPath(row: index, section: 0)) {
            return mapShopCDIntoShop(shopCD: shopCD)
        } else {
            return nil
        }
        
        
    }
    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
       
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        // fetchRequest == SELECT * FROM EVENT ORDER BY TIMESTAMP DESC
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self._context, sectionNameKeyPath: nil, cacheName: "ShopCache")
        //aFetchedResultsController.delegate = self
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    
}
