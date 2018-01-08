//
//  main.swift
//  12.类的继承
//
//  Created by linkiing on 2018/1/4.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 面向对象的特性：抽象 继承 封装 多态
 继承语法
 继承是面向对象最显著的一个特性, 继承是从已经有的类中派生出新的类
 新的类能够继承已有类的属性和方法, 并能扩展新的能力
 子类可以继承父类的成员属性和方法 可以重写父类的方法并扩展新的属性和方法
 术语: 基类(父类, 超类), 派生类(子类, 继承类)
 语法:
 class 子类: 父类{
 }
 */

/*
super关键字:
派生类(子类)中可以通过super关键字来引用父类的属性和方法
 
利用final关键字防止重写:
1.final关键字既可以修饰属性, 也可以修饰方法, 并且还可以修饰类;
2.被final关键字修饰的属性和方法不能被重写;
3.被final关键字修饰的类不能被继承.
 */

enum Sex{
    case Man,Woman
}

class Person {
    var name:String = "HaRi"
    var age:Int = 20
    //final修饰的成员变量不能重写
    final var sex:Sex = .Man
    func sleep(){
        print("父类睡吧")
    }
    //final修饰的方法子类不能重写
    final func play(){
        print("父类玩吧")
    }
}
class SuperPerson: Person {
    var power:Int = 100
    
    //重写属性
    override var age: Int{
        get{
            return 16
        }
        set{
            print("SuprMan new age \(newValue)")
        }
    }
    
    func eat() -> Void {
        print("吃饭啦")
    }
    func fly() -> Void {
        //子类可以继承父类的成员属性
        print("名字:\(name) 年龄:\(age)")
        eat()
    }
    //override 重写关键词
    override func sleep() {
        //重写父类方法
        print("子类睡吧")
    }
    func doSomething() {
        fly()
        sleep()
        super.sleep();
    }
}
var person = SuperPerson()
person.doSomething()
person.play()










