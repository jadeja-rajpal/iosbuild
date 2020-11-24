//
//  FMDevice.swift
//  Flirt Me
//
//  Created by Vishwajeet Kumar on 5/15/17.
//  Copyright © 2017 Vishwajeet Kumar. All rights reserved.
//

import UIKit
import CoreTelephony

public class Device: NSObject {
    
    static let orientation = Orientation()
    static let landscapeOrientation = LandscapeOrientation()
    static let portraitOrientation = PortraitOrientation()
    static let flatOrientation = FlatOrientation()
    static let batteryState = BatteryState()
    
    public struct Orientation {
        public var isLanscape = UIDevice.current.orientation.isLandscape
        public var isPortrait = UIDevice.current.orientation.isPortrait
        public var isFlat = UIDevice.current.orientation.isFlat
    }
    
    public struct LandscapeOrientation {
        public var left = UIDevice.current.orientation == .landscapeLeft
        public var right = UIDevice.current.orientation == .landscapeRight
    }
    
    public struct PortraitOrientation {
        public var up = UIDevice.current.orientation == .portrait
        public var down = UIDevice.current.orientation == .portraitUpsideDown
    }
    
    public struct FlatOrientation {
        public var faceUp = UIDevice.current.orientation == .faceUp
        public var faceDown = UIDevice.current.orientation == .faceDown
    }
    
    public struct BatteryState {
        public var unplugged = UIDevice.current.batteryState == .unplugged
        public var charging = UIDevice.current.batteryState == .charging
        public var full = UIDevice.current.batteryState == .full
        public var unknown = UIDevice.current.batteryState == .unknown
    }
    
    public struct UserInterfaceIdiom {
        public static let simulator: Bool = {
            var isSim = false
            #if arch(i386) || arch(x86_64)
                isSim = true
            #endif
            return isSim
        }()
        public static let phone = UIDevice.current.userInterfaceIdiom == .phone
        public static let pad = UIDevice.current.userInterfaceIdiom == .pad
        public static let tv = UIDevice.current.userInterfaceIdiom == .tv
        public static let carPlay = UIDevice.current.userInterfaceIdiom == .carPlay
    }
    
    public struct ScreenSize {
        public static let width = UIScreen.main.bounds.size.width
        public static let height = UIScreen.main.bounds.size.height
        public static let maximumLength = max(width, height)
        public static let minimumLength = min(width, height)
    }
    
    public struct Phone {
        public static let iPhone4 = UserInterfaceIdiom.phone && ScreenSize.maximumLength == 480.0
        public static let iPhone5 = UserInterfaceIdiom.phone && ScreenSize.maximumLength == 568.0
        public static let iPhone6 = UserInterfaceIdiom.phone && ScreenSize.maximumLength == 667.0
        public static let iPhone6Plus = UserInterfaceIdiom.phone && ScreenSize.maximumLength == 736.0
        public static let iPhoneX = iPhone6Plus
        public static let iPhone7 = iPhone6
        public static let iPhone7Plus = iPhone6Plus
    }
    
    public struct Pad {
        public static let iPad = UserInterfaceIdiom.pad && ScreenSize.maximumLength == 1024.0
        public static let iPadRetina = UserInterfaceIdiom.pad && ScreenSize.maximumLength == 1366.0
    }
    
    public struct OSVersion {
        private static let iOSVersion = (UIDevice.current.systemVersion as NSString).floatValue
        public static let iOS7 = (iOSVersion < 8.0 && iOSVersion >= 7.0)
        public static let iOS8 = (iOSVersion >= 8.0 && iOSVersion < 9.0)
        public static let iOS9 = (iOSVersion >= 9.0 && iOSVersion < 10.0)
        public static let iOS10 = (iOSVersion >= 10.0 && iOSVersion < 11.0)
    }
    
    public struct Details {
        public static let name                =   UIDevice.current.name
        public static let model               =   UIDevice.current.model
        public static let localizedModel      =   UIDevice.current.localizedModel
        public static let systemName          =   UIDevice.current.systemName
        public  static let systemVersion      =   UIDevice.current.systemVersion
        public static let batteryLavel        =   UIDevice.current.batteryLevel
        public static let uuid                =   UIDevice.current.identifierForVendor?.uuidString
        public static let language            =   NSLocale.preferredLanguages
        public static let languageCode        =   NSLocale.isoLanguageCodes
        public static let countryCode         =   NSLocale.isoCountryCodes
        public static let currencyCode        =   NSLocale.isoCurrencyCodes
        public static let carrierName: String? =   Device.carrier()
    }
    
    // return device carrier name
    private class func carrier() -> String? {
        let phoneInfo = CTTelephonyNetworkInfo()
        if let phoneCarrier = phoneInfo.subscriberCellularProvider {
            if phoneCarrier.carrierName?.count == 0 {
                return "Wifi"
            }
            return phoneCarrier.carrierName
        }
        return "Wifi"
    }
}

// Get details about build
public struct AppIdentity {
    public static let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    public static let build   = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
}
