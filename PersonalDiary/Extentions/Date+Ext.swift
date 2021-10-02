//
//  Date+Ext.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import Foundation

extension Date {
    var dateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss dd.MM.yy"
        return  formatter.string(from: self)    
    }
}
