//
//  FirstViewController.swift
//  IconicApp
//
//  Created by Fabrice Mulumba on 11/4/18.
//  Copyright © 2018 Fabrice Mulumba. All rights reserved.
//
// Login through Firebase. Segue to Schedule

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            // ...
            if error == nil {
                
                print("You have successfully logged in")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Menu")
                self.present(vc!, animated: true, completion: nil)
                
            } else {
                
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}

