//
//  DetailController.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//

import UIKit
import CoreData

class DetailController: UIViewController {
    
    var item: Item!
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = item.text
    }

    @IBAction func save(_ sender: Any) {
        guard let newText = textField.text else { return }
        item.text = newText
        context.saveChanges()
        // !!!!!!!!!!!
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        context.delete(item)
        context.saveChanges()
        navigationController?.popViewController(animated: true)
    }
    

}
