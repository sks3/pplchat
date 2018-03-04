//
//  ViewController.swift
//  ppl chat
//
//  Created by somi on 2/28/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
  
  @IBAction func signUpButton(_ sender: Any) {
    let newUser = PFUser()
    newUser.username = usernameField.text
    newUser.password = passwordField.text
    newUser.signUpInBackground { (success: Bool, error: Error?) in
      if let error = error {
        print(error.localizedDescription)
        AlertView.viewAlert(view: self, title: "User sign up failed", message: "\(error.localizedDescription)")        
      } else {
        print("User Registered Successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
      }
    }
    
  }
  
  @IBAction func loginButton(_ sender: Any) {
    let username = usernameField.text ?? ""
    let password = passwordField.text ?? ""
    PFUser.logInWithUsername(inBackground: username, password: password) {
      (user: PFUser?, error: Error?) in
      if let error = error {
        print("\(error.localizedDescription)")
        switch error._code {
        case 101:
          AlertView.viewAlert(view: self, title: "User log in failed", message: "\(error.localizedDescription)")
        default:
          AlertView.viewAlert(view: self, title: "User log in failed", message: "\(error.localizedDescription)")
        }
      } else {
        print("User logged in successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
      }
    }
  }
  
  @IBOutlet var passwordField: UITextField!
  @IBOutlet var usernameField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

