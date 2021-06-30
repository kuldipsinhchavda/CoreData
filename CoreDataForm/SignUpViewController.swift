//
//  SignUpViewController.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 07/04/21.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController {
    let coreDataModel = CoreData()
    @IBOutlet var signUpOutLate: UIButton!
    @IBOutlet var password: SkyFloatingLabelTextField!
    @IBOutlet var email: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpOutLate.layer.cornerRadius = signUpOutLate.frame.height / 2
        signUpOutLate.layer.borderWidth = 1
        signUpOutLate.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let uEmail = email.text
        let uPassword = password.text
        
        var addFlage : Bool?
        
        addFlage = coreDataModel.checkUser(email: uEmail!, password: uPassword!)
        
        if(addFlage!)
        {
            
            let aVc = storyboard?.instantiateViewController(identifier: "OneUserDataViewController") as! OneUserDataViewController
            aVc.uEmail = uEmail
            navigationController?.pushViewController(aVc, animated: true)
            
        }
        else{
            
            print(Error.self)
        }
        
    }
    
    
}
