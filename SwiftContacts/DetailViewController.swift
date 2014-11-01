//
//  DetailViewController.swift
//  SwiftContacts
//
//  Created by Siwawes Wongcharoen on 11/1/2557 BE.
//  Copyright (c) 2557 puuga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var tvFirstName: UILabel!;
    @IBOutlet var tvLastName: UILabel!;
    @IBOutlet var tvTelephone: UILabel!;
    @IBOutlet var uiImage: UIImageView!;
    
    
    
    var contract:Contact!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationItem.title = contract.firstName! + " " + contract.lastName!;
        self.tvFirstName.text = contract.firstName;
        self.tvLastName.text = contract.lastName;
        self.tvTelephone.text = contract.telephoneNumber;
    }
    
    @IBAction func call() {
        println("call");
        let phone = "tel://"+contract.telephoneNumber!;
        let url:NSURL = NSURL(string: phone)!;
        
        if !UIApplication.sharedApplication().openURL(url) {
            UIAlertView(title: "Sorry", message: "Can't make a call", delegate: nil, cancelButtonTitle: "OK").show();
        }
    }
    
}

