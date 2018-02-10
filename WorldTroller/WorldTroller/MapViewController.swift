//
//  MapViewController.swift
//  WorldTroller
//
//  Created by Nguyen Tran on 2/5/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController : UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var mapView: MKMapView!
    var locationManager = CLLocationManager.init()
    
    @IBAction func zoomToCurrentLocation(_ sender: Any) {
        let span = MKCoordinateSpan.init(latitudeDelta: 0.00074, longitudeDelta: 0.00074)
        let region = MKCoordinateRegion.init(center: (locationManager.location?.coordinate)!, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    override func loadView(){
        print("MapViewController loaded its view");
        mapView = MKMapView();
        view = mapView;
        
        //
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        //set up segmentedControl
        //let segmentedControl = UISegmentedControl(items:["Standard","Hybrid","Satellite"]);
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5);
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.addTarget(self, action: #selector(MapViewController .mapTypeChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(segmentedControl)
        
        let sc = segmentedControl
        let margins = view.layoutMarginsGuide
        let topConstraint = sc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor);
        let leadingConstraint = sc.leadingAnchor.constraint(equalTo: margins.leadingAnchor);
        let trailingConstraint = sc.trailingAnchor.constraint(equalTo: margins.trailingAnchor);
        
        topConstraint.isActive = true;
        leadingConstraint.isActive = true;
        trailingConstraint.isActive = true;
        
        //set up button zoomin zoomout
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        print("MapViewController loaded its view.");
        
        //change location each time
        mapView.delegate = self
        
        //request user permission to use their location
        locationManager.requestWhenInUseAuthorization()
        
        //set default maptype standard
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.showsScale = true
        mapView.showsCompass = true
        
    }
    
    //Zoom to current location

    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.setCenter(userLocation.coordinate, animated: true)

    }
    
    
}
