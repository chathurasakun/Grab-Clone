//
//  UserDetailsEntity+CoreDataProperties.swift
//  
//
//  Created by CHATHURA ELLAWALA on 16/11/2024.
//
//

import Foundation
import CoreData


extension UserDetailsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetailsEntity> {
        return NSFetchRequest<UserDetailsEntity>(entityName: "UserDetailsEntity")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var userDeleted: Bool

}
