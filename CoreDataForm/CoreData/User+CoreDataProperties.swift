//
//  User+CoreDataProperties.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 07/04/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var fName: String?
    @NSManaged public var lName: String?
    @NSManaged public var mobileNumber: Int16
    @NSManaged public var gender: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var userAddress: NSSet?

}

extension User {
    @objc(addUserAddressObject:)
    @NSManaged public func addToUserAddress(_ value: Address)

    @objc(removeUserAddressObject:)
    @NSManaged public func removeFromUserAddress(_ value: Address)

    @objc(addUserAddress:)
    @NSManaged public func addToUserAddress(_ values: NSSet)

    @objc(removeUserAddress:)
    @NSManaged public func removeFromUserAddress(_ values: NSSet)

}
