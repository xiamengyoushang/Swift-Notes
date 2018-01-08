//
//  main.swift
//  9.枚举和结构体
//
//  Created by linkiing on 2018/1/4.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 Swift枚举:
 格式:
 enum Method{
 case 枚举值
 }
 */

enum Method{
    case Add
    case Sub
    case Mul
    case Div
}
//可以使用枚举类型变量或者常量接收枚举值
var method1:Method = .Add
print(method1)

var method2 = Method.Add
print(method2)

// 利用Switch匹配
// 注意: 如果case中包含了所有的值, 可以不写default; 如果case没有包含枚举中所有的值, 必须写default
switch (method2){
case Method.Add:
    print("加法")
case Method.Sub:
    print("减法")
case Method.Mul:
    print("除法")
case Method.Div:
    print("乘法")
}

//rawValue代表将枚举值转换为原始值
enum Method2:Int{
    case Add = 1,Sub,Mul,Div
}
print(Method2.Div.rawValue)
enum Method3: Double {
    case Add = 5.0, Sub = 6.0, Mul = 7.0, Div = 8.0
}
print(Method3.Add.rawValue)

/*
 hashValue来访问成员值所对应的哈希值，这个哈希值是不能改变的，由编译器自动生成，之后不可改变，Swift在背后实际上使用哈希值来识别枚举符号的（即成员）
 */
enum Method4: String {
    case Add = "add", Sub = "sub", Mul = "mul", Div = "div"
}
print("\(Method4.Add.hashValue) \(Method4.Sub.hashValue) \(Method4.Mul.hashValue) \(Method4.Div.hashValue)")


// 通过原始值创建枚举值
let method4:Method4 = Method4(rawValue:"add")!
print(method4)

func chooseMethod(rawString:String){
    if let ope = Method4(rawValue:rawString) {
        switch (ope) {
            case .Add:
                print("加法")
            case .Sub:
                print("减法")
            case .Mul:
                print("乘法")
            case .Div:
                print("除法")
        }
    }
}
chooseMethod(rawString: "mul")


/*
 结构体:
 结构体是用于封装不同或相同类型的数据的, Swift中的结构体是一类类型, 可以定义属性和方法(甚至构造方法和析构方法等)
 格式:
 struct 结构体名称 {
 结构体属性和方法
 }
 */
struct Rect {
    var width:Double = 6.0
    var height:Double = 2.0
}
var rect1 = Rect()
print("width = \(rect1.width), height = \(rect1.height)")

rect1.width = 99.9
rect1.height = 120.5
print("width = \(rect1.width), height = \(rect1.height)")

//结构体构造器 顺序必须和结构体中成员的顺序一致,必须包含所有成员
var rect2 = Rect(width:20.0,height:33.3)
print("width = \(rect2.width), height = \(rect2.height)")

//结构体中定义成员方法
struct Rect3 {
    var width:Double
    var height:Double = 0.0
    func getWidth() -> Double{
        return width;
    }
    func show() -> Void {
        print("width = \(width) height = \(height)")
    }
}
var rect3 = Rect3(width:5.0,height:9.8)
print(rect3.getWidth())
rect3.show()

struct Person {
    var name : String
    var age : Int
    let card : String
}
var person = Person(name:"HaRi",age:24,card:"12345")
print(person)

/*
 mutating方法
 值类型(结构体和枚举)默认方法是不可以修改属性的, 如果需要修改属性, 需要在方法前加上mutating关键字, 让该方法变为一个改变方法
 */
enum LightSwith {
    case OFF,ON
    //结构体和枚举的默认方法是不可以修改属性的 需要加mutating关键字
    mutating func next(){
        switch self {
        case .OFF:
            self = .ON
        case .ON:
            self = .OFF
        }
    }
}
var lightSwitch:LightSwith = .OFF
print(lightSwitch)
lightSwitch.next()
print(lightSwitch)

struct Person2 {
    var name:String = "hjq"
    var age:Int = 24
    //结构体和枚举的默认方法是不可以修改属性的 需要加mutating关键字
    mutating func setName(name:String,age:Int){
        self.name = name
        self.age = age
    }
    func show(){
        print("name = \(name) age = \(age)")
    }
}
var person2 = Person2()
person2.setName(name:"小王",age:100)
person2.show()













