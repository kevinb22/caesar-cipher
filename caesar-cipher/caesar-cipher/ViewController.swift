//
//  ViewController.swift
//  caesar-cipher
//
//  Created by Kevin Bi on 9/14/16.
//  Copyright © 2016 Kevin Bi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var buttonOutlet: UIButton!
    @IBOutlet var encryptDecryptControlOutlet: UISegmentedControl!
    var cipher = CaesarCipher()
    var message = ""
    
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
            buttonOutlet.setTitle("Encrypt", forState: UIControlState.Normal)
        } else if (sender.selectedSegmentIndex == 1) {
            buttonOutlet.setTitle("Decrypt", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func messageAction(sender: UITextField) {
        self.message = sender.text!
    }

    @IBAction func shiftAction(sender: UITextField) {
        if (sender.text == "") {
            return
        }
        let characterSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyz")
        if let _ = sender.text!.rangeOfCharacterFromSet(characterSet, options: .CaseInsensitiveSearch) {
            return
        }
        let val:Int? = Int(sender.text!)!
        cipher.setShift(val!)
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        if(self.message == "") {
            return;
        }
        
        var res = "";
        if (buttonOutlet.titleLabel!.text == "Encrypt") {
            res = cipher.Encrypt(self.message);
        } else if (buttonOutlet.titleLabel!.text == "Decrypt") {
            res = cipher.Decrypt(self.message);
        }
        res = String(res.characters.dropFirst());
        print(res);
    }
}

