//
//  UserDataViewController.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 07/04/21.
//

import UIKit

class UserDataViewController: UIViewController {
    //var uEmail : String?
    let coreDataModel = CoreData()
    var users : [User]?
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserDataTableViewCell", bundle: .main), forCellReuseIdentifier: "UserDataTableViewCell")
        users = coreDataModel.fetchUser()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

}

extension UserDataViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell", for: indexPath) as! UserDataTableViewCell
        cell.userData(uFname: users![indexPath.row].fName!, uLname: users![indexPath.row].lName!, uNumber: "\(users![indexPath.row].mobileNumber)", uGender: users![indexPath.row].gender!, uemail: users![indexPath.row].email!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let aVc = storyboard?.instantiateViewController(identifier: "AddAddressViewController") as! AddAddressViewController
        aVc.users = users![indexPath.row]
        navigationController?.pushViewController(aVc, animated: true)
    }
}
