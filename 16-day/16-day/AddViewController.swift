//
//  AddViewController.swift
//  16-day
//
//  Created by Adolfrank on 4/12/16.
//  Copyright © 2016 Frank. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate:class {
    func addViewController(AddVC:AddViewController , Model: ContactModel) -> Void
}


class AddViewController: UIViewController {
    
    weak var delegate: AddViewControllerDelegate?
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var addBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.textChange), name: UITextFieldTextDidChangeNotification, object: nameField)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.textChange), name: UITextFieldTextDidChangeNotification, object: phoneNumberField)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func textChange(){
        if (nameField.text?.characters.count > 0 && phoneNumberField.text?.characters.count > 0) {
            addBtn.enabled = true
            addBtn.backgroundColor = UIColor.blueColor()
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        nameField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func addBtnDidTouch(sender: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
       
        let data = ContactModel()
        data.name = nameField.text!
        data.phoneNumber = phoneNumberField.text!
        
       delegate?.addViewController(self, Model: data)
        
    }

    
    
    
}
