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
        if segue.identifier == "MyPostsDetailSegue" {
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as DetailsTableViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects[row] as? PFObject
            }
        }
       /* if segue.identifier == "EditSegue" {
            var editScene = segue.destinationViewController as? AddPostTableViewController
          
            
            // Pass the selected object to the destination view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let row = Int(indexPath.row)
                editScene.currentObject = objects[row] as? PFObject
            }
            
        }*/
    }

   
}
