//
//  FMDate.swift
//  Flirt Me
//
//  Created by Vishwajeet Kumar on 5/15/17.
//  Copyright © 2017 Vishwajeet Kumar. All rights reserved.
//

import UIKit

extension Date {
    
    // Time Format
    public struct TimeFormat {
        static let hh_mm                = "hh:mm"
        static let HH_mm                = "HH:mm"
        static let hh_mm_a              = "hh:mm a"
        static let HH_mm_ss             = "HH:mm:ss"
    }
    
    // Date format
    public struct DateFormat {
        static let MM_d_yyyy            = "MM/d/yyyy"
        static let dd_MM_yyyy           = "dd-MM-yyyy"
        static let d_MM                 = "d-MMM"
        static let dd_MM_YY             = "dd/MM/yy"
        static let yyyy_MM_dd           = "yyyy-MM-dd"
        static let yyyy_MM_dd_HH_mm     = "yyyy-MM-dd HH:mm"
        static let yyyy_MM_dd_HH_mm_ss  = "yyyy-MM-dd HH:mm:ss"
        static let yyyy_MM_dd_hh_mm     = "yyyy-MM-dd hh:mm"
        static let yyyy_MM_dd_hh_mm_a   = "yyyy-MM-dd hh:mm a"
        static let yyyy_MM_dd_h_mm_a    = "yyyy-MM-dd h:mm a"
        static let yyyy_MM_dd_T_HH_mm_ss_ssz   = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let dd_MMMM_yyyy         = "dd MMM yyyy" // 25 JUNE 2016
        static let MMMM_yyyy         = "MMM yyyy"
        static let yyyy_MM_dd_HH_mm_ss_z = "yyyy-MM-dd HH:mm:ss +z"
        static let MMM_dd_yyyy_hh_mm    = "MMM dd, yyyy  hh:mm a " // Aug 31, 2015
        static let EEE_MMM_dd_yyyy      = "EEE, MMM dd, yyyy" // Mon, Aug 31, 2015
        static let EEEE_MMMM_dd_yyyy    = "EEEE, MMMM dd, yyyy" // Monday, August 31, 2015
        static let yyyy_MM_dd_HH_mm_ss_Z  = "yyyy-MM-dd HH:mm:ss'Z'"
    }

    //MARK:  convert string from one format to others
    public static func convert(_ dateString: String, _ fromFormat: String, _ toFormat: String) ->  String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = NSTimeZone.system
        dateFormatter.locale = NSLocale(localeIdentifier:"en_US_POSIX") as Locale?  // for 12 hours
        let date = dateFormatter.date(from: dateString as String)
        
        dateFormatter.dateFormat = toFormat as String
        dateFormatter.timeZone = NSTimeZone.system
        dateFormatter.locale = NSLocale(localeIdentifier:"en_US_POSIX") as Locale?  // for 12 hours
        var dateFormatted : String = String()
        if let date = date {
            dateFormatted = dateFormatter.string(from: date)
        }
        return dateFormatted
    }
    
    //MARK:  Get date from string
    public static func UTCFromString(_ dateString: String, _ fromFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let date = dateFormatter.date(from: dateString)// create   date from string
        
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = NSTimeZone.local
//        if dateFormatter.string(from: date!) != ""
//        {
        if date != nil{
            
        if let timeStamp = dateFormatter.string(from: date!) as? String {
            return timeStamp
        }else{
            return ""
        }
        }
//        }
        else
        {
            return ""
        }
        
    }
    
    public static func dateFromString(_ dateString: String, _ fromFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = fromFormat
        let date = dateFormatter.date(from: dateString)!
        return date as Date?
    }
    
    //MARK:  Get string from date
    public static func stringFromDateUTC(_ date: Date, _ fromFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        //dateFormatter.locale = NSLocale(localeIdentifier:"en_US_POSIX") as Locale! // for 12 hours
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    //MARK:  Get string from date
    public static func stringFromDate(_ date: Date, _ fromFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = NSTimeZone.system
        dateFormatter.locale = NSLocale(localeIdentifier:"en_US_POSIX") as Locale? // for 12 hours
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    //MARK:  check device time format
    public static func isDevice12HoursTimeFormat() -> Bool {
        let locale = NSLocale.current
        let formatter : NSString = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)! as NSString
        if formatter.contains("a") {
            return true // //phone is set to 12 hours
        } else {
            return false //phone is set to 24 hours
        }
    }
    
    //MARK:  calculate age from DOB to current date
    public func calculateAge() -> (Int, Int, Int)? {
        let calendar: NSCalendar = NSCalendar.current as NSCalendar
        let now = calendar.startOfDay(for: NSDate() as Date)
        let birthdate = calendar.startOfDay(for: self as Date)
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day, NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        let ageComponents = calendar.components(unitFlags, from: birthdate, to: now, options: [])
        
        var days: Int = 0
        var months: Int = 0
        var years: Int = 0
        
        if let day = ageComponents.day {
            days = day
        }
        if let month = ageComponents.month {
            months = month
        }
        if let year = ageComponents.year {
            years = year
        }
        return (days, months, years)
    }
    
    //MARK:  get currency format
    public static func getCurrencyFormat(_ price: String) -> String {
        let convertPrice = NSNumber(value: Double(price)!)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD" // for county code view this http://www.science.co.il/International/Currency-codes.asp
        let convertedPrice = formatter.string(from: convertPrice)
        return convertedPrice!
    }
}

