//
//  LogInViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/30/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInSelectorChanged(_ sender: Any) {
        isSignIn = !isSignIn
        if isSignIn{
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text{
        if isSignIn{
            Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                if let u = user{
                    self.performSegue(withIdentifier: "goToDirect", sender: self)
                }else{
                    
                }
            }) } else {
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "goToDirect", sender: self)
                    }else{
                        
                    }
            })
        }
    }
        
        func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
