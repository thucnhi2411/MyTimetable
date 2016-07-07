//
//  SemesterTVC.swift
//  MyTimetable
//
//  Created by THUC NHI on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class SemesterTVC: UITableViewController {
    
    var dictsemesters = [String : [Day] ]()
    var semesters = [String]()
    var selectedSemesterName = "String"
    
   
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("semesters", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = semesters[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
   
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "Add Semester" {
			if let semesterInfo : SemesterInfo = segue.destinationViewController as? SemesterInfo {
				semesterInfo.parentView = self
			}
		}
        if segue.identifier == "View Semester" {
            if let week : week = segue.destinationViewController as? week {
                week.parentView = self
            }
        }

	}
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedSemesterName = semesters[indexPath.row]
    }
    
	override func viewWillAppear(animated: Bool) {
		print("hello")
		tableView.reloadData()
		super.viewWillAppear(animated)
	}
    
    
    @IBAction func deleteButton(sender: UIBarButtonItem) {
    tableView.setEditing( true, animated: true )
    tableView.reloadData()
    }
   
  
    
   
}
