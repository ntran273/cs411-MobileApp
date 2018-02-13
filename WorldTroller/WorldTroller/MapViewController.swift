//
//  MapViewController.swift
//  WorldTroller
//
//  Created by Nguyen Tran on 2/5/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController, CLLocationManagerDelegate {

    var mapView: MKMapView!
    var pins = [MKPointAnnotation]()
    var pinIndex = 0

    //var pinItem = 1
    
    //Location manager control user's location
    let locationManager = CLLocationManager()
    
    override func loadView(){
        print("MapViewController loaded its view");
        
        //Create view map
        mapView = MKMapView()
        
        //set the view of this view controller
        view = mapView
        
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
        
        //set up LOCATION button
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        button.setTitle("Current Location", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(MapViewController.buttonAction(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        let bottomConstraintBtn = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        let marginsBtn = view.layoutMarginsGuide
        let leadingConstraintBtn = button.leadingAnchor.constraint(equalTo: marginsBtn.leadingAnchor)
        let trailingConstraintBtn = button.trailingAnchor.constraint(equalTo: marginsBtn.trailingAnchor)
        
        bottomConstraintBtn.isActive = true
        leadingConstraintBtn.isActive = true
        trailingConstraintBtn.isActive = true
        
        
        //Set up PIN button
        let cycleButton = UIButton(type: .custom)
        cycleButton.setTitle("CyclePins", for: .normal)
        cycleButton.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        cycleButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        cycleButton.layer.cornerRadius = 0.2 * cycleButton.bounds.size.width
        cycleButton.clipsToBounds = true
        cycleButton.titleLabel!.text = "CyclePins"
        view.addSubview(cycleButton)
        
        let x2CenterConstraint = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: cycleButton, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(x2CenterConstraint)
        cycleButton.translatesAutoresizingMaskIntoConstraints = false
        let cyclebottomConstraintBtn = cycleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        cycleButton.addTarget(self, action: #selector(MapViewController.cyclePins(sender:)), for: .touchUpInside)


        cyclebottomConstraintBtn.isActive = true
        
        // Gold Challenge: Add 3 pins on the map
        
        let pin1 = MKPointAnnotation()
        pin1.coordinate =  CLLocationCoordinate2DMake(33.780220, -117.950789)
        pin1.title = "MyHouse"
        pin1.subtitle = "My house in US"

        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2DMake(10.755760,106.686591)
        pin2.title = "Hometown"
        pin2.subtitle = "My house in Vietnam"

        let pin3 = MKPointAnnotation()
        pin3.coordinate = CLLocationCoordinate2DMake(-0.477501, 73.485479)
        pin3.title = "Maldives"
        pin3.subtitle = "The Place I am Interested in"
        
        pins = [pin1, pin2, pin3]

        for p in pins {
            mapView.addAnnotation(p)
        }
        
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
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    //Set action for button - silver challenge
    @objc func buttonAction(sender: UIButton!) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        sender.isHidden = false
    }
    
    
    //Zoom to current location - silver challenge
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.00075, 0.00075)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
        
        self.mapView.userTrackingMode = .follow
        self.mapView.showsUserLocation = true
    }
    
    //CyclePin - GOld challenge
    @objc func cyclePins(sender: UIButton) {
        print("Cycling throug pins")
        
        let point = MKMapPointForCoordinate(mapView.annotations[pinIndex].coordinate)
        let pointRect = MKMapRectMake(point.x , point.y, 0.00075, 0.00075)
        mapView.setVisibleMapRect(pointRect, animated: true)
        pinIndex += 1
        if pinIndex >= 3 {
            pinIndex = 0
        }
        
    }
}
