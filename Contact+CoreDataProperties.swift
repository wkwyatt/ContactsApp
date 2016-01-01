//
//  Contact+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Will Wyatt on 12/31/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var contactId: NSNumber?
    @NSManaged var address: Address?

}
