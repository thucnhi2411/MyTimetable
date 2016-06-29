//
//  Day.swift
//  MyTimetable
//
//  Created by Nguyen Huy on 6/28/16.
//  Copyright © 2016 THUC-NHI LE. All rights reserved.
//

import Foundation

class Day {
	/*
	* Maintain 2 parallel arrays. For example
	* times = ["09:00-09:50 am", "14:45-16:00"]
	* courses = ["MATH 162", "CS 104"]
	*/
	var times = [String]()
	var courses = [String]()
	var name = ""
	
	init(inputName: String) {
		name = inputName
	}
	
	init(inputName: String, inputTimes: [String], inputCourses: [String]) {
		name = inputName
		times = inputTimes
		courses = inputCourses
	}
}