//
//  Contact.swift
//  SwiftContacts
//
//  Created by Siwawes Wongcharoen on 11/1/2557 BE.
//  Copyright (c) 2557 puuga. All rights reserved.
//

import Foundation
class Contact {
    var firstName: String?
    var lastName: String?
    var telephoneNumber: String?
    
    init(Firstname firstname:String, Lastname lastname:String, Telephone telNumber:String) {
        firstName = firstname;
        lastName = lastname;
        telephoneNumber = telNumber;
    }
    
    func toString() -> String {
        return self.firstName!+" "+self.lastName!+", "+self.telephoneNumber!;
    }
}

