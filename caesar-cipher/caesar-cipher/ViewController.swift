//
//  ViewController.swift
//  caesar-cipher
//
//  Created by Kevin Bi on 9/14/16.
//  Copyright © 2016 Kevin Bi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var messageOutlet: UILabel!
    @IBOutlet var encryptDecryptControlOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func encryptDecryptControl(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            messageOutlet.text = "Caesar Cipher: Encrypt"
        } else if (sender.selectedSegmentIndex == 1) {
            messageOutlet.text = "Caesar Cipher: Decrypt"
        }
    }
}

