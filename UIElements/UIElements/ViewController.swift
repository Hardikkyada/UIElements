//
//  home.swift
//  UIElements
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let Loginbtn:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginaction), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let Reg:UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(regaction), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        button.layer.cornerRadius = 10
        return button
    }()
    
    @objc func loginaction(){
        let vc = Login()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func regaction(){
        let vc = Part1()
        navigationController?.pushViewController(vc, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "8")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
        
        view.addSubview(Loginbtn)
        view.addSubview(Reg)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Loginbtn.frame = CGRect(x: 20, y: (view.height/2)-30, width: view.width-40, height: 40)
        Reg.frame = CGRect(x: 20, y: Loginbtn.bottom + 20, width: view.width-40, height: 40)
    }
}
