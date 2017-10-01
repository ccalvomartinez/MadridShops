//
//  DownloadAlShopsInteractorNSUrlSession.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

class DownloadAlPlacesInteractorNSUrlSession: DownloadAllPlacesInteractor {
    func execute(onSuccess: @escaping (Places) -> Void, onError: errorClosure) {
        // TODO: Guardar la URL en app settings
        let urlString = "https://madrid-places.com/json_new/getShops.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                     assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let places = parseShops(data: data!)
                        
                        onSuccess(places)
                    } else {
                        if let onErrorLocal = onError {
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
