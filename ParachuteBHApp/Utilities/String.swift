//
//  FMString.swift
//  Flirt Me
//
//  Created by Vishwajeet Kumar on 5/22/17.
//  Copyright © 2017 Vishwajeet Kumar. All rights reserved.
//

import UIKit
//import CryptoSwift

extension String {
    
    func SpecificLetterCount(str:String, char:Character) ->Int {
        let letters = Array(str); var count = 0
        for letter in letters {
            if letter == char {
                count += 1
            }
        }
        return count
    }
    
//    public func isValidEmail() -> Bool {
//        let stricterFilterString : String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//        let emailTest : NSPredicate = NSPredicate(format: "SELF MATCHES %@", stricterFilterString)
//        return emailTest.evaluate(with: self)
//    }
    
    public func validatePhoneNumber() -> String {
        var phoneNumber = self.replacingOccurrences(of: "-", with: "")
        phoneNumber = phoneNumber.replacingOccurrences(of: "(", with: "")
        phoneNumber = phoneNumber.replacingOccurrences(of: ")", with: "")
        return phoneNumber
    }
    
    func isPasswordValid() -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9])(?=.*[A-Za-z]).{6,20}$")
        return passwordTest.evaluate(with: self)
    }
    
    public func trimSpace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func length() -> Int {
        return self.count
    }
    
  
    
//    func encryptString() -> String{
//        do {
//            // Encryption...
//            let aes = try! AES(key:Encryption.key, iv:Encryption.iv, padding: .pkcs7) // aes128
//            let ciphertext = try aes.encrypt(Array(self.utf8))
//             print("Encrypted Text: \(ciphertext)")
//             return self
//
//        } catch {
//            print(error)
//        }
//        return ""
//    }
//
//
//    func decryptString() -> String {
//        do {
//        return String(self)
//        } catch {
//                    print(error)
//        }
//            return ""
//    }
//
        var htmlToAttributedString: NSAttributedString? {
            guard let data = data(using: .utf8) else { return NSAttributedString() }
            do {
                return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch {
                return NSAttributedString()
            }
        }
        var htmlToString: String {
            return htmlToAttributedString?.string ?? ""
        }
    
    func attributedTextString() -> NSAttributedString {
        let text = self
        let textRange = NSRange(location: 0, length: (text.count))
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
     //   attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: AppFont.openSansRegular, size:11.0) ?? "", range: textRange)
        return attributedText
    }
    
    func heightForWithFont(_ width: CGFloat, _ insets: UIEdgeInsets) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width + insets.left + insets.right, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont(name: "Helventica", size: 15.0)
        label.text = self
        
        label.sizeToFit()
        return label.frame.height + insets.top + insets.bottom
    }
    
    func sizeOfString (_ width: CGFloat = CGFloat.greatestFiniteMagnitude, font : UIFont, height: CGFloat = CGFloat.greatestFiniteMagnitude, drawingOption: NSStringDrawingOptions = NSStringDrawingOptions.usesLineFragmentOrigin) -> CGSize {
        return NSString(string: self).boundingRect(with: CGSize(width: width, height: height), options: drawingOption, attributes: [NSAttributedString.Key.font:font], context: nil).size
    }
    
    func utf8String(_ plusForSpace: Bool=false) -> String {
        var encoded = ""
        let unreserved = "*-._"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        
        if plusForSpace {
            allowed.addCharacters(in: " ")
        }
        if let encode = addingPercentEncoding(withAllowedCharacters:allowed as CharacterSet) {
            if plusForSpace {
                encoded = encode.replacingOccurrences(of: " ", with: "+")
            }
        }
        return encoded
    }
    
    func attributedString() -> NSMutableAttributedString {
        let range = (self as NSString).range(of: "*")
        let attributedString = NSMutableAttributedString(string:self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: NSRange(location: 0, length: self.count))
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], range: range)
        return attributedString
    }
    
}

extension Array {
    
    func containsObject<T>(_ obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    public func jsonString() -> String {
        do {
            let jsonData: NSData =  try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
            
            return String(data: jsonData as Data, encoding: String.Encoding.utf8)!
            
        } catch {
            print(error.localizedDescription)
        }
        return String()
    }
}

extension Data {
    
    var string: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}


extension UINavigationController {
    
    public func setupNavigationBar() {
        self.interactivePopGestureRecognizer?.isEnabled = false
        self.isNavigationBarHidden = false
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
      //  self.navigationBar.tintColor = AppColor.lightGrayColor
        self.navigationBar.clipsToBounds = false
    }
}

extension UITableView {
    
    public func deleteEmptyRow() {
        self.tableHeaderView = UIView(frame: CGRect.zero)
        self.tableFooterView = UIView(frame: CGRect.zero)
    }
}


extension UIView {
    func applyGradient(_ colours: [UIColor]) -> Void {
        self.applyGradient(colours, nil)
    }
    
    func applyGradient(_ colours: [UIColor], _ locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
    }
}
