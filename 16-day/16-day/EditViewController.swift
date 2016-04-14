//
//  EditViewController.swift
//  16-day
//
//  Created by Hongbo Yu on 16/4/13.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate:class {
    func editVCSaveBtnDidTouch(editVC:EditViewController , data: ContactModel) -> Void
}

class EditViewController: UIViewController {
    weak var delegate: EditViewControllerDelegate?
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var data = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = data.name
        phoneNumberField.text = data.phoneNumber
    }

    
    
    @IBAction func editBtnDidTouch(sender: AnyObject) {
        if (nameField.enabled == true) {
            nameField.enabled = false
            phoneNumberField.enabled = false
            self.view.endEditing(true)
            editBtn.title = "编辑"
            
            nameField.text = data.name
            phoneNumberField.text = data.phoneNumber

        } else {
            nameField.enabled = true
            phoneNumberField.enabled = true
            phoneNumberField.becomeFirstResponder()
            editBtn.title = "取消"
            saveBtn.hidden = false
        }
    }

    
    @IBAction func saveBtnDidTouch(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        data.name = nameField.text!
        data.phoneNumber = phoneNumberField.text!
        self.delegate?.editVCSaveBtnDidTouch(self, data: data)
        
    }

}
