//
//  main.swift
//  13.构造方法
//
//  Created by linkiing on 2018/1/5.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 构造方法:
 
 作用: 对实例对象的内容进行初始化
 Swift要求类或者结构体中的存储属性(非lazy在)在对象构造完毕后要有初始化值
 
 语法:
 init(参数列表){ 初始化代码 }
 
 注意: 1.在Swift中类/结构体/枚举都需要构造方法;
 2.构造方法的作用仅仅是用语初始化属性, 而不是分配内容, 分配内存是系统帮我们做的;
 3.构造方法是隐式调用的, 通过 类名称() 形成创建一个对象就会隐式调用 init() 构造方法;
 4.如果所有的存储属性都有默认值, 可以不提供构造方法, 系统会提供一个隐式的构造方法;
 5.如果存储属性可以提供缺省, 那么提倡大家使用设置缺省值的方法, 这样可以简化代码(不用自定义构造方法, 不用写存储属性类型)
 */
class Person{
    var name:String = "hjq"
    var age:Int
    func description() -> String {
        return "name = \(name) age = \(age)"
    }
    //不带参数的构造方法
    init() {
        print("init")
        age = 16
    }
    //带参数的构造方法
    init(age:Int,name:String) {
        self.name = name
        self.age = age
    }
}
var person1 = Person()
var descripString:String = person1.description()
print(descripString)

var person2 = Person.init(age: 20, name: "xiaoli")
print(person2.description())

func getValue() ->Int{
    print("getValue")
    return 55
}
class Person2 {
    var name:String
    
    //系统在初始化的时候会隐式执行闭包, 将闭包的执行结果赋值给存储属性
    //注意: 闭包后面一定要有(), 代表执行闭包
    var age:Int = {
        ()->Int in
        print("age 闭包")
        return 30
    }()
    
    lazy var height:Double = {
        //()->Double in
        print("lazy 闭包")
        return 180.0
    }()
    
    var age2:Int = getValue()
    
    init(name:String) {
        self.name = name
    }
}
var person_2 = Person2(name: "xiaowang")
//懒加载是用到才执行, 而闭包赋值是初始化时就会执行
print()
print(person_2.name)
print(person_2.age)
print(person_2.height)
print(person_2.age2)

//指定构造与便利构造器方法
class Person3{
    var name:String
    var age:Int
    
    //指定构造方法都是以init开头
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    //1.被convenience关键字修饰的构造方法称之为便利构造器, 通过调用其他构造方法来初始化;
    //2.反而言之, 便利构造器中一定是调用其他构造方法初始化的, 一定要出现self.init
    convenience init(){
        //可以在便利构造器中调用指定构造器
        self.init(name: "xiaoli", age: 18)
    }
    
    //类可以拥有多个构造方法
    init(name:String) {
        self.name = name
        self.age = 0
        //不能再指定构造方法中调用便利构造器方法
        //self.init()
    }
}

//派生类的构造方法
class Man {
    var name:String
    //指定构造器
    init(name:String) {
        self.name = name
    }
    //便利构造器
    convenience init(){
        self.init(name: "xiaoli")
    }
}
class superMan: Man {
    var age:Int
    //默认情况下构造方法不会被继承
    init(age:Int){
        self.age = age
        super.init(name: "xiaowang")
    }
    convenience init(){
        self.init(age: 20)
    }
    //将父类的指定构造器重写成一个便利构造器
    convenience override init(name: String) {
        self.init(name: name)
        self.age = 12
    }
}

/*
 必须构造器:
 只要在构造方法的前面加上一个 required 关键字, 那么所有的子类(后续子类)只要定义了构造方法都必须实现该构造方法
 */
class Man2 {
    var name:String
    required init(name:String){
        self.name = name
    }
}
class SuperMan2: Man2 {
    var age:Int
    init() {
        self.age = 25
        super.init(name: "xiaowang")
    }
    required init(name: String) {
        self.age = 12
        super.init(name: "xiaoli")
    }
}
var superman = SuperMan2.init(name: "xiaolei")
print("\(superman.age) \(superman.name)")











