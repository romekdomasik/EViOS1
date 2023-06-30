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
    
    @IBAction func pressLoginButton(){
        guard let login = loginField.text else{return}
        guard let password = passwordField.text else {return}
        if login.contains("@") && !password.isEmpty && !login.isEmpty && password.count >= 4{
            if btnCoulissant.isOn == true{
                let alert = UIAlertController(title: "Bienvenue \(loginField.text ?? "unknown")", message: "Vous vous êtes inscrits à la newsletter !", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Merci !", style: .default))
                present(alert, animated: true, completion: nil)
                
            } else{
                let alert = UIAlertController(title: "Bienvenue \(loginField.text ?? "unknown")", message: "Vous ne vous êtes pas inscrits à la newsletter !", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Merci !", style: .default))
                present(alert, animated: true, completion: nil)
            }
        } else{
            let alert = UIAlertController(title: "ERROR !", message: "Une condition n'est pas respectée ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
        
            
        
    }

    
    
    


}

