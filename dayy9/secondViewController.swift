//
//  secondViewController.swift
//  dayy9
//
//  Created by rawan  on 9/9/23.
//  Copyright © 2023 rawan . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class secondViewController: UIViewController {

    @IBOutlet weak var secmapView: MKMapView!
    var seclocationMgr = CLLocationManager()
    var copiedlocation = CLLocationCoordinate2D()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
              secmapView.delegate = self
               
               seclocationMgr.desiredAccuracy = kCLLocationAccuracyBest
               seclocationMgr.distanceFilter = kCLDistanceFilterNone
               seclocationMgr.delegate = self
               seclocationMgr.startUpdatingLocation()
               seclocationMgr.requestAlwaysAuthorization()
      
        
        let annotationview : MyCustemAnnotaion = MyCustemAnnotaion(coordinate: copiedlocation, title: "", subtitle: "")
        
        secmapView.addAnnotation(annotationview)

    }
   
}

extension secondViewController : MKMapViewDelegate{
    
    
    func mapView(_ secmapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
        print("regionWillChange")
    }
    
    func mapView(_ secmapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        print("regionDidChange")
    }
    
    
    func mapView(_ secmapView: MKMapView, didSelect view: MKAnnotationView) {
        
        print("Annotation view is selected")
    }
}


extension secondViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("didFailWithError")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("User Location changed")
        
        
        let userLocation = locations.last
        let long = userLocation?.coordinate.longitude
        let lat = userLocation?.coordinate.latitude
        
    }
    
}

