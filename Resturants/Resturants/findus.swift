//
//  findus.swift
//  Resturants
//
//  Created by jay patel on 2017-04-07.
//  Copyright © 2017 jay patel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class findus: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate{
        
        

    @IBOutlet weak var maplc: MKMapView!
        
   
   
    @IBOutlet weak var textlocation: UITextField!
    
        var mapManager = CLLocationManager()
        var plc : [place] = []
        var annotations : [MKPointAnnotation] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            textlocation.delegate = self
            mapManager.delegate = self                            // ViewController is the "owner" of the map.
            mapManager.desiredAccuracy = kCLLocationAccuracyBest  // Define the best location possible to be used in app.
            mapManager.requestWhenInUseAuthorization()            // The feature will not run in background
            mapManager.startUpdatingLocation()                    // Continuously geo-position update
            loadData()
        }
        
  
    @IBAction func findlocation(_ sender: UITextField) {
   
    
            maplc.removeAnnotations(annotations)
            textlocation.resignFirstResponder()
            if let b1 = retrieveData(textlocation: textlocation.text!) {
                let userAnnotation = MKPointAnnotation()
                userAnnotation.coordinate = CLLocationCoordinate2DMake(b1.latitude, b1.longitude)
                maplc.addAnnotation(userAnnotation)
                annotations.append(userAnnotation)
                
                
                // Here we define the map's zoom. The value 0.01 is a pattern
                let zoom:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
                
                // Store latitude and longitude received from smartphone
                let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(b1.latitude, b1.longitude)
                
                // Based on myLocation and zoom define the region to be shown on the screen
                let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, zoom)
                
                // Setting the map itself based previous set-up
                maplc.setRegion(region, animated: true)
            }
        }
        
        // Drawing a red circle to pin on map
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }
        
        // dismiss the keyboard
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func loadData(){
            let ca = place(name: "The Keg Mansion", address: "515 Jarvis St, Toronto", latitude: 43.666780,  longitude: -79.378388)
            let usa = place(name: "Spring Rolls",address: "1800 Sheppard Ave E, North York", latitude: 43.778065,  longitude: -79.343417)
            plc.append(ca)
            plc.append(usa)
            
            
        }
        
        func retrieveData(textlocation : String) -> place? {
            for b in plc {
                if b.placeName == textlocation || b.address == textlocation {
                    return b
                }
            }
            return nil
        }
        
        
        
}


