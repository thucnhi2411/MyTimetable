//
//  SemesterInfo.swift
//  MyTimetable
//
//  Created by Nguyen Huy on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class SemesterInfo: UIViewController {
	
	var semesterArray : [String] = Array()
	var parent : UITableViewController = UITableViewController()
	
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
		semesterArray.append(seasonString + " " + academicYear)
		parent.tableView.reloadData()
	}
	
	
}
