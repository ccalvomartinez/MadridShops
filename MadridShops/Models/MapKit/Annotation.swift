//
//  Annotation.swift
//  MadridShops
//
//  Created by Administrador on 24/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var place: Place
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, place: Place) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.place = place
    }
}
