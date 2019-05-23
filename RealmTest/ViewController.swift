//
//  ViewController.swift
//  RealmTest
//
//  Created by 김종현 on 23/05/2019.
//  Copyright © 2019 김종현. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class ViewController: UIViewController {
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let person = Person()
        
        person.name = txtValue.text!
        person.age = Int(txtAge.text!)!
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(person)
        }
        
        txtValue.text = ""
        txtAge.text = ""
    }
    
    @IBAction func btnDeleteAll(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        txtView.text = ""
    }
    
    @IBAction func btnGet(_ sender: Any) {
        txtView.text = ""
        
        let realm = try! Realm()
        let vals = realm.objects(Person.self)
        
        if vals.count == 0 {
            return
        } else {
            for i in vals {
                txtView.text = txtView.text! + "Name: \(i.name), Age: \(i.age)\n"
            }
        }
    }
}

