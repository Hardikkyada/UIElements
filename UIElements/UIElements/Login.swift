//
//  home.swift
//  UIElements
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Login: UIViewController {
    
    private let id:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter ID"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.gray
        textField.textColor = UIColor.white
        return textField
    }()
    
    private let pass:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.gray
        textField.textColor = UIColor.white
        return textField
    }()
    
    private let Login:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(Login)
        view.addSubview(pass)
        view.addSubview(id)
        
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "4")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        id.frame = CGRect(x: 20, y: (view.height/2)-30, width: view.width-40, height: 40)
        pass.frame = CGRect(x: 20, y: id.bottom + 20, width: view.width-40, height: 40)
        Login.frame = CGRect(x: 20, y: pass.bottom + 40, width: view.width-40, height: 40)
    }
}
