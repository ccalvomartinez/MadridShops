//
//  DownloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

protocol DownloadAllShopsInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Shops) -> Void)
}
