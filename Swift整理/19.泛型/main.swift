//
//  main.swift
//  19.泛型
//
//  Created by linkiing on 2018/1/9.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 泛型: 之前我们介绍数组和可选型的时候, 我们已接触到泛型, 泛型代码可以确保写出灵活的, 可重用的函数
 */

//虽然系统可以根据参数类型调用不同的参数, 但在定义上这种方法太过冗余. 泛型所带来的好处就是可以通过定义单个函数来实现上面的功能
func show<T>(para:T){
    print("hello \(para)")
}
show(para: "xiaowang")
show(para: 12)

func show1<T>(para1:T,para2:T){
    print("\(para1) \(para2)")
}
show1(para1: 1, para2: 2)
show1(para1: "xiaowang", para2: "xiaoli")

/*
 Element 是节点声明的, 它代表一个泛型, 可以看到这里的泛型名是Element, 相比上面的"T","U","V"长的多. 这是因为此处的 Element不仅仅是一个占位符的作用, 它还声明了这个泛型代表数组中的元素类型, 有具体的意义, 这种 API 的设计指的我们借鉴
 */
//泛型协议 这里的Element不仅仅体现泛型的优势, 还隐性的约束了两个方法的参数必须是相同类型的.
protocol SomeProtocol {
    //定义类型
    associatedtype Element
    //参数  变量:类型
    func elementMethod1(element:Element)
    func elementMethod2(element:Element)
}
struct TestStruct:SomeProtocol {
    typealias Element = String
    func elementMethod1(element: String) {
        print("elementMethod1: \(element)")
    }
    func elementMethod2(element: String) {
        print("elementMethod2: \(element)")
    }
}

//类似于associatedtype的还有 self 关键字, 代表了协议遵守着本身的类型, 适用于比较这类方法, 其必须传入另一个相同类型的参数才有意义
protocol CanCompare {
    func isBigger(other:Self) -> Bool
}
struct BoxInt:CanCompare {
    var intValue:Int
    func isBigger(other: BoxInt) -> Bool {
        return self.intValue > other.intValue
    }
}
print(BoxInt.init(intValue: 3).isBigger(other: BoxInt.init(intValue: 2)))

//泛型对象
struct TestStruct2<T: Comparable> {
    //参数  变量:类型
    func elementMethod3(element:T) {
        print("elementMethod3:\(element)")
    }
    func elemetMethod4(element:T) {
        print("elementMethod4:\(element)")
    }
}
let test = TestStruct2<Int>()
test.elementMethod3(element: 16)//变量:参数

//泛型方法
struct TestStruct3 {
    func elementMethod1< T:Comparable>(element:T) {
        print("===elementMethod3:\(element)")
    }
    func elementMethod2< T:Comparable>(element:T) {
        print("===elementMethod4:\(element)")
    }
}
let test2 = TestStruct3()
test2.elementMethod1(element: 1)
test2.elementMethod2(element: "xiaowang")



















