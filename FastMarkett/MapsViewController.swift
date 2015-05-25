//
//  MapsViewController.swift
//  FastMarkett
//
//  Created by Francisco Ocampo Romero on 24/05/15.
//  Copyright (c) 2015 Nicholas Raphael Farias . All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MapsViewController: UIViewController, CLLocationManagerDelegate {
    var localIdValue: String = "1"
    @IBOutlet weak var viewMap: GMSMapView!
    @IBOutlet weak var localId: UILabel!

    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    var marker: GMSMarker!
    var localUbication : CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        localId.text = localIdValue
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //var coordinate = CLLocationCoordinate2D(latitude: mapLatitud!, longitude: mapLongitud!)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        viewMap.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)
        getLocalLocation()
       // setuplocationMarker(localUbication)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            viewMap.myLocationEnabled = true
        }
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as! CLLocation
            //viewMap.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            viewMap.settings.myLocationButton = true
            
            didFindMyLocation = true
        }
    }
    
    func getLocalLocation() {
        //var coordinate: CLLocationCoordinate2D?
        Alamofire.request(.GET, "http://5c463342.ngrok.io/locales/" + String(localIdValue) ).responseJSON { (request, response, products, _) in
            var json = JSON( products!)
            for (key: String, product: JSON) in json {
             
                var list = [String:AnyObject]()
                /*list["description"] = product["descripcion"].stringValue
                list["price"] = product["precios"][0]["precio"].doubleValue
                list["local"] = product["precios"][0]["local"]["sucursal"].stringValue
                list["localId"] = product["precios"][0]["local"]["id"].stringValue*/
                self.localUbication = CLLocationCoordinate2D(latitude: product["latitud"].doubleValue, longitude: product["longitud"].doubleValue)
           //     self.productList.append(list)
           //     self.tableView.reloadData()
                self.setuplocationMarker(self.localUbication!)
                self.viewMap.camera = GMSCameraPosition(target: self.localUbication, zoom: 14, bearing: 0, viewingAngle: 0)
            }
            
        }
    }

    func setuplocationMarker(coordinate: CLLocationCoordinate2D) {
        marker = GMSMarker(position: coordinate)
        marker.map = viewMap
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
