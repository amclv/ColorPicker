//
//  ViewController.swift
//  ColorPicker
//
//  Created by Aaron Cleveland on 1/23/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColor(_ sender: ColorPicker) {
        view.backgroundColor = sender.color
    }
}

