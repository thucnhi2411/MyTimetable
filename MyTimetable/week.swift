//
//  week.swift
//  MyTimetable
//
//  Created by THUC NHI on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class week: UITableViewController {
    
	var weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
	var weekSchedule = [Day]()
    var parentView: SemesterTVC = SemesterTVC()
    
    
	
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// 5 sections, one day for each section
        return weekdays.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// the number of courses on each day
        let day = weekSchedule[section]
		return day.courses.count
    }
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		// specify the header for each section. In this case we want the header to be the name of the day.
		return weekdays[section]
	}
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let wcell = tableView.dequeueReusableCellWithIdentifier("weeks", forIndexPath: indexPath)
		
		// which day is it?
		let dayIndex = indexPath.section
		
		// which row are we at?
		let rowIndex = indexPath.row
		
		// display the time on the left
		wcell.textLabel!.text = weekSchedule[dayIndex].times[rowIndex]
		
		// display the course name on the right
		wcell.detailTextLabel!.text = weekSchedule[dayIndex].courses[rowIndex]
        return wcell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Add Course" {
            if let ScheduleInfo: ScheduleInfo = segue.destinationViewController as? ScheduleInfo {
                ScheduleInfo.parentView = self
            }
        }
    }
    
    var MWFTimes = [String]()
    var TRTimes = [String]()
    var MWFCourses = [String]()
    var TRCourses = [String]()
	override func viewDidLoad() {
		// initialize 5 empty days for weekSchedule
        
        
		for dayName in weekdays {
			weekSchedule.append( Day(inputName: dayName) )
        }
		
        
		// don't forget this!
		super.viewDidLoad()
	}
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let selectedDay = weekSchedule[indexPath.section]
            selectedDay.courses.removeAtIndex(indexPath.row)
            selectedDay.times.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }
    override func viewWillAppear(animated: Bool) {
        weekSchedule[0].times = MWFTimes
        weekSchedule[0].courses = MWFCourses
        weekSchedule[1].times = TRTimes
        weekSchedule[1].courses = TRCourses
        weekSchedule[2].times = MWFTimes
        weekSchedule[2].courses = MWFCourses
        weekSchedule[3].times = TRTimes
        weekSchedule[3].courses = TRCourses
        weekSchedule[4].times = MWFTimes
        weekSchedule[4].courses = MWFCourses
        print("hello")
        tableView.reloadData()
        super.viewWillAppear(animated)
    }

}
