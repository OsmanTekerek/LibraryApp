//
//  ViewController.swift
//  MyBooks
//
//  Created by Osman Tekerek on 05/08/2017.
//  Copyright © 2017 Osman Tekerek. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
   
    var user = [User]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func login(_ sender: UIButton)
    {
        //tablodan Cek
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users2")
        
        request.returnsObjectsAsFaults = false
        
        if (email.text != "" && password.text != "")
        {
            do
            {
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        var mail : String = ""
                        var name : String = ""
                        var surname : String = ""
                        var password : String = ""
                        
                        if(result.value(forKey: "email2") != nil
                            && result.value(forKey: "name2") != nil
                            && result.value(forKey: "surname2") != nil
                            && result.value(forKey: "password2") != nil)
                        {
                            
                            mail = result.value(forKey: "email2") as! String
                            name = result.value(forKey: "name2") as! String
                            surname = result.value(forKey: "surname2") as! String
                            password = result.value(forKey: "password2") as! String
                            
                            let lUser = User(cName: name ,cSurName: surname,
                                             cEmail: mail,cPassWord: password)
                            
                            user.append(lUser)
                        }
                    }
                }
            }
            catch
            {
                print(error)
            }
            
            var giris : Bool = true
            
            for loopUser in user
            {
                let loopMail = loopUser.getEMail()
                let loopPass = loopUser.getPassword()
                
                if(loopMail == email.text && loopPass == password.text)
                {
                    messageBox(message: "HoşGeldiniz:\(loopUser.getSurName())")
                    break
                }
                giris = false
            }
            
            if (giris == false)
            {
                messageBox(message: "Lutfen Bilgilerinizi Doğru Giriniz")
            }
        }
        else
        {
            messageBox(message:"Boş Alan Bırakmayınız")
        }
    }
        
    
    func messageBox(message : String)
    {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

