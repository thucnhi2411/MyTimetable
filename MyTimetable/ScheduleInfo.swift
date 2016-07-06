//
//  ScheduleInfo.swift
//  MyTimetable
//
//  Created by THUC NHI on 7/6/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class ScheduleInfo: UIViewController {
    
    var parentView : week = week()
    
    @IBOutlet weak var course: UITextField!
    

    @IBOutlet weak var date: UISegmentedControl!
    
    @IBOutlet weak var time: UITextField!
    
    @IBAction func submitButton(sender: UIButton) {
        let selectedDate = date.selectedSegmentIndex
        if selectedDate == 0 {
            parentView.MWFTimes.append(time.text!)
            parentView.MWFCourses.append(course.text!)
        }
        else {
            parentView.TRTimes.append(time.text!)
            parentView.TRCourses.append(course.text!)
        }
        
    }
}
