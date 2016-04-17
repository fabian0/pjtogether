//
//  ViewController.swift
//  iOS_PT
//
//  Created by Matthias Scherr on 17.04.16.
//  Copyright (c) 2016 Matthias. All rights reserved.
//

import UIKit

class ViewControllerRegister: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var password: UITextField!


    @IBOutlet weak var test_outlet: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        @IBAction func RegistrierAction(sender: AnyObject) {

       var user = User()

        user.name=username.text
        user.mail=mail.text
        user.password=password.text
        user.postToServerFunction()
        

    }



}

