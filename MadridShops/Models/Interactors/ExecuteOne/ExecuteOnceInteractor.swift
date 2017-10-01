//
//  ExecuteOnceInteractor.swift
//  MadridShops
//
//  Created by Administrador on 18/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

protocol ExecuteOnceInteractor {
    func execute(executeOnce: () -> Void, executeElse: (() -> Void)?)
}
