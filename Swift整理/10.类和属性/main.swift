//
//  main.swift
//  10.类和属性
//
//  Created by linkiing on 2018/1/4.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 类的基本定义
 类是具有相同属性和方法的抽象
 格式:
 class 类名称 {
 类的属性和方法
 }
 */
class Rect {
    var width:Double = 6.0
    var height:Double = 1.0
    func show() -> Void {
        print("width = \(width) height = \(height)")
    }
}
//类也是对象 实例化
var rect1 = Rect()
rect1.show()

rect1.height = 3.0
rect1.show()

var rect2 = Rect()
/*
 恒等运算符, 用于判断是否是同一个实例, 也就是是否指向同一块存储空间
 有:  === !==  两种类型
 */
if rect1 === rect2 {
   print("实例指向同一块存储空间")
} else {
   print("实例不指向同一块存储空间")
}

/*
 延迟存储属性-懒加载
 Swift语言中所有的存储属性必须有初始值, 也就是当构造完一个对象后, 对象中所有的存储属性必须有初始值, 但是也有例外, 其中延迟存储属性可以将属性的初始化推迟到该属性第一次被调用的时候
 懒加载应用场景:
 1.有可能不会用到
 2.依赖于其它值
 */
class Line {
    var start:Double = 2.0
    var end:Double = 3.0
    lazy var length:Double = getLength()
    
    lazy var container:Array<Any> = {
        print("懒加载2")
        var array:Array<Int> = []
        return array as [Any]
    }()
    
    func getLength() -> Double {
        print("懒加载1")
        return end - start
    }
}
var line = Line()
line.end = 200.0
print(line.length)
var arrayContainer = line.container
arrayContainer.append("1")
arrayContainer.append(6)
print(arrayContainer)

/*
 计算属性
 setter 对象.属性 = 值
 getter var value = 对象.属性
 只读计算属性
 readonly属性, 所谓的只读属性就是只提供了getter方法, 没有提供setter方法
 */
/*
 属性观察器 类似OC中的KVO
 1.willSet, 在设置新值之前调用
 2.didSet, 在设置新值之后调用
 */
class Line2 {
    var start:Double = 1.0{
        willSet{
            print("willSet newValue = \(newValue)")
        }
        didSet{
            print("didSet oldValue = \(oldValue)")
        }
    }
}
var line2 = Line2()
line2.start = 6.0

/*
 类属性 类方法 static
 普通的属性是每个对象各自的一份->不同的对象指向不同的内存 不同对象的属性也不同
 类属性是类的对象共用一份->共用一块内存
 */
class Person {
    //普通属性
    var name:String = "hrq"
    //类属性
    static var age:Int = 0
    //普通方法
    func show(){
        print("name = \(name) age = \(Person.age)")
    }
    //类方法
    static func staticShow(){
        print("age = \(Person.age)")
    }
}
var person1 = Person()
var person2 = Person()
person1.name = "xiaowang"
//person1.age 错误
Person.age = 16
person2.name = "xiaoli"

print()
person1.show()
person2.show()
Person.staticShow()













