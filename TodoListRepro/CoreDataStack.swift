//
//  CoreDataStack.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack { // Container has a viewContext
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoListRepro")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresovled error: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        let container = persistentContainer
        return container.viewContext
    }()
}


extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                try save()
            } catch {
                fatalError("Couldn't save due to: \(error.localizedDescription)")
            }
        }
    }
    
}
