//
//  ViewController.swift
//  MadridShops
//
//  Created by Administrador on 10/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class PlacesViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var context: NSManagedObjectContext!
    var places: PlacesProocol?
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.places != nil {
            setCollectionViewDelegateAndDataSource()
        }
        setupMap()
        addAnnotations()
    }
    
    func setupMap() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        let madridLocation = CLLocation(latitude:40.41889 , longitude: -3.69194)
        self.mapView.setCenter(madridLocation.coordinate, animated: true)
        let madridRegion = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        self.mapView.setRegion(madridRegion, animated: true)
        self.mapView.delegate = self
    }
    
    func addAnnotations() {
        guard let places = self.places else {return}
        for i in 0..<places.count() {
            if let place = places.get(index: i),
                let longitude = place.longitude,
                let latitude = place.latitude {
                    let coordinates = CLLocation(latitude: latitude, longitude: longitude)
                    self.mapView.addAnnotation(Annotation(coordinate: coordinates.coordinate, title: place.name, subtitle: "", place: place))
                }
                
            }
        }
   
    public func setCollectionViewDelegateAndDataSource() {
        self.placesCollectionView.delegate = self
        self.placesCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlaceDetailSegue" {
            let vc = segue.destination as! PlaceDetailViewController
            let indexPath = placesCollectionView.indexPathsForSelectedItems![0]
            vc.place = self.places?.get(index: indexPath.row)
        }
        if segue.identifier == "ShowPlaceDetailSegueManual" {
            if let place = sender as? Place {
                let vc = segue.destination as! PlaceDetailViewController
                vc.place = place
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ShowPlaceDetailSegueManual" {
            if let _ = sender as? Place {
                return true
            } else {
                return false
            }
        }
        return true
    }
 }

