//
//  ViewController.swift
//  02-day
//
//  Created by Hongbo Yu on 16/3/18.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var data = ["30 Days Swift", "习近平：共产主义决不是土豆烧牛肉那么简单，不可能唾手可得", "党的十八大以来，针对社会上存在的“共产主义虚无缥缈，遥遥无期”的论调，习近平总书记鲜明地指出", "共产主义决不是“土豆烧牛肉”那么简单，不可能唾手可得、一蹴而就，但我们不能因为实现共产主义理想是一个漫长的过程，就认为那是虚无缥缈的海市蜃楼，就不去做一个忠诚的共产党员", "这昭示我们：共产主义是共产党人的精神旗帜，什么时候都不能丢！", "微博 @adolfrank"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    
    var fontIndex = 0
    var fontSize:CGFloat = 16
    
    @IBOutlet weak var smallerFontBtn: UIButton!
    @IBOutlet weak var biggerFontBtn: UIButton!
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBOutlet weak var fontView: UITableView!
    
    @IBOutlet weak var changFontBtn: UIButton!
    
    @IBAction func changFontBtnDidTouch(sender: AnyObject) {
        fontIndex = (fontIndex + 1) % 3
        fontView.reloadData()
    }
    
    
    @IBAction func biggBtnDidTouch(sender: AnyObject) {
        fontSize += 2
        fontView.reloadData()
    }
    
    
    @IBAction func smallerBtnDidTouch(sender: AnyObject) {
        fontSize -= 2
        fontView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontView.dataSource = self
        fontView.delegate = self
        
//        for family in UIFont.familyNames(){
//            for font in UIFont.fontNamesForFamilyName(family){
//                print(font)
//            }
//        }
        
        biggerFontBtn.layer.cornerRadius = 50
        smallerFontBtn.layer.cornerRadius = 50
        changFontBtn.layer.cornerRadius = 50
        fontView.estimatedRowHeight = 60
        fontView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontView.dequeueReusableCellWithIdentifier("fontcell", forIndexPath: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name:self.fontNames[fontIndex], size: CGFloat(fontSize))
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}

