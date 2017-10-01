//
//  DownloadAllPlacesInteractor.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

protocol DownloadAllPlacesInteractor {
    // execute: downloads all places. Return on the main thread
    func execute(onSuccess: @escaping (Places) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Places) -> Void)
}
