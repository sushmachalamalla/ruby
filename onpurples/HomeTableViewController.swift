//
//  HomeTableViewController.swift
//  onpurples
//
//  Created by Sushma Reddy on 4/26/15.
//  Copyright (c) 2015 Sushma Reddy. All rights reserved.
//

import UIKit

class HomeTableViewController: PFQueryTableViewController {
    
    
    @IBOutlet var addpostbutton: UIBarButtonItem!
    
    @IBAction func cancelButton(segue:UIStoryboardSegue) {
        
    }
    
    /*@IBAction func saveButton(segue:UIStoryboardSegue) {
        
    }*/
        // Initialise the PFQueryTable tableview
    override init!(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      
        // Configure the PFQueryTableView
        self.parseClassName = "Ride"
        self.textKey = "predefined"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    var rideObject = PFObject(className:"Ride")

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let predefined = object["predefined"] as? String {
            cell?.textLabel?.text = predefined
        }
         if let concatenated = object["concatenated"] as? String {
        cell?.detailTextLabel?.text = concatenated
        }
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
                    // Delete the row from the data source
            let objectToDelete = objects[indexPath.row] as? PFObject
                   // objectToDelete.deleteEventually;()
                    self.loadObjects()
        
        
        }
       /*override func numberOfSectionsInTableView(tableView: UIT3ableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return predefined.count
    }*/
    
    // to give details of ride
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                 // Get the new view controller using [segue destinationViewController].
        if segue.identifier == "DetailSegue" {
        var detailScene = segue.destinationViewController as DetailsTableViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects[row] as? PFObject
        }
        }
        if segue.identifier == "AddPostSegue" {
            var addScene = segue.destinationViewController as? AddPostTableViewController
            
          /*  // Pass the selected object to the destination view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let row = Int(indexPath.row)
                detailScene.currentObject = objects[row] as? PFObject
            }*/
        }

    }
   
}
