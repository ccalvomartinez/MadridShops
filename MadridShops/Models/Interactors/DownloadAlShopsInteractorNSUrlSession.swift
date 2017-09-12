//
//  DownloadAlShopsInteractorNSUrlSession.swift
//  MadridShops
//
//  Created by Administrador on 12/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

class DownloadAlShopsInteractorNSUrlSession: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
         let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
               
                OperationQueue.main.addOperation {
                     assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
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
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}
