//
//  AccountController.swift
//  LoginScreen
//
//  Created by Horbach on 6/29/19.
//  Copyright © 2019 Horbach. All rights reserved.
//

import UIKit


class AccountController: UIViewController {
    struct Result : Codable {
        let data : Account
    }
    
    struct Account: Codable {
        let email: String
        let first_name: String
        let last_name: String
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var labelFirstName: UILabel!
    
    @IBOutlet weak var labelLastName: UILabel!
    
    @IBOutlet weak var labelButton: UIButton!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        setupButtonGet()
        fetchImage()
        let urlString = "https://reqres.in/api/users/2"
        guard let url = URL(string: urlString) else { return }
        
        // 2
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                // 3
                //Decode data
                let JSONData = try JSONDecoder().decode(Result.self, from: data)
                
                // 4
                //Get back to the main queue
                DispatchQueue.main.async {
                    self.labelFirstName.text = JSONData.data.first_name
                    self.labelLastName.text = JSONData.data.last_name
                    self.labelEmail.text = JSONData.data.email
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            // 5
            }.resume()
        

        
        }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    

    @IBAction func buttonBack(_ sender: Any) {
        performSegue(withIdentifier: "loginScreen", sender: nil)
        print("Перехід на ауторизацію")
        }
    
    private func setupButtonGet() {
        labelButton.setTitle("Exit", for: .normal)
        labelButton.setTitleColor(.white, for: .normal)
        labelButton.layer.cornerRadius = 5
        labelButton.layer.borderWidth = 1.0
        labelButton.layer.borderColor = (UIColor(red: 169.9/255.0, green: 169.9/255.0, blue: 169.9/255.0, alpha: 1.0)).cgColor
        labelButton.clipsToBounds = true
    }
    
    private func fetchImage() {
        let imageString = "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
        let imageURL = URL(string: imageString)
        var image: UIImage?
        if let url = imageURL {


            DispatchQueue.global(qos: .userInitiated).async {
                let imageData = NSData(contentsOf: url)

                DispatchQueue.main.async {
                    if imageData != nil {
                        image = UIImage(data: imageData! as Data)
                        self.imageView.image = image
                        self.imageView.contentMode = .scaleAspectFill
                        self.imageView.sizeToFit()
                    } else {
                        image = nil
                    }
                }
            }
        }
    }

}


