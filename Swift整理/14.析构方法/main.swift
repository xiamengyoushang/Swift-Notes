//
//  main.swift
//  14.析构方法
//
//  Created by linkiing on 2018/1/5.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 析构方法:
 对象的内存被回收前被隐式调用的方法, 类似dealloc方法
 主要执行一些额外操作, 例如释放一些持有资源, 关闭文件, 断开网络等
 */
class FileHandle {
    //文件描述符
    var fd:Int32?
    init(path:String) {
        //需要打开的文件路径
        let ret = open(path, O_RDONLY)
        if ret == -1 {
            fd = nil
        } else {
            fd = ret
        }
        print("对象被创建")
    }
    //析构方法
    deinit {
        //关闭文件
        if let ofd = fd {
            close(ofd)
        }
        print("对象被销毁")
    }
}
var fh:FileHandle? = FileHandle(path: "../swift.html")
fh = nil

/*
 析构方法的自动继承
 父类的析构方法会被自动调用, 不需要子类管理
 */
class Person {
    var name:String
    init(name:String) {
        self.name = name
        print("Person init")
    }
    deinit {
        print("Person deinit")
    }
}
class SuperMan: Person {
    var age:Int
    init(age:Int){
        self.age = age
        super.init(name: "xiaolei")
    }
    deinit {
        print("SuperMan deinit")
    }
}
var superman:SuperMan? = SuperMan(age: 16)
superman = nil


