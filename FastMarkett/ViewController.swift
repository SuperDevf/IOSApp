//
//  ViewController.swift
//  FastMarkett
//
//  Created by Nicholas Raphael Farias  on 5/13/15.
//  Copyright (c) 2015 Nicholas Raphael Farias . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
var Producto: [String] = ["1", "Jugo de fruta","bebida","ADES","$14.50","MEGA COMERCIAL SUCURSAL SATELITE"]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: PersonalListCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PersonalListCell
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

