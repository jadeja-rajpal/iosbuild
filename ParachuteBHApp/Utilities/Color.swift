//
//  FMColor.swift
//  Flirt Me
//
//  Created by Vishwajeet Kumar on 5/15/17.
//  Copyright © 2017 Vishwajeet Kumar. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK:  Get color from RGB
    public class func color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(red:red / 255.0, green:green / 255.0, blue:blue / 255.0, alpha:CGFloat(alpha!))
    }
    
    //MARK:  Get color from hex string
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    //MARK:  Get color from hex string
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}
