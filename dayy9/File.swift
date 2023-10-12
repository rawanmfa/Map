//
//  File.swift
//  dayy9
//
//  Created by rawan  on 9/9/23.
//  Copyright © 2023 rawan . All rights reserved.
//

import Foundation
import MapKit



class MyCustemAnnotaion: NSObject , MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title : String?
    var subtitle: String?
    
    
    init(coordinate : CLLocationCoordinate2D , title : String , subtitle : String) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
   
}
