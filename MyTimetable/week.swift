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
    var parentView: SemesterTVC = SemesterTVC()
    
    
	
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// 5 sections, one day for each section
        return weekdays.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// the number of courses on each day
        let day = parentView.dictsemesters[parentView.selectedSemesterName]![section]
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
		wcell.textLabel!.text = parentView.dictsemesters[parentView.selectedSemesterName]![dayIndex].times[rowIndex]
		
		// display the course name on the right
		wcell.detailTextLabel!.text = parentView.dictsemesters[parentView.selectedSemesterName]![dayIndex].courses[rowIndex]
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
			parentView.dictsemesters[parentView.selectedSemesterName]?.append( Day(inputName: dayName) )
        }
		
        
		// don't forget this!
		super.viewDidLoad()
	}
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let selectedDay = parentView.dictsemesters[parentView.selectedSemesterName]![indexPath.section]
            selectedDay.courses.removeAtIndex(indexPath.row)
            selectedDay.times.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }
    override func viewWillAppear(animated: Bool) {
        parentView.dictsemesters[parentView.selectedSemesterName]![0].times = MWFTimes
        parentView.dictsemesters[parentView.selectedSemesterName]![0].courses = MWFCourses
        parentView.dictsemesters[parentView.selectedSemesterName]![1].times = TRTimes
        parentView.dictsemesters[parentView.selectedSemesterName]![1].courses = TRCourses
        parentView.dictsemesters[parentView.selectedSemesterName]![2].times = MWFTimes
        parentView.dictsemesters[parentView.selectedSemesterName]![2].courses = MWFCourses
        parentView.dictsemesters[parentView.selectedSemesterName]![3].times = TRTimes
        parentView.dictsemesters[parentView.selectedSemesterName]![3].courses = TRCourses
        parentView.dictsemesters[parentView.selectedSemesterName]![4].times = MWFTimes
        parentView.dictsemesters[parentView.selectedSemesterName]![4].courses = MWFCourses
        print("hello")
        tableView.reloadData()
        super.viewWillAppear(animated)
    }

}
