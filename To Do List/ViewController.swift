//
//  ViewController.swift
//  To Do List
//
//  Created by Regina Imhoff on 9/9/16.
//  Copyright © 2016 Regina Imhoff. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel!.text = "Do this thing"
        return cell
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        alertPopup()
    }
    
    func saveNewItem(){
        print("Item saved!")
    }
    
    func configurationTextField(textField: UITextField){
        textField.placeholder = "Enter new item"
        self.tField = textField
    }
    
    func alertPopup(){
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel){
            UIAlertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default){
            UIAlertAction in
            self.saveNewItem()
        }
        alert.addTextFieldWithConfigurationHandler(configurationTextField)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    

    


}

