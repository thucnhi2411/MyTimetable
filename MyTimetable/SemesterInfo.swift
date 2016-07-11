//
//  SemesterInfo.swift
//  MyTimetable
//
//  Created by Nguyen Huy on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class SemesterInfo: UIViewController {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
	
	@IBOutlet weak var season: UISegmentedControl!
	
	@IBOutlet weak var year: UITextField!
	
	@IBAction func submitButtonClicked(sender: UIButton) {
		let selected = season.selectedSegmentIndex
		var seasonString = ""
		switch selected {
		case 0:
			seasonString = "Spring"
			break
		case 1:
			seasonString = "Summer"
			break
		case 2:
			seasonString = "Fall"
			break
		default:
			break
		}
		let academicYear = year.text!
		let semesterName = seasonString + " " + academicYear
		
		if semesterArray.contains(semesterName) {
			let alert = UIAlertController(title: "Ooops!", message: "This semester has already existed!", preferredStyle: UIAlertControllerStyle.Alert)
			let okAction = UIAlertAction(title: "Got it!!!", style: UIAlertActionStyle.Cancel) { (ACTION) in
				print("OK Button tapped")
			}
			alert.addAction(okAction)
			self.presentViewController(alert, animated: true, completion: nil)
		}
		
		else {
			semesterArray.append( semesterName )
			/**
			* Example: given semesterName as "Fall 2018", the resulting object is a Dictionary
			* that maps String to a pair of array (course array and time array) as follows:
			*	"Monday" ---> [ ["CS 104", "MATH 162"], ["09:00 - 09:50", "14:00 - 14:45"] ]
			*	"Tuesday" ---> [ ["FYS 162", "PHIL 200"], "13:15 - 14:30", "14:45 - 16:00"] ]
			*/
			var semesterSchedule = [ String : [[String]] ]()
			
			// initialize 5 empty days
			for dayName in weekdays {
				semesterSchedule[ dayName ] = [ [String](), [String]() ]
			}
			self.navigationController?.popViewControllerAnimated(true)
			NSUserDefaults().setObject( semesterSchedule, forKey: semesterName)
		}
		
	}
	
}
