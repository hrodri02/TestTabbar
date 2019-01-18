//
//  Date+Ext.swift
//  TestTabbar
//
//  Created by Eri on 1/15/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

extension Date {
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getDateStr() -> String {
        guard let monthIndex = Int(getMonth()) else {return ""}
        return  MONTHS[monthIndex - 1] + " " + self.getDay()
    }
    
    func isOld() -> Bool {
        let today = Date()
        let year = today.getYear()
        let month = today.getMonth()
        let day = today.getDay()
        
        return (self.getYear() < year ||  self.getMonth() < month || self.getDay() < day)
    }
}
