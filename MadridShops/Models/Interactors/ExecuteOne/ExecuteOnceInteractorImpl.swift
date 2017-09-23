//
//  ExecuteOnceInteractorImpl.swift
//  MadridShops
//
//  Created by Administrador on 18/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImpl: ExecuteOnceInteractor {
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "once") {
            
        } else {
            closure()
            
        }
        
    }
}
