//
//  User+CoreDataProperties.swift
//  
//
//  Created by Bharat Kakadiya on 08/04/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var fName: String?
    @NSManaged public var gender: String?
    @NSManaged public var lName: String?
    @NSManaged public var mobileNumber: Int16
    @NSManaged public var password: String?
    @NSManaged public var userAddress: Address?

}
