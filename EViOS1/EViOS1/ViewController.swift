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
    @IBOutlet var eye: UIImageView!
    @IBOutlet var labelInscription: UILabel!
    @IBOutlet var btnCoulissant: UISwitch!
    @IBOutlet var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        let tapOnView = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
    
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        btnCoulissant.isOn = false
        eye.isUserInteractionEnabled = true
        eye.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if eye.image == UIImage(named: "eye_on_icon"){
            eye.image = UIImage(named: "eye_off")
            passwordField.isSecureTextEntry = true
        } else{
            eye.image = UIImage(named: "eye_on_icon")
            passwordField.isSecureTextEntry = false
        }
    }
    
    
    


}

