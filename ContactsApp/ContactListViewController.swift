//
//  ContactListViewController.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/9/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewContactDelegate {
    
//    variables
    var contacts:[Contact]?
    
//    outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.contacts = DataManager.sharedManager.loadContacts()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        print(contacts)
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.contacts?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contact = self.contacts![indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("contactCellReuseID", forIndexPath: indexPath) as? ContactTableViewCell {
            cell.firstNameLabel.text = contact.firstName
            cell.lastNameLabel.text = contact.lastName
            
            if indexPath.row % 2 == 0 {
                cell.contactImage.image = UIImage(named: "Contact_Female")
            } else {
                cell.contactImage.image = UIImage(named: "Contact_Male")
            }
            return cell
        }
        
//        cell.textLabel?.text = "\(contact.firstName!) \(contact.lastName!)"
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ContactDetailsSegue", sender: self)
    }
    
//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ContactDetailsSegue" {
            if let selectedCell = self.tableView.indexPathForSelectedRow {
                let selectedContact = self.contacts![selectedCell.row]
                
                if let detailVC = segue.destinationViewController as? ContactDetailsViewController {
                    detailVC.selectedContact = selectedContact
                }
            }
        } else if segue.identifier == "NewContactSegue" {
            if let newContactVC = segue.destinationViewController as? NewContactViewController {
                newContactVC.delegate = self
            }
        }
    }
    
    
    @IBAction func importButtonTouched(sender: AnyObject) {
        let wsm = WebServiceManager()
        wsm.fetchContacts(currContacts: self.contacts) {
            (newContacts) -> Void in
            //code in closure 
            for contact in newContacts {
                self.contacts?.append(contact)
            }
        }
    }
    
    @IBAction func refreshButtonTouched(sender: AnyObject) {
        self.tableView.reloadData()
    }

    // protocals for custom delegate
    func didCreateNewContact(newContact: Contact) {
        self.contacts?.append(newContact)
        
        self.tableView.reloadData()
    }

    func didUpdateContact(contact: Contact) {
        // code here
    }

}
