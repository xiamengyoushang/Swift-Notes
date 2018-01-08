//
//  main.swift
//  18.扩展
//
//  Created by linkiing on 2018/1/8.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 类似category
 扩展: 就是给一个现存类, 结构体, 枚举或者协议添加新的属性挥着方法的语法, 无需目标源码, 就可以吧想要的代码加到目标上面
 但有一些限制条件需要说明:
 1.不能添加一个已经存在的方法或者属性;
 2.添加的属性不能是存储属性, 只能是计算属性;
 格式:
 extension 某个先有类型{
 //增加新的功能
 }
 */
class Transport {
    var scope:String
    init(scope:String) {
        self.scope = scope
    }
}
extension Transport{
    var extProperty:String{
        get{
            return scope
        }
    }
}
var myTrans = Transport(scope:"飞机")
print(myTrans.extProperty)

//扩展构造器
class Transport2 {
    var price = 30
    var scope:String
    init(scope:String) {
        self.scope = scope
    }
}
extension Transport2{
    //便利构造器
    convenience init(price:Int,scope:String){
        self.init(scope: scope)
        self.price = price
    }
}

//扩展Int类方法
extension Int{
    func calculate() -> Int{
        return self*2
    }
}
var i = 3
print(3.calculate())

//扩展下标
extension Int {
    subscript (num: Int) -> Int {
        return self * num
    }
}
var j = 3
print(3[2])





