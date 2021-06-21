//
//  Part3.swift
//  UIElements
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part3: UIViewController {

    private let submit:UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        button.backgroundColor =  UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        button.layer.cornerRadius = 6
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let pagecontrol:UIPageControl = {
        let pagecon = UIPageControl()
        pagecon.numberOfPages = 3
        pagecon.currentPage = 2
        pagecon.backgroundColor = .black
        pagecon.addTarget(self, action: #selector(pagecontrolclick), for: .valueChanged)
        return pagecon
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Upload Profile click on gallry icon"
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let mytoolbar:UIToolbar = {
        let toolBar = UIToolbar()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        //let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera))
        toolBar.items = [cancel, gallery, camera]
        return toolBar
    }()
    
    @objc private func handleCancel() {
        print("cancel")
        self.dismiss(animated: true)
    }
    
    @objc private func handleGallery() {
        print("gallery")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc private func handleCamera() {
        print("camera")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Camera not found.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

    private let mytabBar:UITabBar = {
        let tabBar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabBar.items = [history, downloads]
        return tabBar
    }()
    
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "uplodepic")
        return imageView
    }()
   
    
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        //view.addSubview(pagecontrol)
        view.addSubview(mytoolbar)
        view.addSubview(mytabBar)
        view.addSubview(myImageView)
        view.addSubview(submit)
        view.addSubview(myLabel)
        
       
        
        mytabBar.delegate = self
        imagePicker.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pagecontrol.frame = CGRect(x: 20, y: view.bottom - 50, width: view.width-40, height: 40)
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40
        mytoolbar.frame = CGRect(x: 0, y: 60, width: view.width, height: 40)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49
        mytabBar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        
        myImageView.frame = CGRect(x: 20, y: mytoolbar.bottom+40, width: view.width-40, height: 200
        )
        myLabel.frame = CGRect(x: 20, y: myImageView.bottom+40, width: view.width-40, height: 20
        )
        submit.frame = CGRect(x: 20, y: view.bottom-100, width: view.width-40, height: 40)
    }
    
    
    @objc func pagecontrolclick(){
        print(pagecontrol.currentPage)
        
        if(pagecontrol.currentPage == 0)
        {
            let vc = Part1()
            navigationController?.pushViewController(vc, animated: true)
        }
        if(pagecontrol.currentPage == 1)
        {
            let vc = Part2()
            navigationController?.pushViewController(vc, animated: true)
        }
        if(pagecontrol.currentPage == 2)
        {
            let vc = Part3()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}

extension Part3: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}

extension Part3:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
