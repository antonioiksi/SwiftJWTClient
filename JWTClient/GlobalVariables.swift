//
//  GlobalVariables.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 24/04/2018.
//
//

import Foundation

class GlobalVariables {
    
    init() {
        self.base_url = "http://172.20.10.5:5000/"
    }
    
    // These are the properties you can store in your singleton
    private var base_url: String {
        set { self.base_url = newValue }
        get { return self.base_url }
    }


    
    private var access_token: String = ""
    
    //private var token: String {
    //    set { self.token = newValue }
    //    get { return self.token }
    //}
    
    func setAccessToken( access_token: String) {
        self.access_token = access_token
    }

    func  getAccessToken( ) -> String {
        return self.access_token
    }

    
    func  getBaseUrl( ) -> String {
        return self.base_url
    }
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
            
        }
        return Static.instance
    }
}
