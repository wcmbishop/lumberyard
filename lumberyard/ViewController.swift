//
//  ViewController.swift
//  lumberyard
//
//  Created by Future Man on 4/6/16.
//  Copyright © 2016 Tranquility Base. All rights reserved.
//

// To Do List
// * Add a property to hold onto an instance of LogStore (see page 316 of TBNRG iOS Programming)


import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var toolClassTextField: UITextField!
    @IBOutlet weak var toolTextField: UITextField!
    @IBOutlet weak var metricTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    var logstore: LogStore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logstore.fetchToolsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func logValue(sender: UIButton) {
        showAlertTapped(self)
    }
    
    @IBAction func showAlertTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Log...", message: "Off to the lumberyard with you!", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let recordAction: UIAlertAction = UIAlertAction(title: "Record", style: .Default) { action -> Void in
            //Do some other stuff
        }
        actionSheetController.addAction(recordAction)
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.textColor = UIColor.blueColor()
            // make a nice string
            let toolClass: String = self.toolClassTextField.text!
            let tool: String = self.toolTextField.text!
            let metric: String = self.metricTextField.text!
            textField.text = "\(toolClass) - \(tool) - \(metric)"
        }
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }

}

