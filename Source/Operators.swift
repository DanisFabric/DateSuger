//
//  Operators.swift
//  DateSuger
//
//  Created by Danis on 15/12/14.
//  Copyright © 2015年 danis. All rights reserved.
//

import Foundation

//MARK: - Comparision
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

// MARK: - Calculation
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
