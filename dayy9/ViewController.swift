//
//  ViewController.swift
//  dayy9
//
//  Created by rawan  on 9/9/23.
//  Copyright © 2023 rawan . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationMgr = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.distanceFilter = kCLDistanceFilterNone
        locationMgr.delegate = self
        locationMgr.startUpdatingLocation()
        locationMgr.requestAlwaysAuthorization()
        
    }

    
     @IBAction func mapTouchedAction(_ sender:UITapGestureRecognizer) {
            
            let touchedPoint : CGPoint = sender.location(in: mapView)
            
            let touchedLocation : CLLocationCoordinate2D = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            
            let annotationView : MyCustemAnnotaion = MyCustemAnnotaion(coordinate: touchedLocation, title: "", subtitle: "")
            
            mapView.addAnnotation(annotationView)
            
        let secondVC : secondViewController = storyboard?.instantiateViewController(identifier: "secondVC") as! secondViewController
        navigationController?.pushViewController(secondVC, animated: true)
        
        secondVC.copiedlocation.latitude =  touchedLocation.latitude
        secondVC.copiedlocation.longitude = touchedLocation.longitude
        
        }
        
    }



extension ViewController : MKMapViewDelegate{
        
        
        func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
            
            print("regionWillChange")
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            
            print("regionDidChange")
        }
        
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            
            print("Annotation view is selected")
        }
    }


    extension ViewController : CLLocationManagerDelegate{
        
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
