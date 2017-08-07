//
//  File.swift
//  MyBooks
//
//  Created by Osman Tekerek on 05/08/2017.
//  Copyright © 2017 Osman Tekerek. All rights reserved.
//

import Foundation

class User
{
    private var name : String = ""
    private var surName : String = ""
    private var email : String = ""
    private var password : String = ""
    
    init(cName : String , cSurName : String , cEmail : String, cPassWord : String)
    {
        setName(name: cName)
        setSurName(surName: cSurName)
        setEMail(email: cEmail)
        setPassword(password: cPassWord)
    }
    init()
    {
        
    }
    
    func setName(name : String)
    {
        if(name != "")
        {
            self.name = name
        }
        else
        {
            print("İsim Boş Geçilemez!!!")
        }
    }
    
    func setSurName(surName : String!)
    {
        if(surName != "")
        {
            self.surName = surName
        }
        else
        {
            print("Soyisim Boş Geçilemez!!!")
        }
    }
    
    func setEMail(email : String)
    {
        if(email != "")
        {
            self.email = email
        }
        else
        {
            print("mail Boş Geçilemez!!!")
        }
    }
    
    func setPassword(password : String)
    {
        if(password != "")
        {
            self.password = password
        }
        else
        {
            print("Sifre Boş Geçilemez!!!")
        }
    }
    
    func getName() -> String
    {
        return name
    }
    
    func getSurName() -> String
    {
        return surName
    }
    
    func getEMail() -> String
    {
        return email
    }
    
    func getPassword() -> String
    {
        return password
    }
}
