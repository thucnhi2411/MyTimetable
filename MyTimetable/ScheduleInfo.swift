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
        var weekSchedule = parentView.parentView.dictsemesters[parentView.parentView.selectedSemesterName]
        var userDidFuckUp = false
        for day in weekSchedule! {
            if day.courses.contains(course.text!) {
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
            
        
        if selectedDate == 0 {
            parentView.addCourse("Monday", courseName: course.text!, time: time.text!)
            parentView.addCourse("Wednesday", courseName: course.text!, time: time.text!)
            parentView.addCourse("Friday", courseName: course.text!, time: time.text!)
            
        }
        else {
            parentView.addCourse("Tuesday", courseName: course.text!, time: time.text!)
            parentView.addCourse("Thursday", courseName: course.text!, time: time.text!)
        }
            }
        
    }
}
