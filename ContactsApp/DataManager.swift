//
//  DataManager.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/9/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import Foundation

struct DataManager {
    static let sharedManager = DataManager()
    
    
    func saveContacts(contacts: [Contact]) {
        //    do some stuff     
        let destinationPath = self.filePathForArchiving()
        NSKeyedArchiver.archiveRootObject(contacts, toFile: destinationPath)
    }
    
    private func filePathForArchiving() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = "\(documentsPath)/SavedContacts"
        
        return destinationPath
    }
    
    func loadContacts() -> [Contact]? {
        let destinationPath = self.filePathForArchiving()
        
        if let contacts:[Contact] = NSKeyedUnarchiver.unarchiveObjectWithFile(destinationPath) as? [Contact] {
            return contacts
        }
        
        return [Contact]()
        
        
//        CODE FOR CONTACT AS A STRUCT
//        var contacts = [Contact]()
//        for var i = 0; i < 10; i++ {
//            var c = Contact()
//            c.firstName = "Vinny"
//            c.lastName = "Barbarino"
//            c.streetAddress = "123 Happy Street"
//            c.phoneNumber = "404-555-1212"
//            c.city = "Brooklyn"
//            c.state = "New York"
//            c.zipCode = "11201"
//            contacts.append(c)
//        }
//        return contacts
    }
}