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
	
	override func viewDidLoad() {
		// initialize 5 empty days for weekSchedule
		for dayName in weekdays {
			weekSchedule.append( Day(inputName: dayName) )
		}
		
		// let's try with some dummy data
		let MWFTimes = ["09:00 - 09:50", "14:45 - 16:00"]
		let MWFCourses = ["MATH 162", "CS 104"]
		
		// "Monday", "Wednesday", "Friday" are at indexes 0, 2, 4
		weekSchedule[0].times = MWFTimes
		weekSchedule[0].courses = MWFCourses
		weekSchedule[2].times = MWFTimes
		weekSchedule[2].courses = MWFCourses
		weekSchedule[4].times = MWFTimes
		weekSchedule[4].courses = MWFCourses
		
		// don't forget this!
		super.viewDidLoad()
	}

}
