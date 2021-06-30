//
//  UserDataTableViewCell.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 08/04/21.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {

    @IBOutlet var fName: UILabel!
    @IBOutlet var lName: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var number: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userData(uFname:String,uLname:String,uNumber:String,uGender:String,uemail:String){
        
        //var num = Int16(number.text!)
        number.text! = uNumber
        fName.text = uFname
        lName.text = uLname
        gender.text = uGender
        email.text = uemail
        
        
    }
    
}
