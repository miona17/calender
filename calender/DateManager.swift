//
//  DateManager.swift
//  calender
//
//  Created by 倉茂未央那 on 2017/12/09.
//  Copyright © 2017年 倉茂未央那. All rights reserved.
//

import UIKit

class DateManager: NSDate {

    private var selectedDate = Date()
    private let daysPerWeek:Int = 7
    private var numberOfItems:Int = 0
    
    func cellCount(startDate:Date) -> Int{
        
        let startDateComponents = NSCalendar.current.dateComponents([.year ,.month], from:startDate as Date)
        let currentDateComponents = NSCalendar.current.dateComponents([.year ,.month], from:selectedDate as Date)
        let components = NSCalendar.current.dateComponents([.year,.month], from: startDateComponents, to: currentDateComponents)
        let numberOfMonth = components.month! + components.year! * 12
        
       
        for i in 0 ..< numberOfMonth + 1{
            
            
            let dateComponents = NSDateComponents()
            dateComponents.month = i
            let date = NSCalendar.current.date(byAdding: dateComponents as DateComponents, to: startDate)
            let dateRange = NSCalendar.current.range(of: .weekOfMonth, in: .month, for: date!)
            let ordinalityOfFirstDay = NSCalendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth(date:date!))
            
            if(ordinalityOfFirstDay == 1 || i == 0){
                numberOfItems = numberOfItems + dateRange!.count * daysPerWeek
            }else{
                numberOfItems = numberOfItems + (dateRange!.count - 1) * daysPerWeek
            }
        }
        
        return numberOfItems
    }
    
    
    func firstDateOfMonth(date:Date) -> Date{
       
        var components = NSCalendar.current.dateComponents([.year ,.month, .day], from:date)
        components.day = 1
        let firstDateMonth = NSCalendar.current.date(from: components)
        return firstDateMonth!
    }
    
    
   func dateForCellAtIndexPathWeeks(row:Int,startDate:Date) -> Date{
       
        let ordinalityOfFirstDay = NSCalendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth(date:startDate))
        let dateComponents = NSDateComponents()
        dateComponents.day = row - (ordinalityOfFirstDay! - 1)
       let date = NSCalendar.current.date(byAdding:dateComponents as DateComponents,to:firstDateOfMonth(date:startDate))
        return date!
    }
    
    
    func conversionDateFormat(row:Int,startDate:Date) -> String{
        let cellDate = dateForCellAtIndexPathWeeks(row: row,startDate:startDate)
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: cellDate)
        
    }
    
    
    func monthTag(row:Int,startDate:Date) -> String{
        let cellDate = dateForCellAtIndexPathWeeks(row: row,startDate:startDate)
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "YM"
        return formatter.string(from:cellDate)
    }
    
    
}

