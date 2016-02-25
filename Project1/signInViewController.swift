//
//  signInViewController.swift
//  Project1
//
//  Created by Sanjay Shrestha on 2/24/16.
//  Copyright © 2016 Sanjay Shrestha. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class signInViewController: UIViewController {
    
    //@IBOutlet weak var loginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //loginButton.delegate = self
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
