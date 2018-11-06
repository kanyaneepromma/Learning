//
//  File.swift
//  My Diary
//
//  Created by Kanyanee P on 6/11/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import Foundation

var requestTopic = "https://kanyanee.000webhostapp.com/comsci_1DayTrip/selectTest.php"
var urlImg = "https://kanyanee.000webhostapp.com/comsci_1DayTrip/Image/1.jpg"

struct Topics: Decodable{
    var Topic_ID: String
    var Topic_Name: String
    var Price: String
    var Image: String
    var Description: String
}
