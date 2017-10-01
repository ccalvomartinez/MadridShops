//
//  Places.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

public protocol PlacesProocol {
    func count() -> Int
    func add(place: Place) -> Void
    func get(index: Int) -> Place?
}
public class Places: PlacesProocol {
    
    private var _placesList: [Place]?
    
    public init(){
        self._placesList = []
    }
    public func count() -> Int {
        return _placesList?.count ?? 0
    }
    
    public func add(place: Place) {
        _placesList?.append(place)
    }
    
    public func get(index: Int) -> Place? {
        return (_placesList?[index])!
    }
    
   
}

import CoreData
public class PlacesCD: PlacesProocol {
    
    private var _context: NSManagedObjectContext
    private var _fetchedResultsController: NSFetchedResultsController<PlaceCD>? = nil
    private var _areShops: Bool
    
    public init(_ context: NSManagedObjectContext, areShops: Bool){
        self._context = context
        self._areShops = areShops
    }
    
    public func count() -> Int {
        let sectionInfo = fetchedResultsController.sections![0]
        return sectionInfo.numberOfObjects
    }
    
    public func add(place: Place) {
        let _ = mapPlaceIntoPlaceCD(context: self._context, place: place, isShop: _areShops)
        _context.saveContext(onError: nil)
    }
    
    public func get(index: Int) -> Place? {
        
        if let  placeCD = self._fetchedResultsController?.object(at: IndexPath(row: index, section: 0)) {
            return mapPlaceCDIntoPlace(placeCD: placeCD)
        } else {
            return nil
        }
        
        
    }
    
    var fetchedResultsController: NSFetchedResultsController<PlaceCD> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<PlaceCD> = PlaceCD.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "isShop = %@", NSNumber(booleanLiteral: self._areShops))
    
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
       
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        // fetchRequest == SELECT * FROM EVENT ORDER BY TIMESTAMP DESC
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self._context, sectionNameKeyPath: nil, cacheName: "PlaceCache")
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
