//
//  ViewController.swift
//  caesar-cipher
//
//  Created by Kevin Bi on 9/14/16.
//  Copyright © 2016 Kevin Bi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var messageOutlet: UITextField!
    @IBOutlet var outputOutlet: UITextView!
    @IBOutlet var buttonOutlet: UIButton!
    @IBOutlet var encryptDecryptControlOutlet: UISegmentedControl!
    var cipher = CaesarCipher()
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputOutlet.layer.borderWidth = 1.0;
        let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )
        outputOutlet.layer.borderColor = myColor.cgColor;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func encryptDecryptControl(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            buttonOutlet.setTitle("Encrypt", for: UIControlState())
        } else if (sender.selectedSegmentIndex == 1) {
            buttonOutlet.setTitle("Decrypt", for: UIControlState())
        }
        messageOutlet.text = "";
    }
    
    @IBAction func messageAction(_ sender: UITextField) {
        self.message = sender.text!
    }
    
    @IBAction func messageAction2(_ sender: UITextField) {
        self.message = sender.text!
    }

    @IBAction func shiftAction(_ sender: UITextField) {
        if (sender.text == "") {
            return
        }
        let characterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
        if let _ = sender.text!.rangeOfCharacter(from: characterSet, options: .caseInsensitive) {
            return
        }
        let val:Int? = Int(sender.text!)!
        cipher.setShift(val!)
    }
    
    @IBAction func shiftAction2(_ sender: UITextField) {
        if (sender.text == "") {
            return
        }
        let characterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
        if let _ = sender.text!.rangeOfCharacter(from: characterSet, options: .caseInsensitive) {
            return
        }
        let val:Int? = Int(sender.text!)!
        cipher.setShift(val!)
    }

    
    @IBAction func buttonAction(_ sender: UIButton) {
        if(self.message == "") {
            return;
        }
        
        var res = "";
        if (buttonOutlet.titleLabel!.text == "Encrypt") {
            res = cipher.Encrypt(self.message);
        } else if (buttonOutlet.titleLabel!.text == "Decrypt") {
            res = cipher.Decrypt(self.message);
        }
        outputOutlet.text = res;
    }
}

