//
//  ViewController.swift
//  Project1
//
//  Created by Sanjay Shrestha on 1/18/16.
//  Copyright © 2016 Sanjay Shrestha. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailTextView: UITextField!
    @IBOutlet weak var userPasswordTextView: UITextField!
    
    @IBOutlet weak var userRepeatPasswordTextView: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail =  userEmailTextView.text
        let userPassword = userPasswordTextView.text
        let userRepeatPassword = userRepeatPasswordTextView.text
        
        //check for empty fields
        if (userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty)
        {
            //Display alert message
            displayMyAlertMessage("All fields are required")
            return;
        }
        if (userPassword != userRepeatPassword){
            //Display an alert
            displayMyAlertMessage("Passwords do not match")
        }
        //store data
        //Need to Store data in ServerSide
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        //display alert message with confirmation
        
        
        let myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion:nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }
    
}

