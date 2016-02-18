//
//  ViewController.swift
//  Project1
//
//  Created by Sanjay Shrestha on 1/18/16.
//  Copyright © 2016 Sanjay Shrestha. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate  {
    
    @IBOutlet weak var spareTitle: UITextView!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var conditionMainpage: UITextView!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var Register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not Logged in..")
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            print("Logged in..")
        }
        let loginButton : FBSDKLoginButton = FBSDKLoginButton()
        self.view.addSubview(loginButton)
        loginButton.frame.origin = CGPoint(x:85, y: 480)
    
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
  
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) == nil)
        {
            print("LoginComplete")
            
        }
        
        else {
            print("error message")
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

}


