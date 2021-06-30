//
//  ViewController.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 07/04/21.
//
import Foundation
import UIKit
import SkyFloatingLabelTextField
class ViewController: UIViewController {
    
    var coreDataModel = CoreData()
    
    @IBOutlet var fName: SkyFloatingLabelTextField!
    @IBOutlet var rgOut: UIButton!
    @IBOutlet var lName: SkyFloatingLabelTextField!
    @IBOutlet var email: SkyFloatingLabelTextField!
    @IBOutlet var password: SkyFloatingLabelTextField!
    @IBOutlet var gender: SkyFloatingLabelTextField!
    @IBOutlet var number: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgOut.layer.cornerRadius = rgOut.frame.height / 2
        rgOut.layer.borderWidth = 1
        rgOut.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }


    @IBAction func register(_ sender: UIButton) {
        
        let ufName = fName.text
        let ulName = lName.text
        let uemail = email.text
        let uNumber = Int16(number.text!)
        let uGender = self.gender.text
        let uPassword = self.password.text
        var addFlage : Bool?
       
        addFlage = coreDataModel.addUser(fname: ufName ?? "", lname: ulName ?? "", email: uemail ?? "", mobile: uNumber ?? 11, password: uPassword ?? "", gender: uGender ?? "")
        if(addFlage!){
            
            let aVc = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
            
            self.navigationController?.pushViewController(aVc, animated: true)
        }
    }
}

