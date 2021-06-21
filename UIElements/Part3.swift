//
//  Part3.swift
//  UIElements
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part3: UIViewController {

    private let pagecontrol:UIPageControl = {
        let pagecon = UIPageControl()
        pagecon.numberOfPages = 3
        pagecon.currentPage = 2
        pagecon.backgroundColor = .black
        pagecon.addTarget(self, action: #selector(pagecontrolclick), for: .valueChanged)
        return pagecon
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(pagecontrol)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pagecontrol.frame = CGRect(x: 20, y: view.bottom - 50, width: view.width-40, height: 40)
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
            let vc = Part3()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
