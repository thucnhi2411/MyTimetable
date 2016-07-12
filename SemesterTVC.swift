//
//  SemesterTVC.swift
//  MyTimetable
//
//  Created by THUC NHI on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

let SEM_ARR = "Semester Array"

var semesterArray : [String] {
	get {
		return NSUserDefaults().objectForKey(SEM_ARR) as! [String]
	}
	set {
		NSUserDefaults().setObject(newValue, forKey: SEM_ARR)
	}
}

class SemesterTVC: UITableViewController {
	
	@IBOutlet weak var doneDeletingButton: UIBarButtonItem!
	
    var selectedSemesterName = ""
	
	override func viewDidLoad() {
		doneDeletingButton.enabled = false
		let userDefault = NSUserDefaults()
		if userDefault.objectForKey(SEM_ARR) == nil {
			userDefault.setObject([String](), forKey: SEM_ARR)
		}
	}
	
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesterArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("semester", forIndexPath: indexPath)
        cell.textLabel?.text = semesterArray[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		selectedSemesterName = semesterArray[indexPath.row]
		performSegueWithIdentifier("View Semester", sender: self)
	}
   
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "View Semester" {
            if let week : WeekTVC = segue.destinationViewController as? WeekTVC {
				week.selectedSemesterName = selectedSemesterName
            }
        }
	}
     func compareSemester( sem1: String, sem2: String) -> Int {
        let semArr1 = sem1.componentsSeparatedByString(" ")
        let semArr2 = sem2.componentsSeparatedByString(" ")
        let year1 = Int(semArr1[1])
        let year2 = Int(semArr2[1])
        if year1 > year2 {
            return 1
        }
        else {
            if year1 < year2 {
                return -1
            }
        else {
            var score = [String : Int]()
            score["Spring"] = 0
            score["Summer"] = 1
            score["Fall"] = 2
            if score[semArr1[0]] > score[semArr2[0]] {
                return 1
            }
            else {
                if score[semArr1[0]] < score[semArr2[0]] {
                return -1
            }
            else {
                return 0
            }
        }
            } }
    }
    
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == UITableViewCellEditingStyle.Delete {
			semesterArray.removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
		}
	}

	override func viewWillAppear(animated: Bool) {
		tableView.reloadData()
		super.viewWillAppear(animated)
	}
	
    @IBAction func deleteButton(sender: UIBarButtonItem) {
		tableView.setEditing( true, animated: true )
		doneDeletingButton.enabled = true
    }
	
	@IBAction func doneDeletingPressed(sender: UIBarButtonItem) {
		tableView.setEditing(false, animated: true)
		sender.enabled = false
	}
	
}
