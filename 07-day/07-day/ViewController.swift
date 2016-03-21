//
//  ViewController.swift
//  07-day
//
//  Created by Hongbo Yu on 16/3/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var locationLable: UILabel!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Slide
    }
    
    
    @IBAction func locationBtnDidTouch(sender: AnyObject) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    
        self.locationLable.text = "Error while updating location. " + error.localizedDescription
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
         
            if (error != nil) {
                self.locationLable.text = "Reverse geocoder failed with error: " + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            } else {
                self.locationLable.text = "Problem with the data received from geocoder: "
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.locationLable.text = "你的位置是 \(locality!) \(administrativeArea! ) \(country!)，恭喜你，你已经被大浦洞导弹锁定。"
        }
        
    }

    
    
}

