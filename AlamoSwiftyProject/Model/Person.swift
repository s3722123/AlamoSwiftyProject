//
//  Person.swift
//  AlamoSwiftyProject
//
//  Created by Lachlan  Wilson on 21/10/19.
//  Copyright © 2019 Lachlan  Wilson. All rights reserved.
//

import Foundation


struct Person
{
    var name: String
    var gender: String
    var email: String
    var age: Int
    var download_link: String

    init(name:String, gender:String, email:String, age:Int, download_link:String)
    {
        self.name = name
        self.gender = gender
        self.email = email
        self.age = age
        self.download_link = download_link
    }
}
