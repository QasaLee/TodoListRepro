//
//  FetchedResultsController.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//

import UIKit
import CoreData

class FetchedResultsController: NSFetchedResultsController<Item> , NSFetchedResultsControllerDelegate{
    
    var tableView: UITableView!
    
    init(with tableView: UITableView, context: NSManagedObjectContext) {
        self.tableView = tableView
        super.init(fetchRequest: Item.fetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.delegate = self
        
        tryFetch()
    }
    
    
    // Fetched Results Controller Delegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        case .insert:
            guard let newIndexPath = newIndexPath else {
                return
            }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        case .move, .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // MARK: - Helper Methods
    
    func tryFetch() {
        do {
            try self.performFetch()
        } catch {
            fatalError("Unable to perform fetch due to: \(error.localizedDescription)")
        }
    }
    
}
