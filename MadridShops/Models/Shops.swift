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
    func get(index: Int) -> Shop
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
    
    public func get(index: Int) -> Shop {
        return (_shopsList?[index])!
    }
    
   
}
