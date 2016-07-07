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
            parentView.addCourse("Monday", courseName: course.text!, time: time.text!)
            parentView.addCourse("Wednesday", courseName: course.text!, time: time.text!)
            parentView.addCourse("Friday", courseName: course.text!, time: time.text!)
            
        }
        else {
            parentView.addCourse("Thursday", courseName: course.text!, time: time.text!)
            parentView.addCourse("Saturday", courseName: course.text!, time: time.text!)
        }
        
    }
}
