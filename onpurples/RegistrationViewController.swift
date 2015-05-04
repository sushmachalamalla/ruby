//
//  RegistrationViewController.swift
//  onpurples
//
//  Created by Sushma Reddy on 5/3/15.
//  Copyright (c) 2015 Sushma Reddy. All rights reserved.
//

import UIKit
import Parse

class RegistrationViewController: UIViewController {
    
    @IBOutlet var registrationEmail: UITextField!

    @IBOutlet var registrationStatus: UILabel!
   
   
    @IBOutlet var registrationUsername: UITextField!
    
    
    @IBOutlet var registrationPassword: UITextField!
    
    
   @IBAction func registrationButton(sender: AnyObject) {
        
        var usrEntered = registrationUsername.text
        var pwdEntered = registrationPassword.text
       var emlEntered = registrationEmail.text
       // var messageLabel = registrationStatus.text
        
        //parse function
       func userSignUp() {
            var user = PFUser()
            user.username = usrEntered
            user.password = pwdEntered
            user.email = emlEntered
           // user.status=messageLabel
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                   // self.messageLabel.text = "User Signed Up";
                    
                    
                    self.performSegueWithIdentifier("registrationHomeSegue", sender: self)
                   
                    
                } else {
                    // Show the errorString somewhere and let the user try again.
                }
            }
            
        }
        
        if usrEntered != "" && pwdEntered != "" && emlEntered != "" {
            // If not empty then yay, do something
            
            userSignUp()
            //self.performSegueWithIdentifier("homeSegue", sender: self)
            
        }
       else  if usrEntered == ""{
            self.registrationStatus.text = "Username Required"
        }
   else if pwdEntered == ""{
        self.registrationStatus.text = "Password Required"
    }
  else  if emlEntered == ""{
        self.registrationStatus.text = "Email Required"
    }
        
        else {
            self.registrationStatus.text = "All Fields Required"
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
