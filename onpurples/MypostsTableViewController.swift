//
//  MypostsTableViewController.swift
//  onpurples
//
//  Created by Sushma Reddy on 4/26/15.
//  Copyright (c) 2015 Sushma Reddy. All rights reserved.
//

import UIKit

class MypostsTableViewController: PFQueryTableViewController {
    
    
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
    
    /*var query = PFQuery(className:"Ride")
    query.whereKey("createdby", equalTo:PFUser.currentUser())
    query.findObjectsInBackgroundWithBlock {
    (objects: [AnyObject]?, error: NSError?) -> Void in
    
    if error == nil {
    if let objects = objects as? [PFObject] {
    for object in objects {
    println(object.objectId)
    }
    }
    
    }
    else {
    // Log details of the failure
    println("Error: \(error!) \(error!.userInfo!)")
    }
    }*/


    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MypostsCell") as PFTableViewCell!
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        if segue.identifier == "mypostsRideDetailsSegue" {
            var detailScene = segue.destinationViewController as MypostsRideDetailsTableViewController
            
            // Pass the selected object to the destination view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let row = Int(indexPath.row)
                detailScene.currentObject = objects[row] as? PFObject
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
       // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath )  {

        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


   
}
