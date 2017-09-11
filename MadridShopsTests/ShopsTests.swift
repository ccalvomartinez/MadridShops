//
//  ShopsTests.swift
//  MadridShopsTests
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGivenEmptyShops_NumberShopsIsZero() {
        let shops = Shops()
        XCTAssertEqual(0, shops.count())
    }
    
    func testShopsWithOneElement_NumberShopsIsOne() {
        let shops = Shops()
        shops.add(shop: Shop(name: "Corte Inglés"))
        XCTAssertEqual(1, shops.count())
    }
}
