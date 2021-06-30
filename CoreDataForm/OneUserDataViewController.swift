//
//  OneUserDataViewController.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 08/04/21.
//

import UIKit

class OneUserDataViewController: UIViewController {
    var coreDataModel = CoreData()
    var users : User?
    var uEmail:String?
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "OneUserDataTableViewCell", bundle: .main), forCellReuseIdentifier: "OneUserDataTableViewCell")
         users = coreDataModel.fatchOneUser(email: uEmail!)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    @IBAction func showAllData(_ sender: UIButton) {
        
        let avc  = storyboard?.instantiateViewController(identifier: "UserDataViewController") as! UserDataViewController
        navigationController?.pushViewController(avc, animated: true)
    }
    
}

extension OneUserDataViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneUserDataTableViewCell", for: indexPath) as! OneUserDataTableViewCell
        cell.oneUserData(uFname: users!.fName!, uLname: users!.lName!, uNumber: "\(users!.fName!)", uGender: users!.gender!, uemail: users!.email!)
        return cell
    }
}
