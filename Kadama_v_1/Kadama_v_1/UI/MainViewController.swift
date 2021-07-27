//
//  MainViewController.swift
//  Kadama_v_1
//
//  Created by Kapil Dev on 27/07/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rectangle()
    }
    
    func rectangle() {
        let rect = UIView()
        rect.frame = self.view.bounds
        rect.backgroundColor = .clear
        
        rect.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        self.view.addSubview(rect)
        print("rectView")
        
    }
    
    
}
