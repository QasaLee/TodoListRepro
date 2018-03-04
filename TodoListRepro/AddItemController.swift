//
//  AddItemController.swift
//  TodoListRepro
//
//  Created by M78的星际人士 on 3/4/18.
//  Copyright © 2018 M78的星际人士. All rights reserved.
//

import UIKit
import CoreData

class AddItemController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context) as! Item
        item.text = text
        // In the end, never forget to save!!!
        context.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
