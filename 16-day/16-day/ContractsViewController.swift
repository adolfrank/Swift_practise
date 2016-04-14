//
//  ContractsViewController.swift
//  16-day
//
//  Created by Adolfrank on 4/12/16.
//  Copyright © 2016 Frank. All rights reserved.
//

import UIKit

class ContractsViewController: UITableViewController, AddViewControllerDelegate, EditViewControllerDelegate{

    @IBOutlet var contactsTable: UITableView!
    
    lazy var contactData = [ContactModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func logoutBtnDidTouch(sender: AnyObject) {
        let logoutMenu = UIAlertController(title: "注销", message: "是否要注销？", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "确认注销", style: .Destructive) { (alert: UIAlertAction) in
            self.navigationController?.popViewControllerAnimated(true)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel) { (alert: UIAlertAction) in
        }
        logoutMenu.addAction(logoutAction)
        logoutMenu.addAction(cancelAction)
        self.presentViewController(logoutMenu, animated: true, completion: nil)
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toView = segue.destinationViewController
        if toView.isKindOfClass(AddViewController) {
            let addVC:AddViewController = toView as! AddViewController
            addVC.delegate = self
        } else if toView.isKindOfClass(EditViewController) {
            let editVC:EditViewController = toView as! EditViewController
            let path = contactsTable.indexPathForSelectedRow
            editVC.data = contactData[(path?.row)!]
            editVC.delegate = self
        }
    }

    

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = contactsTable.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        let contact: ContactModel = contactData[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        return cell
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .Normal, title: "编辑") { action, index in
//            let editVC = EditViewController()
////            print(self.contactData[indexPath.row].name)
//            editVC.data = self.contactData[indexPath.row]
//            editVC.delegate = self
//            self.navigationController?.pushViewController(editVC, animated: true)
        }
        edit.backgroundColor = UIColor.lightGrayColor()
        
        
        let delete = UITableViewRowAction(style:.Normal , title: "删除") { action, index in
            self.contactData.removeAtIndex(indexPath.row)
            self.contactsTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
        }
        delete.backgroundColor = UIColor.redColor()
        
        return [delete , edit]
    }
    
    
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        // you need to implement this method too or you can't swipe to display the actions
//    }
    
    
    func addViewController(AddVC: AddViewController, Model: ContactModel) {
        contactData.append(Model)
        contactsTable.reloadData()
    }
    
    func editVCSaveBtnDidTouch(editVC: EditViewController, data: ContactModel) {
        contactsTable.reloadData()
    }

}
