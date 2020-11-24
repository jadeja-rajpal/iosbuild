//
//  ApiConstant.swift
//  iOSArchitecture_MVVM
//
//  Created by Surjeet Singh on 15/03/2019.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import UIKit

enum Config {
    
    // Copy base url here
    // https://api.github.com/users/hadley/orgs
    #if DEVELOPMENT
    static let BASE_URL:String = "https://api.github.com/users/hadley/"
    #else
    static let BASE_URL:String = "https://api.github.com/users/hadley/"
    #endif
    
    // All end points will be here
    static let login = "orgs"
    
}


enum Keys {
    static let email    = "email"
    static let password = "password"

}
