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


class CategoriesViewController: UICollectionViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    
@IBOutlet var collectionView2: UICollectionView!
    
var categories = [NSDictionary]()
var images: [NSDictionary] = []
    
var ids = [NSDictionary]()
var selectedRow = 0
var categoryid = 0

    func requestCategories(){
        Alamofire.request(.GET, "http://5c463342.ngrok.io/categories/?format=json").responseJSON { (request, response, products, _) in
            var json = JSON( products!)
            
            
            for (key: String, product: JSON) in json {
                
                var list = [String:AnyObject]()
                var urls = [String:AnyObject]()
                var basepath = "http://5c463342.ngrok.io/"
                var id = [String:NSInteger]()
                id["ids"]=product["id"].intValue
                
                list["category"]=product["categoria"].stringValue
                
                let url = NSURL(string: basepath + product["imagen"].stringValue)//basepath + product["imagen"].stringValue)
                
                
                let data = NSData(contentsOfURL: url!)
                if(data != nil){
                
                    urls["url"] = UIImage(data: data!)
                
                }
                
                self.images.append(urls)
                self.categories.append(list)
                self.ids.append(id)

            }
         self.collectionView!.reloadData()       
            
        }
        
    }



    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        requestCategories()
        // Register cell classes
        self.collectionView!.registerClass(CategoriesViewCell.self, forCellWithReuseIdentifier: "item")
    
        // Do any additional setup after loading the view.
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
        return categories.count-1}

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("itemCell", forIndexPath: indexPath) as! CategoriesViewCell
        
        
        var valores = categories[indexPath.row]
       var etiqueta = valores["category"] as! String
        cell.categoryName.text = etiqueta
        
        var pictures = self.images[indexPath.row]
        
        var picture = UIImage()
        
        picture = pictures["url"] as! UIImage

        cell.categoryImage.image = picture
        
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    

    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        selectedRow = indexPath.row
        self.performSegueWithIdentifier("categorysegue", sender: self)
    }
    
  /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let destination = segue.destinationViewController as! ViewController
        destination.idcategory = sender?.items as! NSInteger
        println(destination.idcategory)
        
        
        
        
    }*/
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "categorysegue"){
            //let cell = sender as! UICollectionViewCell
            let destination = segue.destinationViewController as! ViewController
//            print(selectedRow)
            if let indexPath = collectionView?.indexPathsForSelectedItems(){
                println(indexPath[0].row)
                destination.idcategory = indexPath[0].row + 1
            }
            //destination.idcategory = collectionView?.indexPathsForSelectedItems()
        }
    }
    
    

}
