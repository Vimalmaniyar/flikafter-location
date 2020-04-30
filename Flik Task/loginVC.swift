//
//  loginVC.swift
//  Flik Task
//
//  Created by Sandeep on 4/25/20.
//  Copyright © 2020 vimal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI

//import GoogleSignIn
class loginVC: UIViewController {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        
        if error != nil{
            return
        }
        performSegue(withIdentifier: "login", sender: self)
    }
    
    @IBAction func emailclick(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            return
        }
        authUI?.delegate = self as? FUIAuthDelegate
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // GIDSignIn.sharedInstance()?. = self
     //   GIDSignIn.sharedInstance().signIn()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
