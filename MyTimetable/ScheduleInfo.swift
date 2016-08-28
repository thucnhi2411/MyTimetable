//
//  ScheduleInfo.swift
//  MyTimetable
//
//  Created by THUC NHI on 7/6/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class ScheduleInfo: UIViewController {

	@IBOutlet weak var course: UITextField!
	
	@IBOutlet weak var location: UITextField!
	
    @IBOutlet weak var fromString: UILabel!
	
    @IBOutlet weak var from: UIDatePicker!
	
	
	@IBOutlet weak var mondaySwitch: UISwitch!
	@IBOutlet weak var tuesdaySwitch: UISwitch!
	@IBOutlet weak var wednesdaySwitch: UISwitch!
	@IBOutlet weak var thursdaySwitch: UISwitch!
	@IBOutlet weak var fridaySwitch: UISwitch!
	@IBOutlet weak var saturdaySwitch: UISwitch!
	
    @IBAction func fromDatePicker(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var strDate = dateFormatter.stringFromDate(from.date)
        self.fromString.text = strDate
    }
	var selectedSemesterName = ""
	
	var semesterSchedule : [ String : [[String]] ] {
		get {
			return NSUserDefaults().objectForKey( selectedSemesterName ) as! [ String : [[String]] ]
		}
		set {
			NSUserDefaults().setObject(newValue, forKey: selectedSemesterName)
		}
	}
	
    @IBOutlet weak var toString: UILabel!
    
    @IBOutlet weak var to: UIDatePicker!
    
    @IBAction func toDatePicker(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var strDate1 = dateFormatter.stringFromDate(to.date)
        self.toString.text = strDate1

    }
	@IBAction func submitButton(sender: UIButton) {
		let selectedDate = 0
		var userDidFuckUp = false
		
		// check if any day contains the course with the same name
		for dayName in weekdays {
			// get the schedule for the day
			let daySchedule : [[String]] = semesterSchedule[ dayName ]!
			
			// get the array of classes in that day
			let classes : [String] = daySchedule[0]
			
			if classes.contains( course.text! ) {
				userDidFuckUp = true
			}
		}
		
		if userDidFuckUp == true {
			
			let alert = UIAlertController(title: "Ooops!", message: "This course has already existed!", preferredStyle: UIAlertControllerStyle.Alert)
			let okAction = UIAlertAction(title: "Got it!!!", style: UIAlertActionStyle.Cancel) { (ACTION) in
				print("OK Button tapped")
			}
			
			alert.addAction(okAction)
			self.presentViewController(alert, animated: true, completion: nil)
			
		}			
		else {
			addCourseToDays()
		}
		self.navigationController?.popViewControllerAnimated(true)
      
    
    }
    
	func addCourseToDays() {
		var hours = fromString.text! + " - " + toString.text!
		let courseName = course.text! + " - " + location.text!
		if mondaySwitch.on {
			addCourse("Monday", courseName: courseName, time: hours)
		}
		if tuesdaySwitch.on {
			addCourse("Tuesday", courseName: courseName, time: hours)
		}
		if wednesdaySwitch.on {
			addCourse("Wednesday", courseName: courseName, time: hours)
		}
		if thursdaySwitch.on {
			addCourse("Thursday", courseName: courseName, time: hours)
		}
		if fridaySwitch.on {
			addCourse("Friday", courseName: courseName, time: hours)
		}
		if saturdaySwitch.on {
			addCourse("Saturday", courseName: courseName, time: hours)
		}

	}
	
	func addCourse(dayName: String, courseName: String, time: String) {
		// get the schedule for the day
		var daySchedule : [[String]] = semesterSchedule[ dayName ]!
		
		// get the array of classes in that day
		var classes : [String] = daySchedule[0]
		
		// get the array of times in that day
		var times : [String] = daySchedule[1]
		
		// add course and time
		classes.append( courseName )
		times.append( time )
		
		// update data source
		daySchedule[0] = classes
		daySchedule[1] = times
		semesterSchedule[ dayName ] = daySchedule
		
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view.endEditing(true)
	}

}
