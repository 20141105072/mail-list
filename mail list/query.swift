//
//  query.swift
//  mail list
//
//  Created by 20141105072 on 16/7/6.
//  Copyright © 2016年 20141105072. All rights reserved.
//

import Foundation

import UIKit

class query: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var query: UITextField!
    @IBOutlet weak var show2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance
        //如果表还不存在则创建表
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),adress varchar(20),email varchar(20))")
        //如果有数据则加载
        
    }
    
    @IBAction func show1(sender: AnyObject) {
        show()
    }
    func show(){
        let b=query.text!
        let data = db.query("select * from user where uname='\(b)'")
        for var x=0;x<data.count;x++
        {
            let tuser = data[x]
            show2.text! += "姓名:" + String(tuser["uname"]!) + "\n" + "手机号:" + String(tuser["mobile"]!) + "\n" + "地址:" + String(tuser["adress"]!) + "\n" + "邮箱:" + String(tuser["email"]!) + "\n"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

