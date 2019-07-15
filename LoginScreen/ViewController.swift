//
//  ViewController.swift
//  LoginScreen
//
//  Created by Horbach on 6/25/19.
//  Copyright © 2019 Horbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK:  TextField
    @IBOutlet weak var textFieldLogin: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    // MARK:  Labels
    @IBOutlet weak var labelWarning: UILabel!
    
    @IBOutlet weak var labelExit: UILabel!
    
    @IBOutlet weak var labelExitSocial: UILabel!
    
    @IBOutlet weak var labelNoAccount: UILabel!
    
    // MARK: Button get outlet
    @IBOutlet weak var outletGet: UIButton!
    
      // MARK: Views
    
    @IBOutlet weak var labelViewTop: UIView!
    
    @IBOutlet weak var labelViewLow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        self.hideKeyboard()
        setupButtonGet()
        labelWarning.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: Buttons
    @IBAction func buttonGet(_ sender: Any) {
         veryficate()
    }
    
    @IBAction func buttonExit(_ sender: Any) {
        print("допомога з входом")
    }
    
    @IBAction func buttonFacebook(_ sender: Any) {
        print("перехід на фейсбук")
        
    }
    @IBAction func buttonTwitter(_ sender: Any) {
        print("перехід на твіттер")
    }
    
    @IBAction func buttonVk(_ sender: Any) {
        print("перехід на вконтакті")
    }
    
    @IBAction func buttonGooglePlus(_ sender: Any) {
        print("перехід на гугл")
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        print("перехід на зареєструватись")
    }
    
    private func setupButtonGet() {
outletGet.setTitle("Ввійти", for: .normal)
outletGet.setTitleColor(.white, for: .normal)
outletGet.layer.cornerRadius = 5    /// радиус закругления
outletGet.layer.borderWidth = 1.0   // толщина обводки
outletGet.layer.borderColor = (UIColor(red: 169.9/255.0, green: 169.9/255.0, blue: 169.9/255.0, alpha: 1.0)).cgColor // цвет обводки
outletGet.clipsToBounds = true  // не забудь это, а то не закруглиться
    }
    
    private func veryficate() {
        
        let login: String
        login = textFieldLogin.text!
        let password : String
        password = textFieldPassword.text!
        
        if (password == "test"  && login == "+380932753153") {
            labelWarning.isHidden = true
            performSegue(withIdentifier: "Account", sender: nil)
            print("перехід на акаунт")
        }else {
        labelWarning.isHidden = false
        labelWarning.text = "Схоже ви не правильно вказали номер телефону або пароль"
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == textFieldPassword {
          outletGet.backgroundColor = .blue
        } else if textField == textFieldLogin {
            
          outletGet.backgroundColor = .blue
            }
        return true
    }
}
// MARK: Hide Keyboard
extension UIViewController {
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
