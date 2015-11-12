//
//  Contact.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/9/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import Foundation

class Contact : NSObject, NSCoding {
    var firstName : String?
    var lastName : String?
    var phoneNumber : String?
    var streetAddress : String?
    var city : String?
    var state : String?
    var zipCode : String?
    
    override init() {
        super.init()
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
        self.phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
        self.streetAddress = aDecoder.decodeObjectForKey("streetAddress") as? String
        self.city = aDecoder.decodeObjectForKey("city") as? String
        self.state = aDecoder.decodeObjectForKey("state") as? String
        self.zipCode = aDecoder.decodeObjectForKey("zipCode") as? String
        
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName") as? String
        aCoder.encodeObject(self.lastName, forKey: "lastName") as? String
        aCoder.encodeObject(self.phoneNumber, forKey: "phoneNumber") as? String
        aCoder.encodeObject(self.streetAddress, forKey: "streetAddress") as? String
        aCoder.encodeObject(self.city, forKey: "city") as? String
        aCoder.encodeObject(self.state, forKey: "state") as? String
        aCoder.encodeObject(self.zipCode, forKey: "zipCode") as? String
    }
    

}

