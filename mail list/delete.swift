//
//  delete.swift
//  mail list
//
//  Created by 20141105072 on 16/7/6.
//  Copyright © 2016年 20141105072. All rights reserved.
//

import Foundation
import UIKit

class delete: UIViewController {
    
    @IBOutlet weak var delete1: UITextField!
    var db:SQLiteDB!
        override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance
        //如果表还不存在则创建表
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),adress varchar(20),email varchar(20))")
        //如果有数据则加载
        
    }
    
  
    @IBAction func del(sender: AnyObject){
        del()
    }
    func del(){
        let a=delete1.text!
        let sql="delete from user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

