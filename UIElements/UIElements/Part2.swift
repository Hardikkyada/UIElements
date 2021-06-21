//
//  Part2.swift
//  UIElements
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part2: UIViewController {

    private let myactindi:UIActivityIndicatorView = {
        let mai = UIActivityIndicatorView()
        //mai.style = .large
        mai.color = .blue
        return mai
    }()
    private let mybutton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next",for: .normal)
        btn.addTarget(self, action: #selector(nextscreen), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    /*@objc func activindi(){
        DispatchQueue.main.async {
            self.myactindi.isHidden = !self.myactindi.isHidden
            self.myactindi.isHidden ? self.myactindi.stopAnimating() : self.myactindi.startAnimating()
        }
    }*/
    
    private let myimageview:UIImageView = {
        let imgv = UIImageView()
        imgv.contentMode = .scaleAspectFill
        imgv.clipsToBounds = true
        imgv.image = UIImage(named: "1.jpeg")
        return imgv
    }()
    
    private let pagecontrol:UIPageControl = {
        let pagecon = UIPageControl()
        pagecon.numberOfPages = 3
        pagecon.currentPage = 1
        pagecon.backgroundColor = .black
        pagecon.addTarget(self, action: #selector(pagecontrolclick), for: .valueChanged)
        return pagecon
    }()
    
    private let myprogressview:UIProgressView = {
        let prov = UIProgressView()
        prov.setProgress(0.0, animated: true)
        return prov
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 100.0){
            self.myprogressview.setProgress(1.0, animated: true)
        }
    }
    private let mylabel:UILabel = {
        let lab = UILabel()
        lab.text = "Select Country "
        //lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let mylabel5:UILabel = {
        let lab = UILabel()
        lab.text = "Notification :- "
        //lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let myswitch:UISwitch = {
        let swt = UISwitch()
        swt.addTarget(self, action: #selector(switchclick), for: .valueChanged)
        return swt
    }()
    
    private let myslider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(sliderclick), for: .valueChanged)
        return slider
    }()
    
    private let mypicv=UIPickerView()
    private let pickerdata = ["India","Australia","Bangladesh","Brazil","Canada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        //view.addSubview(myactindi)
        view.addSubview(mybutton)
        //view.addSubview(myimageview)
        view.addSubview(pagecontrol)
        view.addSubview(myprogressview)
        view.addSubview(mypicv)
        view.addSubview(mylabel)
        view.addSubview(mylabel5)
        view.addSubview(myswitch)
        //view.addSubview(myslider)
        
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "2")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
        
        
        mypicv.dataSource = self
        mypicv.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //mybutton.frame = CGRect(x: 20, y: 80, width: view.width-40, height: 40)
        //myimageview.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 20, width: view.width-40, height: 100)
        //myactindi.frame = CGRect(x: 20, y: myimageview.bottom+20, width: view.width-40, height: 40)
        mylabel.frame = CGRect(x: 20, y: additionalSafeAreaInsets.top + 100, width: view.width-20, height: 40)
        mypicv.frame = CGRect(x: 20, y: mylabel.bottom+2, width: view.width - 40, height: 80)
        mylabel5.frame = CGRect(x: 20, y: mypicv.bottom+30, width: 100, height: 40)
        myswitch.frame = CGRect(x: mylabel5.right+30, y: mypicv.bottom+30, width: view.width-80, height: 40)
        
        
        myslider.frame = CGRect(x: 20, y: myswitch.bottom + 20, width: view.width - 40, height: 80)
        myprogressview.frame = CGRect(x: 20, y: view.bottom-60, width: view.width - 40, height: 80)
        
        pagecontrol.frame = CGRect(x: 20, y: view.bottom - 50, width: view.width-40, height: 40)
        mybutton.frame = CGRect(x: 20, y: myslider.bottom+50, width: view.width-40, height: 40)
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
    @objc func nextscreen(){
        print("Click///..")
        
        let vc = Part3()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func switchclick(){
        print("Notification is "+String(myswitch.isOn))
    }
    
    @objc func sliderclick(){
        //mytextview.text=String(myslider.value)
    }
}


extension Part2:UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerdata[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerdata[row])
    }
    
    
}
