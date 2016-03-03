//
//  profileViewController.swift
//  Project1
//
//  Created by Sanjay Shrestha on 2/15/16.
//  Copyright © 2016 Sanjay Shrestha. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var userNameTextView: UITextField!
    
    @IBOutlet weak var userEmailTextView: UITextField!
    
    @IBOutlet weak var userPhoneNumberTextView: UITextField!
    
    @IBOutlet weak var userPinTextView: UITextField!
    
   // @IBOutlet weak var userCurrencyTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        
    }
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
    }

    @IBAction func confirmButtonTapped(sender: AnyObject) {
        let userName = userNameTextView.text
        let userEmail =  userEmailTextView.text
        let userPhone = userPhoneNumberTextView.text
        let userPin    = userPinTextView.text
      //  let userCurrency = userCurrencyTextView.text
        
        //check for empty fields
        if (userName!.isEmpty || userEmail!.isEmpty || userPhone!.isEmpty || userPin!.isEmpty )// userCurrency!.isEmpty)
        {
            //Display alert message
            displayMyAlertMessage("All fields are requrired")
            return;
        }
        
        //also check if they entered the same email
        
        //store data
        //Need to Store data in ServerSide
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: "userName")
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPhone, forKey: "userPhone")
        NSUserDefaults.standardUserDefaults().setObject(userPin, forKey: "userPin")
        //NSUserDefaults.standardUserDefaults().setObject(userCurrency, forKey: "userCurrency")
        
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




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/
