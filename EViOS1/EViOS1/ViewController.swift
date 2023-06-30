//
//  ViewController.swift
//  EViOS1
//
//  Created by roman domasik on 30/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
    }


}

