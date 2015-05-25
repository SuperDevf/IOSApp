//
//  ViewController.swift
//  FastMarkett
//
//  Created by Nicholas Raphael Farias  on 5/13/15.
//  Copyright (c) 2015 Nicholas Raphael Farias . All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!


    var productList = [NSDictionary]()
    var idcategory = NSInteger()
    
        
    func requestProducts(){
        
        Alamofire.request(.GET, "http://5c463342.ngrok.io/categories/" + String(idcategory) ).responseJSON { (request, response, products, _) in
        var json = JSON( products!)
            for (key: String, product: JSON) in json {
                
                var list = [String:AnyObject]()
                list["description"] = product["descripcion"].stringValue
                list["price"] = product["precios"][0]["precio"].doubleValue
                list["local"] = product["precios"][0]["local"]["sucursal"].stringValue
                list["localId"] = product["precios"][0]["local"]["id"].stringValue
                self.productList.append(list)
                self.tableView.reloadData()
            }
    
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return productList.count
        return productList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: PersonalListCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PersonalListCell
        var precio :Double = self.productList[indexPath.row]["price"]!.doubleValue
        
        cell.productName.text = self.productList[indexPath.row]["description"] as? String
        cell.productPrice.text = String(format: "%.2f", precio)
        cell.productStore.text = self.productList[indexPath.row]["local"] as? String
        cell.localId.text = self.productList[indexPath.row]["localId"] as? String
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //var passProducts = segue.destinationViewController as! PersonalListController
        if segue.identifier == "segueLocalMap" {
            var mapVc = segue.destinationViewController as! MapsViewController
            //mapVc.localId.text = "1"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestProducts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

