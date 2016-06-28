//
//  SemesterTVC.swift
//  MyTimetable
//
//  Created by THUC NHI on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class SemesterTVC: UITableViewController {
    
    let semesters = ["Fall 2016", "Spring 2017", "Fall 2017", "Spring 2018"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("semesters", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = semesters[indexPath.row]
        return cell
    }
    
    

}
