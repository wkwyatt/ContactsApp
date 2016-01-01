//
//  NewContactDelegate.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/11/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import Foundation

protocol NewContactDelegate : class {
    func didCreateNewContact(newContact: Contact)
    func didUpdateContact(contact: Contact)
}