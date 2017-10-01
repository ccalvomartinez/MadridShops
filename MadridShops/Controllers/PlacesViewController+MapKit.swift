//
//  PlacesViewController+MapKit.swift
//  MadridShops
//
//  Created by Administrador on 24/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation
import MapKit

extension PlacesViewController {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard (annotation is Annotation) else { return nil }
        let annotation = annotation as! Annotation
        
        let annotationIdentifier = "AnnotationView"
        var annotationView: MKAnnotationView?
        if let dequeueAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeueAnnotationView
            annotationView?.annotation = annotation
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            let calloutView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 23))
            calloutView.addSubview(UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 23)))
            annotationView?.leftCalloutAccessoryView = calloutView
        }
        
        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            let imageView = annotationView.leftCalloutAccessoryView?.subviews[0] as! UIImageView
            if let data = annotation.place.logo,
                let image = UIImage(data: data) {
                imageView.image = image
            } else {
                // TODO: Default image
            }
            
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(calloutTapped(sender:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.removeGestureRecognizer(view.gestureRecognizers!.first!)
    }
    @objc func calloutTapped(sender: UITapGestureRecognizer) {
        let view = sender.view as! MKAnnotationView
        if let annotation = view.annotation as? Annotation {
            
            self.performSegue(withIdentifier: "ShowPlaceDetailSegueManual", sender: annotation.place)
        }
    }
}
