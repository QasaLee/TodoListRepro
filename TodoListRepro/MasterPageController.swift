//
//  MasterPageController.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//

import UIKit
import CoreData

class MasterPageController: UITableViewController {

    var context = CoreDataStack().context
    
    lazy var dataSource: DataSource = {
        return DataSource(with: tableView, context: context)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! AddItemController
            controller.context = context
        } else if segue.identifier == "ShowDetail" {
            let controller = segue.destination as! DetailController
            if let indexPath = tableView.indexPathForSelectedRow {
                controller.item = dataSource.object(at: indexPath)
            }
            controller.context = context
        }
    }
    
}
