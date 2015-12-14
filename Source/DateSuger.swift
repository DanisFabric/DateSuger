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
    public static func yearsFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.Year, fromDate: date, toDate: toDate, options: [])
        return components.year
    }
    public static func monthsFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.Month, fromDate: date, toDate: toDate, options: [])
        return components.month
    }
    public static func weeksFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.WeekOfYear, fromDate: date, toDate: toDate, options: [])
        return components.weekOfYear
    }
    public static func daysFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.Day, fromDate: date, toDate: toDate, options: [])
        return components.day
    }
    public static func hoursFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.Hour, fromDate: date, toDate: toDate, options: [])
        return components.hour
    }
    public static func minutesFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.Minute, fromDate: date, toDate: toDate, options: [])
        return components.minute
    }
    public static func secondsFrom(date: NSDate, toDate: NSDate) -> Int {
        let components = DefaultCalendar.components(.Second, fromDate: date, toDate: toDate, options: [])
        return components.second
    }
    
    public func yearsFrom(date: NSDate) -> Int{
        return NSDate.yearsFrom(date, toDate: self)
    }
    public func monthsFrom(date: NSDate) -> Int {
        return NSDate.monthsFrom(date, toDate: self)
    }
    public func weeksFrom(date: NSDate) -> Int {
        return NSDate.weeksFrom(date, toDate: self)
    }
    public func daysFrom(date: NSDate) -> Int {
        return NSDate.daysFrom(date, toDate: self)
    }
    public func hoursFrom(date: NSDate) -> Int {
        return NSDate.hoursFrom(date, toDate: self)
    }
    public func minutesFrom(date: NSDate) -> Int {
        return NSDate.minutesFrom(date, toDate: self)
    }
    public func secondsFrom(date: NSDate) -> Int {
        return NSDate.secondsFrom(date, toDate: self)
    }
}
