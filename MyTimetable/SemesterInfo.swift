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
            semesterArray = sortArr( semesterArray );
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
    
    func sortArr(var semesterArray:[String]) -> [String] {
        var N = semesterArray.count
		if N == 0 || N == 1 {
			return semesterArray
		}
        for i in 0...N-2 {
            var min = i
            var j = i+1
            
            for k in j...N-1 {
                if compareSemester(semesterArray[k], sem2: semesterArray[min]) == -1 {
                    min = k
                }
            }
            
            if i != min {
                swap(&semesterArray[i], &semesterArray[min])
            }
        }
        
        return semesterArray
        
    }
    func compareSemester( sem1: String, sem2: String) -> Int {
        var semArr1 = sem1.componentsSeparatedByString(" ")
        var semArr2 = sem2.componentsSeparatedByString(" ")
        var year1 = Int(semArr1[1])
        var year2 = Int(semArr2[1])
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

 
}
