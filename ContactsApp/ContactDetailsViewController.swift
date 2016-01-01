//
//  ContactDetailsViewController.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/9/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, NewContactDelegate {

//    outlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    
//    variables
    var selectedContact:Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.firstNameLabel.text = selectedContact.firstName
        self.lastNameLabel.text = selectedContact.lastName
        self.phoneNumberLabel.text = selectedContact.phoneNumber
        self.streetAddressLabel.text = self.selectedContact.address?.street
        self.cityLabel.text = selectedContact.address?.city
        self.stateLabel.text = selectedContact.address?.state
        self.zipCodeLabel.text = selectedContact.address?.zipCode
        
    
    }

    func didUpdateContact(contact: Contact) {
        self.selectedContact = contact
        self.updateTextFields()
    }
    
    func didCreateNewContact(newContact: Contact) {
        //
    }
    
    func updateTextFields() {
        self.firstNameLabel.text = self.selectedContact?.firstName
        self.lastNameLabel.text = self.selectedContact?.lastName
        self.phoneNumberLabel.text = self.selectedContact?.phoneNumber
        self.streetAddressLabel.text = self.selectedContact?.address?.street
        self.cityLabel.text = self.selectedContact?.address?.city
        self.stateLabel.text = self.selectedContact?.address?.state
        self.zipCodeLabel.text = self.selectedContact?.address?.zipCode
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EditContactSegue" {
            if let vc = segue.destinationViewController as? NewContactViewController {
                vc.delegate = self
                vc.editContact = self.selectedContact
            }
        }
    }


}
