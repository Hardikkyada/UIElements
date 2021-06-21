//
//  ViewController.swift
//  UIElements
//
//  Created by DCS on 16/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let mylabel:UILabel = {
        let lab = UILabel()
        lab.text = "Name"
        //lab.textAlignment = .center
       // lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let mylabel2:UILabel = {
        let lab = UILabel()
        lab.text = "DOB"
        //lab.textAlignment = .center
        // lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let mylabel3:UILabel = {
        let lab = UILabel()
        lab.text = "Gender"
        //lab.textAlignment = .center
        // lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let mylabel4:UILabel = {
        let lab = UILabel()
        lab.text = "Age"
        //lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let mylabel5:UILabel = {
        let lab = UILabel()
        lab.text = "Notification "
        //lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    private let mytextfield:UITextField = {
        let textf = UITextField()
        textf.placeholder = ""
        textf.textAlignment = .center
        textf.borderStyle = .roundedRect
       // textf.backgroundColor = UIColor.gray
        return textf
    }()
    
    private let mytextview:UITextView = {
        let textv = UITextView()
        textv.text = ""
        textv.textAlignment = .center
        textv.backgroundColor = .gray
        return textv
    }()
    private let mybutton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next Page", for: .normal)
        btn.addTarget(self, action: #selector(nextscreen), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private let datetime:UIDatePicker = {
        let datepic = UIDatePicker()
        datepic.datePickerMode = .dateAndTime
        datepic.timeZone = TimeZone(secondsFromGMT: 0)
        datepic.addTarget(self, action: #selector(datetimeclick), for: .valueChanged)
        return datepic
    }()

    private let pagecontrol:UIPageControl = {
        let pagecon = UIPageControl()
        pagecon.numberOfPages = 3
        pagecon.currentPage = 0
        pagecon.backgroundColor = .black
        pagecon.addTarget(self, action: #selector(pagecontrolclick), for: .valueChanged)
        return pagecon
    }()
    
    private let myseg:UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Male", at: 0, animated: true)
        seg.insertSegment(withTitle: "Female", at: 1, animated: true)
        seg.selectedSegmentIndex = 0
        seg.addTarget(self, action: #selector(segclick), for: .valueChanged)
        return seg
    }()
    
    private let myslider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(sliderclick), for: .valueChanged)
        return slider
    }()
    
    private let mystepper:UIStepper = {
        let step = UIStepper()
        step.minimumValue = 0
        step.maximumValue = 100
        step.addTarget(self, action: #selector(stepperclick), for: .valueChanged)
        return step
    }()
    
    private let myswitch:UISwitch = {
        let swt = UISwitch()
        swt.addTarget(self, action: #selector(switchclick), for: .valueChanged)
        return swt
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(mylabel)
        view.addSubview(mylabel2)
        view.addSubview(mylabel3)
        view.addSubview(mylabel4)
        view.addSubview(mylabel5)
        view.addSubview(mytextfield)
        view.addSubview(mytextview)
        view.addSubview(mybutton)
        view.addSubview(datetime)
        view.addSubview(pagecontrol)
        view.addSubview(myseg)
        view.addSubview(myslider)
        view.addSubview(myswitch)
        view.addSubview(mystepper)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mylabel.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 40)
        mytextfield.frame = CGRect(x: 20, y: mylabel.bottom + 2, width: view.width - 40, height: 40)
        mylabel2.frame = CGRect(x: 20, y: mytextfield.bottom+20, width: view.width - 40, height: 40)
        datetime.frame = CGRect(x: 20, y: mylabel2.bottom+2, width: view.width-40, height: 40)
        mylabel3.frame = CGRect(x: 20, y: datetime.bottom+20, width: view.width - 40, height: 40)
        myseg.frame = CGRect(x: 20, y: mylabel3.bottom+2, width: view.width-40, height: 40)
        mylabel4.frame = CGRect(x: 20, y: myseg.bottom+30, width: 40, height: 40)
        mystepper.frame = CGRect(x: mylabel4.right + 20, y: myseg.bottom+32, width: 30, height: 40)
        mytextview.frame = CGRect(x: mystepper.right + 20, y: myseg.bottom+30, width: view.width-220, height: 40)
        //myslider.frame = CGRect(x: 20, y: mytextview.bottom+20, width: view.width-40, height: 40)
        mylabel5.frame = CGRect(x: 20, y: mystepper.bottom+30, width: 100, height: 40)
        myswitch.frame = CGRect(x: mylabel5.right+20, y: mystepper.bottom+30, width: view.width-80, height: 40)
        mybutton.frame = CGRect(x: 20, y: myswitch.bottom+50, width: view.width-40, height: 40)
        pagecontrol.frame = CGRect(x: 20, y: view.bottom - 50, width: view.width-40, height: 40)
    }
    @objc func nextscreen(){
        print("Click///..")
        
        let vc = Part2()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func datetimeclick(){
        print(datetime.date)
        
    }
    @objc func pagecontrolclick(){
        print(pagecontrol.currentPage)
        
        if(pagecontrol.currentPage == 0)
        {
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        if(pagecontrol.currentPage == 1)
        {
            let vc = Part2()
            navigationController?.pushViewController(vc, animated: true)
        }
        if(pagecontrol.currentPage == 2)
        {
            //let vc = Part3()
            //navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @objc func segclick(){
        print(myseg.selectedSegmentIndex)
        
    }
    @objc func sliderclick(){
        mytextview.text=String(myslider.value)
    }
    @objc func stepperclick(){
        mytextview.text=String(Int(mystepper.value))
    }
    @objc func switchclick(){
        print("Notification is "+String(myswitch.isOn))
    }

}

