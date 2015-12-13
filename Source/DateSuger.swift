//
//  DateEasy.swift
//  DateEasy
//
//  Created by Danis on 15/12/13.
//  Copyright © 2015年 danis. All rights reserved.
//

import Foundation

enum DEDateComponentType {
    case Era
    case Year
    case Month
    case Day
    case Hour
    case Minute
    case Second
    case Quarter
    case Weekday
    case WeekdayOridinal
    case WeekOfMonth
    case WeekOfYear
    case DayOfYear
}

//MARK: - Default Values

let DefaultCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
let AllCalendarUnits: NSCalendarUnit = [
    .Era,
    .Year,
    .Quarter,
    .Month,
    .Day,
    .Hour,
    .Minute,
    .Second,
    .WeekOfYear,
    .WeekOfMonth,
    .Weekday,
    .WeekdayOrdinal,
    ]

// MARK: - Date Components
extension NSDate {
    public var era: Int {
        return componentForType(.Era, calendar: nil)
    }
    public var year: Int {
        return componentForType(.Year, calendar: nil)
    }
    public var month: Int {
        return componentForType(.Month, calendar: nil)
    }
    public var day: Int {
        return componentForType(.Day, calendar: nil)
    }
    public var hour: Int {
        return componentForType(.Hour, calendar: nil)
    }
    public var minute: Int {
        return componentForType(.Minute, calendar: nil)
    }
    public var second: Int {
        return componentForType(.Second, calendar: nil)
    }
    public var quarter: Int {
        return componentForType(.Quarter, calendar: nil)
    }
    public var weekday: Int {
        return componentForType(.Weekday, calendar: nil)
    }
    public var weekdayOrdinal: Int {
        return componentForType(.WeekdayOridinal, calendar: nil)
    }
    public var weekOfMonth: Int {
        return componentForType(.WeekOfMonth, calendar: nil)
    }
    public var weekOfYear: Int {
        return componentForType(.WeekOfYear, calendar: nil)
    }
    public var dayOfYear: Int {
        return componentForType(.DayOfYear, calendar: nil)
    }
    public func era(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Era, calendar: calendar)
    }
    public func year(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Year, calendar: calendar)
    }
    public func month(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Month, calendar: calendar)
    }
    public func day(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Day, calendar: calendar)
    }
    public func hour(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Hour, calendar: calendar)
    }
    public func minute(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Minute, calendar: calendar)
    }
    public func second(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Second, calendar: calendar)
    }
    public func quarter(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Quarter, calendar: calendar)
    }
    public func weekday(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.Weekday, calendar: calendar)
    }
    public func weekdayOrdinal(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.WeekdayOridinal, calendar: calendar)
    }
    public func weekOfMonth(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.WeekOfMonth, calendar: calendar)
    }
    public func weekOfYear(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.WeekOfYear, calendar: calendar)
    }
    public func dayOfYear(withCalendar calendar: NSCalendar) -> Int {
        return componentForType(.DayOfYear, calendar: calendar)
    }
    func componentForType(type: DEDateComponentType, var calendar: NSCalendar?) -> Int {
        if calendar == nil {
            calendar = DefaultCalendar
        }
        let dateComponents = calendar!.components(AllCalendarUnits, fromDate: self)
        
        switch type {
        case .Era:
            return dateComponents.era
        case .Year:
            return dateComponents.year
        case .Month:
            return dateComponents.month
        case .Day:
            return dateComponents.day
        case .Hour:
            return dateComponents.hour
        case .Minute:
            return dateComponents.minute
        case .Second:
            return dateComponents.second
        case .Quarter:
            return dateComponents.quarter
        case .Weekday:
            return dateComponents.weekday
        case .WeekdayOridinal:
            return dateComponents.weekdayOrdinal
        case .WeekOfMonth:
            return dateComponents.weekOfMonth
        case .WeekOfYear:
            return dateComponents.weekOfYear
        case .DayOfYear:
            return calendar!.ordinalityOfUnit(.Day, inUnit: .Year, forDate: self)
        }
    }
}

// MARK: - Other Infomation
extension NSDate {
    public var daysInMonth: Int {
        let calendar = DefaultCalendar
        let days = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: self)
        return days.length
    }
    public var daysInYear: Int {
        if self.isInLeapYear {
            return 366
        }
        return 365
    }
    public var isInLeapYear: Bool {
        let dateComponents = DefaultCalendar.components(.Year, fromDate: self)
        if dateComponents.year % 400 == 0 {
            return true
        }
        else if dateComponents.year % 100 == 0 {
            return false
        }
        else if dateComponents.year % 4 == 0 {
            return true
        }
        return false
    }
    public var isToday: Bool {
        return self.isSameDay(NSDate())
    }
    public var isTomorrow: Bool {
        let tomorrow = NSDate() + .Day(1)
        return self.isSameDay(tomorrow)
    }
    public var isYesterday: Bool {
        let yesterday = NSDate() - .Day(1)
        return self.isSameDay(yesterday)
    }
    public func isSameDay(date: NSDate) -> Bool {
        return NSDate.isSameDay(self, asDate: date)
    }
    public static func isSameDay(date: NSDate, asDate otherDate: NSDate) -> Bool {
        let firstComp = DefaultCalendar.components([.Era,.Year,.Month,.Day], fromDate: date)
        let secondComp = DefaultCalendar.components([.Era,.Year,.Month,.Day], fromDate: otherDate)
        
        let firstDate = DefaultCalendar.dateFromComponents(firstComp)!
        let secondDate = DefaultCalendar.dateFromComponents(secondComp)!
        
        return firstDate.isEqualToDate(secondDate)
    }
}
// MARK: - Date Creating
extension NSDate {
    public static func dateWithYear(year: Int, month: Int, day: Int) -> NSDate? {
        return dateWithYear(year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
    public static func dateWithYear(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> NSDate? {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return DefaultCalendar.dateFromComponents(components)
    }
}
// MARK: - Date Editing
extension NSDate {
    public func dateByAddingYears(years: Int) -> NSDate {
        let components = NSDateComponents()
        components.year = years
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateByAddingMonths(months: Int) -> NSDate {
        let components = NSDateComponents()
        components.month = months
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateByAddingWeeks(weeks: Int) -> NSDate {
        let components = NSDateComponents()
        components.weekOfYear = weeks
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateByAddingDays(days: Int) -> NSDate {
        let components = NSDateComponents()
        components.day = days
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateByAddingHours(hours: Int) -> NSDate {
        let components = NSDateComponents()
        components.hour = hours
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateByAddingMinutes(minutes: Int) -> NSDate {
        let components = NSDateComponents()
        components.minute = minutes
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateByAddingSeconds(seconds: Int) -> NSDate {
        let components = NSDateComponents()
        components.second = seconds
        
        return DefaultCalendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    public func dateBySubtractingYears(years: Int) -> NSDate {
        return dateByAddingYears(-years)
    }
    public func dateBySubtractingMonths(months: Int) -> NSDate {
        return dateByAddingMonths(-months)
    }
    public func dateBySubtractingWeeks(weeks: Int) -> NSDate {
        return dateByAddingWeeks(-weeks)
    }
    public func dateBySubtractingDays(days: Int) -> NSDate {
        return dateByAddingDays(-days)
    }
    public func dateBySubtractingHours(hours: Int) -> NSDate {
        return dateByAddingHours(-hours)
    }
    public func dateBySubtractingMinutes(minutes: Int) -> NSDate {
        return dateByAddingMinutes(-minutes)
    }
    public func dateBySubtractingSeconds(seconds: Int) -> NSDate {
        return dateByAddingSeconds(-seconds)
    }
}

// MARK: - Interval
extension NSDate {
    // Interval From
    public func yearsFrom(date: NSDate) -> Int{
        let components = DefaultCalendar.components(.Year, fromDate: date, toDate: self, options: [])
        
        return components.year
    }
    public func monthsFrom(date: NSDate) -> Int {
        let components = DefaultCalendar.components(.Month, fromDate: date, toDate: self, options: [])
        return components.month
    }
    public func weeksFrom(date: NSDate) -> Int {
        let components = DefaultCalendar.components(.WeekOfYear, fromDate: date, toDate: self, options: [])
        return components.weekOfYear
    }
    public func daysFrom(date: NSDate) -> Int {
        let components = DefaultCalendar.components(.Day, fromDate: date, toDate: self, options: [])
        return components.day
    }
    public func hoursFrom(date: NSDate) -> Double {
        return self.timeIntervalSinceDate(date) / 3600.0
    }
    public func minutesFrom(date: NSDate) -> Double {
        return self.timeIntervalSinceDate(date) / 60.0
    }
    public func secondsFrom(date: NSDate) -> Double {
        return self.timeIntervalSinceDate(date)
    }
}

// MARK: - Operator Overloading

//MARK: Comparision
extension NSDate : Comparable {}

public func > (left: NSDate, right: NSDate) -> Bool {
    if left.timeIntervalSince1970 > right.timeIntervalSince1970 {
        return true
    }
    return false
}
public func < (left:NSDate, right: NSDate) -> Bool {
    if left.timeIntervalSince1970 < right.timeIntervalSince1970 {
        return true
    }
    return false
}

// MARK: Calculation
public func + (left: NSDate, right: NSTimeInterval) -> NSDate {
    return NSDate(timeInterval: right, sinceDate: left)
}
public func - (left: NSDate, right: NSTimeInterval) -> NSDate {
    return NSDate(timeInterval: -right, sinceDate: left)
}

public enum DateCane {
    case Year(Int)
    case Month(Int)
    case Week(Int)
    case Day(Int)
    case Hour(Int)
    case Minute(Int)
    case Second(Int)
}

public func + (left: NSDate, right: DateCane) -> NSDate {
    switch right {
    case .Year(let years):
        return left.dateByAddingYears(years)
    case .Month(let months):
        return left.dateByAddingMonths(months)
    case .Week(let weeks):
        return left.dateByAddingWeeks(weeks)
    case .Day(let days):
        return left.dateByAddingDays(days)
    case .Hour(let hours):
        return left.dateByAddingHours(hours)
    case .Minute(let minutes):
        return left.dateByAddingMinutes(minutes)
    case .Second(let seconds):
        return left.dateByAddingSeconds(seconds)
    }
}
public func - (left: NSDate, right: DateCane) -> NSDate {
    switch right {
    case .Year(let years):
        return left.dateBySubtractingYears(years)
    case .Month(let months):
        return left.dateBySubtractingMonths(months)
    case .Week(let weeks):
        return left.dateBySubtractingWeeks(weeks)
    case .Day(let days):
        return left.dateBySubtractingDays(days)
    case .Hour(let hours):
        return left.dateBySubtractingHours(hours)
    case .Minute(let minutes):
        return left.dateBySubtractingMinutes(minutes)
    case .Second(let seconds):
        return left.dateBySubtractingSeconds(seconds)
    }
}

