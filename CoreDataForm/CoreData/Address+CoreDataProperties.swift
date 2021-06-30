//
//  Address+CoreDataProperties.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 07/04/21.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var street: String?
    @NSManaged public var area: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var addreessUser: User?

}

