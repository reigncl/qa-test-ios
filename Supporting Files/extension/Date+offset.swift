//
//  Date+offset.swift
//  Vendomatica
//
//  Created by Abstract on 8/31/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

// swiftlint:disable cyclomatic_complexity
// swiftlint:disable function_body_length

import UIKit

extension Date {

  static func startDate() -> String {
    let dateFormatter = DateFormatter()
    let date = Date()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    
    let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: date)
    let startOfMonth = Calendar.current.date(from: comp)!
    return dateFormatter.string(from: startOfMonth)
  }
  
  static func endDate() -> String {
    let dateFormatter = DateFormatter()
    let date = Date()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    
    let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: date)
    let startOfMonth = Calendar.current.date(from: comp)!
    
    var comp2 = DateComponents()
    comp2.month = 1
    comp2.day = -1
    let endOfMonth = Calendar.current.date(byAdding: comp2, to: startOfMonth)
    return dateFormatter.string(from: endOfMonth ?? Date())
  }
  
  static func currentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter.string(from: Date())
  }
  
  static func dateFromString(_ date: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: date)

    return date!
  }

  static func offsetFrom(_ date: Date) -> String {
    let yearsBetween = Date.yearsBetween(date1: Date(), date2: date)
    if yearsBetween < 0 {
      if yearsBetween == -1 {
        return "\(-yearsBetween) año"
      } else {
        return "\(-yearsBetween) años"
      }
    }
    let monthsBetween = Date.monthsBetween(date1: Date(), date2: date)
    if monthsBetween  < 0 {
      if monthsBetween == -1 {
        return "\(-monthsBetween) mes"
      } else {
        return "\(-monthsBetween) meses"
      }
    }
    let weeksBetween = Date.weeksBetween(date1: Date(), date2: date)
    if weeksBetween < 0 {
      if weeksBetween == -1 {
        return "\(-weeksBetween) sem"
      } else {
        return "\(-weeksBetween) sem"
      }
    }
    let daysBetween = Date.daysBetween(date1: Date(), date2: date)
    if daysBetween < 0 {
      if daysBetween == 1 {
        return "\(-daysBetween) día"
      } else {
        return "\(-daysBetween) días"
      }
    }
    let hoursBetween = Date.hoursBetween(date1: Date(), date2: date)
    if hoursBetween < 0 {
      if hoursBetween == -1 {
        return "\(-hoursBetween) hr"
      } else {
        return "\(-hoursBetween) hrs"
      }

    }
    let minutesBetween = Date.minutesBetween(date1: Date(), date2: date)
    if minutesBetween < 0 {
      if minutesBetween == -1 {
        return "\(-minutesBetween) min"
      } else {
        return "\(-minutesBetween) mins"
      }
    }
    let secondsBetween = Date.secondsBetween(date1: Date(), date2: date)
    if secondsBetween < 0 {
      if secondsBetween == -1 {
        return "\(-secondsBetween) s"
      } else {
        return "\(-secondsBetween) s"
      }
    }
    return ""
  }

  public static func secondsBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.second, from: d1, to: d2, options: [])
    return dc.second!
  }

  public static func minutesBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.minute, from: d1, to: d2, options: [])
    return dc.minute!
  }

  public static func hoursBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.hour, from: d1, to: d2, options: [])
    return dc.hour!
  }

  public static func daysBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.day, from: d1, to: d2, options: [])
    return dc.day!
  }

  public static func weeksBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.weekOfYear, from: d1, to: d2, options: [])
    return dc.weekOfYear!
  }

  public static func monthsBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.month, from: d1, to: d2, options: [])
    return dc.month!
  }

  public static func yearsBetween(date1 d1: Date, date2 d2: Date) -> Int {
    let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.year, from: d1, to: d2, options: [])
    return dc.year!
  }
}
