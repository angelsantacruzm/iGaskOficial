//
//  MapLocationViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
import GoogleMaps

class MapLocationViewController: UIViewController {

    var latitudeMapLoc = String()
    var longitudMapLoc = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
        // Do any additional setup after loading the view.
    }

    func loadMap(){
        let latitudeconv = (latitudeMapLoc as NSString).doubleValue
        let longitudeconv = (longitudMapLoc as NSString).doubleValue
        GMSServices.provideAPIKey("AIzaSyB52bahyMey4lm6Qfp2FfZdLeJzOdA4S1s")
        let camera = GMSCameraPosition.camera(withLatitude: latitudeconv, longitude: longitudeconv, zoom: 14)
        let mapview = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapview
        let currentLocation = CLLocationCoordinate2DMake(latitudeconv, longitudeconv)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "iGask"
        marker.map = mapview
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


