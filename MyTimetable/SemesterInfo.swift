//
//  SemesterInfo.swift
//  MyTimetable
//
//  Created by Nguyen Huy on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class SemesterInfo: UIViewController {
	
	var parentView : SemesterTVC = SemesterTVC()
	
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
        
        
            if parentView.semesters.contains(semesterName) {
                
                let alert = UIAlertController(title: "Ooops!", message: "This semester has already existed!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "Got it!!!", style: UIAlertActionStyle.Cancel) { (ACTION) in
                    print("OK Button tapped")
                }

                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)

            }
            else {
                parentView.semesters.append(semesterName)
                parentView.dictsemesters[semesterName] = [Day]() }
        
        	}
    
	
}
