//
//  week.swift
//  MyTimetable
//
//  Created by THUC NHI on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import UIKit

class week: UITableViewController {
    
    var weeks = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let wcell = tableView.dequeueReusableCellWithIdentifier("weeks", forIndexPath: indexPath) as! UITableViewCell
        wcell.textLabel?.text = weeks[indexPath.row]
        wcell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return wcell
    }

}
