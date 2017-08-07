//
//  KayitOlViewController.swift
//  MyBooks
//
//  Created by Osman Tekerek on 05/08/2017.
//  Copyright © 2017 Osman Tekerek. All rights reserved.
//

import UIKit
import CoreData

class KayitOlViewController: UIViewController
{
    
    @IBOutlet var name: UITextField!
    @IBOutlet var surName: UITextField!
    @IBOutlet var eMail: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBOutlet var rePassword: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
      
    }
    
   
    @IBAction func kayıtOl(_ sender: UIButton)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users2", into: context)
        
        if(name.text != "" && surName.text != "" && eMail.text != "" && passWord.text != "" && rePassword.text != "")
        {
            if(passWord.text == rePassword.text)
            {
                newUser.setValue(eMail.text!, forKey: "email2")
                newUser.setValue(passWord.text!, forKey: "password2")
                newUser.setValue(name.text!, forKey: "name2")
                newUser.setValue(surName.text!, forKey: "surname2")
                
                messageBox(message:"Kayıt Başarılı")
                
                name.text       = ""
                surName.text    = ""
                eMail.text      = ""
                passWord.text   = ""
                rePassword.text = ""
            }
            else
            {
                messageBox(message: "Şifreleri Lutfen Aynı Giriniz")
            }
        }
        else
        {
            messageBox(message: "Boş Alan Bırakmayınız")
        }
        do
        {
            try context.save()
        }
        catch
        {
            print(error)
        }
    }
    
    
    func messageBox(message : String)
    {
        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
