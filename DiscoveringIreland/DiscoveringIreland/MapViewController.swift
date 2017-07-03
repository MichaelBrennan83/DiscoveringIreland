//
//  MapViewController.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 12/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //
    @IBOutlet weak var mapView: MKMapView!
    
    let loacationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loacationManager.delegate = self
        self.loacationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.loacationManager.requestWhenInUseAuthorization()
        self.loacationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
        self.loacationManager.stopUpdatingLocation()
    }
    
}

