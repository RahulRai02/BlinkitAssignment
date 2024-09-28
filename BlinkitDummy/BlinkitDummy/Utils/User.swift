//
//  User.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 29/09/24.
//

import Foundation
import SwiftUI

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
