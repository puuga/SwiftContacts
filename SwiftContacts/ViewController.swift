//
//  ViewController.swift
//  SwiftContacts
//
//  Created by Siwawes Wongcharoen on 11/1/2557 BE.
//  Copyright (c) 2557 puuga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!;
    let cellIndentifier = "Cel";
    var contracts = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Swift Contacts";
        
        var contract = [];
        
        let c1 = Contact(Firstname: "Peter", Lastname: "Parker", Telephone: "1234");
        let c2 = Contact(Firstname: "Anakin", Lastname: "Skywalker", Telephone: "2345");
        let c3 = Contact(Firstname: "Jacky", Lastname: "Chan", Telephone: "3456");
        let c4 = Contact(Firstname: "Barry", Lastname: "Flash", Telephone: "4567");
        let c5 = Contact(Firstname: "Oliver", Lastname: "Arrow", Telephone: "5678");
        
        contracts = [c1,c2,c3,c4,c5];
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contracts.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var ident = indexPath.row % 2 == 0 ? cellIndentifier : "Cel2"
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(ident) as UITableViewCell;
        
        let contract: Contact = contracts[indexPath.row] as Contact;
        cell.textLabel.text = contract.toString();
        cell.detailTextLabel?.text = contract.telephoneNumber;
        
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contract: Contact = contracts[indexPath.row] as Contact;
        //println("select \(contract.toString())");
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let detailViewController = segue.destinationViewController as DetailViewController;
        let contract: Contact = contracts[self.tableView.indexPathForSelectedRow()!.row] as Contact;
        detailViewController.contract = contract;
        println("select \(contract.toString())");

        
    }

}

