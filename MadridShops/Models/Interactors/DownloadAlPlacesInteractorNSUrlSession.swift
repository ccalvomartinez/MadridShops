//
//  DownloadAlShopsInteractorNSUrlSession.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

class DownloadAlPlacesInteractorNSUrlSession: DownloadAllPlacesInteractor {
    
    private let _downloadShops: Bool
    
    init(loadShops: Bool) {
        self._downloadShops = loadShops
    }
    func execute(onSuccess: @escaping (Places) -> Void, onError: errorClosure) {
        
        var urlString = ""
        if self._downloadShops {
            urlString = Bundle.main.infoDictionary!["shopsUrl"] as! String
        } else {
             urlString = Bundle.main.infoDictionary!["activitiesUrl"] as! String
        }
        
        let session = URLSession.shared
        if let url = URL(string: urlString){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                     assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let places = parsePlaces(data: data!)
                        
                        onSuccess(places)
                    } else {
                        if let onErrorLocal = onError {
                            print( "Error downloading data from url: \(urlString) . Error: \(error!.localizedDescription)")
                            onErrorLocal(error!)
                        }
                    }
                }
            }
            task.resume()
            
        }
   }
    
    func execute(onSuccess: @escaping (Places) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
 
}
