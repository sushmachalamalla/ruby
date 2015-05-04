//
//  ViewController.swift
//  onpurples
//
//  Created by Sushma Reddy on 4/24/15.
//  Copyright (c) 2015 Sushma Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var loginStatus: UILabel!
    
    @IBOutlet var loginUsername: UITextField!
    
    
    @IBOutlet var loginPassword: UITextField!
    
    
    
    @IBAction func loginButton(sender: AnyObject) {
        
        if loginUsername.text != "" && loginPassword.text != "" {
            // Not Empty, Do something.
            PFUser.logInWithUsernameInBackground(loginUsername.text, password:loginPassword.text) {
                (user: PFUser!, error: NSError!) -> Void in
                if user != nil {
                    // Yes, User Exists
                    self.loginStatus.text = "User Exists"
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                    
                    
                } else {
                    // No, User Doesn't Exist
                    self.loginStatus.text = "Enter Valid Credentials"
                }
            }
            

        }
       else if loginUsername == ""{
            self.loginStatus.text = "Username Required"
        }
       else if loginPassword == ""{
            self.loginStatus.text = "Password Required"
        }

        else {
            // Empty, Notify user
            self.loginStatus.text = "All Fields Required"
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

