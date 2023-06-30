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
    @IBOutlet var wheel: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        let tapOnView = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
        
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        btnCoulissant.isOn = false
        eye.isUserInteractionEnabled = true
        eye.addGestureRecognizer(tapGestureRecognizer)
        wheel.alpha = 0
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
        btnCoulissant.alpha = 0
        wheel.alpha = 1
        wheel.startAnimating()
        guard let login = loginField.text else{return}
        guard let password = passwordField.text else {return}
        if !login.contains("@") && password.isEmpty && login.isEmpty && password.count < 4{
            let alert = UIAlertController(title: "ERROR !", message: "Une condition n'est pas respectée ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                self.wheel.alpha = 0
                self.btnCoulissant.alpha = 1
            }))
            present(alert, animated: true, completion: nil)
        }
        makeStuff()
        
        
        func makeStuff(){
            DispatchQueue.global(qos: .default).async{
                sleep(3)
                DispatchQueue.main.async{ [self] in
                    if login.contains("@") && !password.isEmpty && !login.isEmpty && password.count >= 4{
                        if self.btnCoulissant.isOn == true{
                            let alert = UIAlertController(title: "Bienvenue \(loginField.text ?? "unknown")", message: "Vous vous êtes inscrits à la newsletter !", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Merci !", style: .default, handler: {action in
                                self.wheel.alpha = 0
                                self.wheel.stopAnimating()
                                self.btnCoulissant.alpha = 1
                            }))
                            present(alert, animated: true, completion: nil)
                            
                        } else{
                            let alert = UIAlertController(title: "Bienvenue \(loginField.text ?? "unknown")", message: "Vous ne vous êtes pas inscrits à la newsletter !", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Merci !", style: .default, handler: {action in
                                self.wheel.alpha = 0
                                self.btnCoulissant.alpha = 1
                            }))
                            present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }
            
            
            
        }
        
        
        
        
        
        
    }
    
}
