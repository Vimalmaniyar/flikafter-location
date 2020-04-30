//
//  MyProfileVC.swift
//  AKSwiftSlideMenu
//
//  Created by Sandeep on 4/4/20.
//  Copyright © 2020 Kode. All rights reserved.
//

import UIKit
extension String {
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    var isValidPhone: Bool {
        let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: self)
    }
    var isValidName: Bool{
        let RegEx = "\\w{7,18}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with:self)
    }
   
}
class MyProfileVC:BaseViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var circulerImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circulerImage.layer.cornerRadius = circulerImage.frame.size.width/2
        circulerImage.clipsToBounds = true
       
        // Do any additional setup after loading the view.
    }

    @IBAction func Save(_ sender: UIButton) {
        let nameid = name.text
        print(nameid)
        let emailid = email.text
        print(nameid?.isValidName)
        print(emailid?.isValidEmail)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
