//
//  week.swift
//  MyTimetable
//
//  Created by THUC NHI on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

class WeekTVC: UITableViewController {
    
	var selectedSemesterName = ""
	var semesterSchedule : [ String : [[String]] ] {
		get {
			return NSUserDefaults().objectForKey( selectedSemesterName ) as! [ String : [[String]] ]
		}
		set {
			NSUserDefaults().setObject(newValue, forKey: selectedSemesterName)
		}
	}
	
	override func viewDidLoad() {
		self.title = selectedSemesterName
		super.viewDidLoad()
	}
	
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// 5 sections, one day for each section
        return weekdays.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// get the name of the day
		let dayName : String = weekdays[section]
		
		// get the schedule for the day
		let daySchedule : [[String]] = semesterSchedule[ dayName ]!
		
		// get the array of classes in that day
		let classes : [String] = daySchedule[0]
		
		// return the number of classes in that day
		return classes.count
		
    }
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		// specify the header for each section. In this case we want the header to be the name of the day.
		return weekdays[section]
	}
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let wcell = tableView.dequeueReusableCellWithIdentifier("weeks", forIndexPath: indexPath)
		
		// get the name of the day
		let dayName : String = weekdays[indexPath.section]
		
		// get the schedule for the day
		let daySchedule : [[String]] = semesterSchedule[ dayName ]!

		// get the array of classes in that day
		let classes : [String] = daySchedule[0]
		
		// get the array of times in that day
		let times : [String] = daySchedule[1]
		
		// display class name on the left
		wcell.textLabel!.text = classes[indexPath.row]
		
		// display class time on the right
		wcell.detailTextLabel!.text = times[indexPath.row]
		
		return wcell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Add Course" {
            if let scheduleInfo: ScheduleInfo = segue.destinationViewController as? ScheduleInfo {
                scheduleInfo.selectedSemesterName = selectedSemesterName
            }
        }
    }
	
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
			
			// get the name of the day
			let dayName : String = weekdays[indexPath.section]
			
			// get the schedule for the day
			var daySchedule : [[String]] = semesterSchedule[ dayName ]!
			
			// get the array of classes in that day
			var classes : [String] = daySchedule[0]
			
			// get the array of times in that day
			var times : [String] = daySchedule[1]
			
			// remove course and time at indexPath.row
			classes.removeAtIndex(indexPath.row)
			times.removeAtIndex(indexPath.row)
			
			// update data source
			daySchedule[0] = classes
			daySchedule[1] = times
			semesterSchedule[ dayName ] = daySchedule
			
			// update view
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
		}
    }
	
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
	
}
