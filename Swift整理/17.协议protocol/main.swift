//
//  main.swift
//  17.协议protocol
//
//  Created by linkiing on 2018/1/8.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/** 协议 **/

protocol SomeProtocol1 {
    //协议方法
}

//协议可以继承一个或多个协议
protocol SomeProtocol2: SomeProtocol1 {
    //协议定义
}

//结构体协议
struct SomeStruct:SomeProtocol1, SomeProtocol2 {
    //结构体定义
}

/*
 协议的属性
 协议不指定是否该属性应该是一个存储属性或者计算属性, 它只指定所需的名称和读写类型. 属性要求总是声明为变量属性, 用var关键字做前缀.
 */
protocol ClassProtocol {
    static var present:Bool{get set} //要求该属性可读可写,并且是静态的
    var subject:String{get}
    var stName:String{get set}
}

//定义类来实现协议
class MyClass: ClassProtocol {
    static var present = false
    var subject: String = "Swift Protocol"
    var stName:String = "Class"
    func attendance() -> String {
        return "The \(self.stName) has secured 99% attendance"
    }
    func markSScured() -> String {
        return "\(self.stName) has \(self.subject)"
    }
}
var myclass = MyClass()
print(myclass.attendance())
print(myclass.markSScured())

//定义协议, 指定方法要求
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinerCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 45.0
    let m = 149998.0
    let a = 24489.0
    let c = 29879.0
    
    func random() -> Double {
        //truncatingRemainder 替代旧方法 %
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
let generator = LinerCongruentialGenerator()
print("随机数:\(generator.random())")    //随机数:0.545993946585954
print("再来随机数:\(generator.random())") //再来随机数:0.0449539327191029

/*
 协议中实现构造函数
 协议SomeProtocol中不仅可以声明方法/属性/下标, 还可以声明构造器, 但在Swift中, 除了某些特殊情况下, 构造器是不被子类继承的, 所以SomeClass中虽然能保证定义了协议要求的构造器, 但不能保证SomeClass的子类中也定义了协议要求的构造器. 所以我们需要在实现协议要求的构造器时, 使用required关键字确保SomeClass的子类也得实现这个构造器.
*/
protocol TcpProtocol {
    //初始化构造器要求
    init(aprot:Int)
}
class TcpClass: TcpProtocol {
    var aprot:Int
    required init(aprot: Int) {
        self.aprot = aprot
    }
}
var tcp = TcpClass(aprot:20)
print(tcp.aprot)

//协议使用例子
protocol Pet {
    func payWith()
    func fed(food:String)
}
class Animal {
    var name:String = ""
    var birthPlace:String = ""
    init(name:String, birthPlace:String) {
        self.name = name
        self.birthPlace = birthPlace
    }
}
class Dog: Animal,Pet {
    func payWith() {
        print("🐶在玩耍")
    }
    func fed(food: String) {
        if food == "骨头" {
            print("🐶Happy")
        }else{
            print("🐶Sad")
        }
    }
}
class Cat: Animal,Pet {
    func payWith() {
        print("🐱在玩耍")
    }
    func fed(food: String) {
        if food == "鱼" {
            print("🐱Happy")
        }else{
            print("🐱Sad")
        }
    }
}

let dog = Dog(name: "狗狗小累累", birthPlace: "河南")
dog.payWith()
dog.fed(food: "骨头")

let cat = Cat(name: "猫猫小可爱", birthPlace: "北京")
cat.payWith()
cat.fed(food: "鱼")

/*
 typealias结合协议使用
 定义一个协议, 代表重量, 但是它的类型要根据继承与它的类或结构体定义
 
 这里定义了两个类，一个是iPhone，一个是Ship，都继承于协议WeightCalculable，但是weight的类型大不相同。iPhone7的weight属性是Double类型的，Ship的weight属性是Int类型的
 */
protocol WeightCalculble {
    associatedtype WeightType
    var weight:WeightType{get}
}
class iPhone: WeightCalculble {
    typealias WeightType = Double
    var weight: WeightType{
        return 0.1314
    }
}
class ship: WeightCalculble {
    typealias WeightType = Int
    let weight: WeightType
    init(weight:Int) {
        self.weight = weight
    }
}

//扩充Int类型 extension-类的扩展
extension Int{
    typealias Weight = Int
    var t:Weight{
        return 1_000 * self
    }
}






















