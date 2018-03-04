//
//  Item+CoreDataProperties.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        let descriptor = NSSortDescriptor(key: "text", ascending: true)
        request.sortDescriptors = [descriptor]
        return request
    }

    @NSManaged public var isDone: Bool
    @NSManaged public var text: String?
    
}
