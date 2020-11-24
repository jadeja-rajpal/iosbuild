//
//  FMActivityIndicator.swift
//  Flirt Me
//
//  Created by Vishwajeet Kumar on 5/15/17.
//  Copyright © 2017 Vishwajeet Kumar. All rights reserved.
//

import UIKit

public class ActivityIndicator: UIView {
    
    static let shared = ActivityIndicator()
    
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var textLabel: UILabel = UILabel()
    var loadingImage: UIImageView = UIImageView()
    
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    public func show(_ view: UIView, _ message: String? = nil, _ applyOnWindow: Bool = true)  {
        DispatchQueue.main.async {
           // self.appDelegate.window.isUserInteractionEnabled = !applyOnWindow
            self.frame = UIScreen.main.bounds
            self.frame.origin.y = UIScreen.main.bounds.origin.y - 20
            self.frame.size.height = UIScreen.main.bounds.size.height+20
            self.center = self.center
            self.backgroundColor = .clear
            if let textMessage = message, textMessage.count > 0 {
                self.loadingView.frame = CGRect(x:0, y:0, width:100, height:100)
                self.textLabel.frame = CGRect(x:0, y: 60, width:self.loadingView.frame.size.width, height:40)
                self.textLabel.textColor = UIColor.white
                self.textLabel.text = message
                self.textLabel.font.withSize(18)
                self.textLabel.numberOfLines = 0
                self.textLabel.textAlignment = NSTextAlignment.center
                self.loadingView.addSubview(self.textLabel)
                self.activityIndicator.center = CGPoint(x:self.loadingView.frame.size.width / 2, y: self.loadingView.frame.size.height / 2 - 50)
            }
            else {
                
                self.loadingView.frame = CGRect(x:UIScreen.main.bounds.size.width/2-40, y:UIScreen.main.bounds.size.height/2-40, width:80, height:80)
                self.activityIndicator.center = CGPoint(x:self.loadingView.frame.size.width / 2, y: self.loadingView.frame.size.height / 2)
            }
           // self.loadingView.center = UIScreen.main.bounds
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10

            self.loadingView.backgroundColor = UIColor.white
           // color(100, 100, 100, 1.0)
            self.activityIndicator.frame = CGRect(x:0, y:0, width:80, height:80)

            self.activityIndicator.style = .whiteLarge
            self.activityIndicator.color = UIColor.gray//UIColor.color(191, 191, 191)
            self.activityIndicator.startAnimating()
            self.loadingView.addSubview(self.activityIndicator)
            
            self.addSubview(self.loadingView)
            view.addSubview(self)
        }
    }
    
  /**  public func showGif(_ view: UIView, _ message: String? = nil, _ applyOnWindow: Bool = true) {
        DispatchQueue.main.async {
            self.appDelegate.window!.isUserInteractionEnabled = !applyOnWindow
            self.frame = view.frame
            self.frame.origin.y = view.frame.origin.y - 20
            self.center = self.center
            self.backgroundColor = UIColor.clear
            
            if let textMessage = message, textMessage.count > 0 {
                self.loadingView.frame = CGRect(x:0, y:0, width:100, height:100)
                self.textLabel.frame = CGRect(x:0, y: 60, width:self.loadingView.frame.size.width, height:40)
                self.textLabel.textColor = UIColor.black
                self.textLabel.text = message
                self.textLabel.font.withSize(18)
                self.textLabel.numberOfLines = 0
                self.textLabel.textAlignment = NSTextAlignment.center
                self.loadingView.addSubview(self.textLabel)
            }
            else {
                self.loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
            }
            self.loadingView.center = view.center
            self.loadingView.backgroundColor = UIColor.clear
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.loadingImage.frame = CGRect(x:0, y:0, width:80, height:80)
            self.loadingImage.center = CGPoint(x:self.loadingView.frame.size.width / 2, y:self.loadingView.frame.size.height / 2)
            self.loadingImage.image =   UIImage.gif(name: "loadingimage")
            
//            let templateImage = self.loadingImage.image?.withRenderingMode(.alwaysTemplate)
//            self.loadingImage.image = templateImage
//            self.loadingImage.tintColor = .black
//            self.loadingView.addSubview(self.loadingImage)

            self.loadingView.addSubview(self.loadingImage)
            self.addSubview(self.loadingView)
            view.addSubview(self)
        }
    }
    **/
    public func hide() {
        DispatchQueue.main.async {
          //  self.appDelegate.window.isUserInteractionEnabled = true
            self.activityIndicator.stopAnimating()
            self.removeFromSuperview()
        }
    }
}
