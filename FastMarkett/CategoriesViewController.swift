//
//  CategoriesViewController.swift
//  FastMarkett
//
//  Created by Nicholas Raphael Farias  on 5/18/15.
//  Copyright (c) 2015 Nicholas Raphael Farias . All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON

var reuseIdentifier = "item"

class CategoriesViewController: UICollectionViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    
@IBOutlet var collectionView2: UICollectionView!
    
var categories = [NSDictionary]()

    func requestCategories(){
        Alamofire.request(.GET, "http://93efa3de.ngrok.io/categories/?format=json").responseJSON { (request, response, products, _) in
            var json = JSON( products!)
            
            
            for (key: String, product: JSON) in json {
                
                var list = [String:AnyObject]()
               
                list["category"]=product["categoria"].stringValue
                self.categories.append(list)
                println(self.categories)
                
            }
       
            
        }
        
    }



    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(CategoriesViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
        // Do any additional setup after loading the view.
       // requestCategories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 1    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! CategoriesViewCell
        
        println(cell)
      cell.categoryName.text = "Something"
        
        
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate


}
