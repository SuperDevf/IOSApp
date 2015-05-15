//
//  PersonalListController.swift
//  FastMarkett
//
//  Created by Nicholas Raphael Farias  on 5/15/15.
//  Copyright (c) 2015 Nicholas Raphael Farias . All rights reserved.
//

import UIKit

class PersonalListController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var personalTableView: UITableView!
    var productName = ""
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var personalcell: PersonalTableCell = self.personalTableView.dequeueReusableCellWithIdentifier("personalCell", forIndexPath: indexPath) as! PersonalTableCell
        
        personalcell.personalProductName.text = productName
        
        return personalcell
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
