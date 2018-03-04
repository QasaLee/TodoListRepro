//
//  DataSource.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    let tableView: UITableView
    let context: NSManagedObjectContext
    
    init(with tableView: UITableView, context: NSManagedObjectContext) {
        self.context = context
        self.tableView = tableView
    }
    
    // MARK: - Fetched Results Controller
    lazy var fetchedResultsController: FetchedResultsController = {
        return FetchedResultsController(with: tableView, context: context)
    }()
    
    // MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let exactSection = fetchedResultsController.sections?[section] else {
            return 0
        }
        return exactSection.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        return configureCell(cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = fetchedResultsController.object(at: indexPath)
        context.delete(item)
        context.saveChanges()
    }
    
    // MARK: - Helper Mehthods
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        return cell
    }
    
    func object(at indexPath: IndexPath) -> Item {
        return fetchedResultsController.object(at: indexPath)
    }
    
}
