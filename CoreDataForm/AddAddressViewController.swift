//
//  AddAddressViewController.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 08/04/21.
//

import UIKit
import SkyFloatingLabelTextField
class AddAddressViewController: UIViewController {
    var coreDataModel = CoreData()
    var users:User?
    @IBOutlet var state: SkyFloatingLabelTextField!
    @IBOutlet var city: SkyFloatingLabelTextField!
    @IBOutlet var street: SkyFloatingLabelTextField!
    @IBOutlet var country: SkyFloatingLabelTextField!
   
    @IBOutlet var area: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func saveAdddress(_ sender: UIButton) {
        
        let uArea = area.text
        let uStreet = street.text
        let uState = state.text
        let uCity = city.text
        let uContry = country.text
        
        var flage : Bool?
        
        flage = coreDataModel.addUserAddress(users: users!, street: uStreet!, city: uCity!, state: uState!, country: uContry!, area: uArea!)
        
        if(flage!){
            
            let alert = UIAlertController(title: "save", message: "address Save", preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "okey", style: .default) { (action) in
                
                self.street.text = ""
                self.area.text = ""
                    self.country.text = ""
                self.city.text = ""
                self.state.text = ""
            }
            alert.addAction(alerAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
