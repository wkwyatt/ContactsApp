//
//  WebServiceManager.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/16/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import Foundation
import CoreData

struct WebServiceManager {
    
    func fetchContacts(currContacts currContacts:[Contact]?, callback: ([Contact]) -> Void) {
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {
            data, response, err in
            // Code goes here
            if err == nil {
                // processing code goes here
                // create array of Contacts to send to callback
                var contactList = [Contact]()
                do {
                    if let jsonArray:[ [String: AnyObject] ] = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [[String : AnyObject]] {
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            // use json array here
                            for jsonDict in jsonArray {
                                //us jsonDict here
                                let newContact = self.parseContact(jsonDict)
                                var contactExist = false
                                if currContacts != nil {
                                    for contact in currContacts! {
                                        if contact.contactId == newContact.contactId {
                                            contactExist = true
                                        }
                                    }
                                }
                                if !contactExist { contactList.append(newContact) }
                            }
                            callback(contactList)
                        })
                    }
                } catch {
                    // we have an error
                    callback([])
                }
            } else {
                // got an error, print error
                print("Got an error: \(err)")
            }
        }
        
        task.resume()
    }
    
    private func parseContact(jsonDict:[String: AnyObject]) -> Contact {
        
        
        let newContact = DataManager.sharedManager.createContact()
        
        // use newContact here
        newContact.phoneNumber = jsonDict["phone"] as? String
        if let addressDict = jsonDict["address"] as? [String: AnyObject] {
            //use properties of addressDict here
            newContact.address?.street = addressDict["street"] as? String
            newContact.address?.city = addressDict["city"] as? String
            newContact.address?.zipCode = addressDict["zipcode"] as? String
        }
        
        if let contactId = jsonDict["id"] as? NSNumber {
            newContact.contactId = contactId
        }
        
        if let fullName = jsonDict["name"] as? String {
            // use full name here
            let fullNameArray = fullName.componentsSeparatedByString(" ")
            
            if fullNameArray.count > 1 {
                // use fullNameArray here
                newContact.firstName = fullNameArray[0]
                newContact.lastName = fullNameArray[1]
            }
        }
        
        DataManager.sharedManager.save()
        return newContact
    }
}