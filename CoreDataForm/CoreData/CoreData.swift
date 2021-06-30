//
//  CoreDat.swift
//  CoreDataForm
//
//  Created by Bharat Kakadiya on 07/04/21.
//

import Foundation
import CoreData
import UIKit

class CoreData {
    
    private static var contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var users : [User]?
    var userAddress : [Address]?
    public func addUser(fname: String, lname: String, email: String, mobile: Int16, password: String, gender: String) -> Bool
   
    {
        do {
            let newUser = User(context: CoreData.contex)
            newUser.fName = fname
            newUser.lName = lname
            newUser.email = email
            newUser.mobileNumber = Int16(mobile)
            newUser.password = password
            newUser.gender = gender
            
            try CoreData.contex.save()
        } catch  {
            
        }
        return true
    }
    
    public func addUserAddress(users:User,street:String,city:String,state:String,country:String,area:String) -> Bool {
        
        do {
            
            let newAddress = Address(context: CoreData.contex)
            
            newAddress.street = street
            newAddress.state = state
            newAddress.area = area
            newAddress.city = city
            newAddress.country = country
            users.addToUserAddress(newAddress)
            
            try CoreData.contex.save()
        } catch  {
            
        }
        return true
    }
    
    public func fetchUser() -> [User] {
        
        users = try! CoreData.contex.fetch(User.fetchRequest())
        
        return users!
    }
    
    public func checkUser(email: String , password: String) -> Bool
    
    {
        let predict = NSPredicate(format: "email =%@", email)
        let fetchReq = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
        
        fetchReq.predicate = predict
        
        let fetchRequest = try! CoreData.contex.fetch(fetchReq)
        
        if fetchRequest.count > 0 {
            
            
            let objectEntity : User = fetchRequest.first as! User
            
            if objectEntity.email == email && objectEntity.password == password
            {
                return true
            }
            else {
                return false
            }
           
        }
        else  {
            return false
        }
    }
    
    func fatchOneUser(email:String) -> User{
        
        var users : User?
        
        let predict = NSPredicate(format: "email=%@", email)
        let fetchReq = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
        fetchReq.predicate = predict
        let fetchRequest = try! CoreData.contex.fetch(fetchReq)
        if fetchRequest.count > 0 {
            
            users = (fetchRequest.first as! User)
            return users!
        }
        users = User()
        return users!
    }
        
}
