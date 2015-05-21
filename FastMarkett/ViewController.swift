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
        
    func requestProducts(){
        Alamofire.request(.GET, "http://6e7f4e68.ngrok.io/products/?format=json").responseJSON { (request, response, products, _) in
        var json = JSON( products!)
            
            
            for (key: String, product: JSON) in json {
                
                var list = [String:AnyObject]()
                
                list["description"]=product["descripcion"].stringValue
                
                self.productList.append(list)
               println(self.productList)
                println("<==>")
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
        
        cell.productName.text = self.productList[indexPath.row]["description"] as? String
        //cell.productPrice.text = Producto[4]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    var passProducts = segue.destinationViewController as! PersonalListController
        
      
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

