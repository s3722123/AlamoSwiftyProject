//
//  ViewController.swift
//  AlamoSwiftyProject
//
//  Created by Lachlan  Wilson on 15/10/19.
//  Copyright © 2019 Lachlan  Wilson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var name_label: UILabel!
    
    @IBOutlet weak var gender_label: UILabel!
    
    @IBOutlet weak var age_label: UILabel!
    
    @IBOutlet weak var email_label: UILabel!
    
    @IBOutlet weak var image_view: UIImageView!
    
    
    var arrRes = [[String:Any]]() //Array of dictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
    }
    
    func updateUI(person:Person) -> Void {
        self.name_label.text = person.name
        self.gender_label.text = person.gender
        self.age_label.text = String(person.age)
        self.email_label.text = person.email
        
        let url = URL(string: person.download_link)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.image_view.image = UIImage(data: data!)
            }
        }
    }
    
    func makeRequest() {
        Alamofire.request("https://randomuser.me/api/?gender=female").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                    
                //Get all the data we need
                let name = swiftyJsonVar["results"][0]["name"]["first"].stringValue
                print("Name: \(name)")
                    
                let gender = swiftyJsonVar["results"][0]["gender"].stringValue
                print("Gender: \(gender)")
                    
                let email = swiftyJsonVar["results"][0]["email"].stringValue
                print("Email: \(email)")
                    
                let age = swiftyJsonVar["results"][0]["dob"]["age"].intValue
                print("Age is: \(age)")
                    
                let image_Download_Link = swiftyJsonVar["results"][0]["picture"]["large"].stringValue
                print ("Download Link: \(image_Download_Link)")
                    
                //Create a Person Object
                let person = Person(name: name, gender: gender, email: email, age: age, download_link: image_Download_Link)
                
                self.updateUI(person: person)
            }
        }
            
    }
    
    @IBAction func button_pressed(_ sender: Any) {
        self.makeRequest()
    }
}





//For image download
/*
 let url = URL(string: image.url)
 
 DispatchQueue.global().async {
 let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
 DispatchQueue.main.async {
 imageView.image = UIImage(data: data!)
 }
 }
 */
