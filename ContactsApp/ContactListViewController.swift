//
//  ContactListViewController.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/9/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.contacts?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contact = self.contacts![indexPath.row]
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(contact.firstName!) \(contact.lastName!)"
        
        return cell
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
        }
    }


}
