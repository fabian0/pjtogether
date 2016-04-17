//
//  ViewController.swift
//  iOS_PT
//
//  Created by Matthias Scherr on 17.04.16.
//  Copyright (c) 2016 Matthias. All rights reserved.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var mail_login_outlet: UITextField!
    @IBOutlet weak var password_login_outlet: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func Login_action(sender: AnyObject) {

        var u = User()

        u.mail=mail_login_outlet.text
        u.password=password_login_outlet.text

        u.postToServerFunctionLogin()
    }


    



}

