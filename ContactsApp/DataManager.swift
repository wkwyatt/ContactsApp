//
//  DataManager.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/9/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import Foundation
import CoreData

struct DataManager {
    static let sharedManager = DataManager()
    let coreDataManager:CoreDataManager = CoreDataManager()
    
    func createContact() -> Contact {
        let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact",
        inManagedObjectContext: coreDataManager.context) as? Contact
        let address = NSEntityDescription.insertNewObjectForEntityForName("Address",
        inManagedObjectContext: coreDataManager.context) as? Address
        contact?.address = address
        
        let uuid = NSUUID()
        contact?.contactId = Int(uuid.UUIDString)
        return contact!
    }
    
    func saveContacts(contacts: [Contact]) {
        //    do some stuff     
        let destinationPath = self.filePathForArchiving()
        NSKeyedArchiver.archiveRootObject(contacts, toFile: destinationPath)
    }
    
    func save() {
        do {
            try self.coreDataManager.context.save()
    } catch {
            print("failed to save the contact: \(error)")
        }
    }
    
    private func filePathForArchiving() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = "\(documentsPath)/SavedContacts"
        
        return destinationPath
    }
    
    func getContact(contactId contactId:Int) -> Contact? {
        
        let query = NSFetchRequest(entityName: "Contact")
        
        let filter = NSPredicate(format: "contactId = %@", String(contactId))
        
        query.predicate = filter
        
        do {
            if let results = try self.coreDataManager.context.executeFetchRequest(query) as? [Contact] {
                if results.count > 0 {
                    return results[0]
                }
            }
        } catch {
            print("Failed to query for contact: \(error)")
        }
        return nil
    }
    
    func loadContacts() -> [Contact]? {
        let query = NSFetchRequest(entityName: "Contact")
        
        do {
            if let results = try self.coreDataManager.context.executeFetchRequest(query) as? [Contact]{
                return results
            }
        } catch {
            print("failed to load contacts: \(error)")
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