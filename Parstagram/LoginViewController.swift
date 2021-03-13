//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Amy King on 3/10/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextfield.text!
        let password = passwordTextfield.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if(user != nil){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("error: \(error?.localizedDescription)" )
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextfield.text
        user.password = passwordTextfield.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("error: \(error?.localizedDescription)" )
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
