//
//  String+Image.swift
//  MadridShops
//
//  Created by Administrador on 13/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit;

extension String {
    func loadImage(into imageView: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data){
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }    
        }
    }
    
    func loadImageNSUrlSession(into imageView: UIImageView) {
        let session = URLSession.shared
        if let url = URL(string: self){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        if let data = data,
                            let image = UIImage(data: data) {
                            imageView.image = image
                        }
                    } else {
                        print("Error while downloading image \( self )")
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func downloadImageFromUrl(onSucces: @escaping (Data?) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        if let url = URL(string: self){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        if let data = data {
                            onSucces(data)
                        }
                    } else {
                        print("Error while downloading image \( self )")
                        if let afterError = onError {
                            afterError(error!)
                        }
                    }
                }
                
            }
            task.resume()
        }
        
    }
    
    func downloadImageFromUrl() -> Data? {
        if let url = URL(string: self),
            let data = NSData(contentsOf: url){
            return data as Data
        }
        return nil
    }
}
