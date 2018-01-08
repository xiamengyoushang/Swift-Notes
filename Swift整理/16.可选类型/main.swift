//
//  main.swift
//  16.可选类型
//
//  Created by linkiing on 2018/1/5.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 可选类型:
 可选类型的本质其实是一个枚举;
 None 没有值
 Some 有值
 格式: Optional<类型> 或者在类型后面加上?号
 由于可选类型在Swift中随处可见, 所有系统做了这个语法糖, 在类型后面加上?
 */

var opa:Optional<Int>
var opb:Int?
print(opb as Any)
if let b = opb {
    print("\(b)不为空")
} else {
    print("为空")
}

/*
 可选链: 通过可选类型的变量来调用相应的属性和方法;
 可选链的返回值是一个可选值
 格式:
 可选值?.属性
 可选值?.方法
 
 强制解包-如果可选类型没有值, 会引发运行时错误
 可选值!.属性
 可选值!.方法
 */
class Person {
    var name:String
    init(name:String) {
        self.name = name
    }
    func whoMan() -> String{
        print("my name is \(self.name)")
        return name
    }
    func show(){
        print("show \(self.name)")
    }
}
var p0:Person?
var p1:Person = Person(name:"hjq")
p1.name = "han"
p1.show()

//可选绑定
if let b = p0{
    b.name = "xiaowang"
    let man = b.whoMan()
    print(man)
}

//可选链
p0 = p1
p0?.name = "hi, HaRi"
var namestring:String? = p0?.whoMan()
print(namestring!)
print(p0?.name as Any)
print(p0?.whoMan() as Any)
print(p1.name)

/*
 多层可选链:
 单层: 可选值?.属性
 多层: 可选值?.属性.属性   或者    可选值?.属性.属性?.属性
 */
class A {
    var name:String = "han"
}
class B {
    var a1:A?
}
class C {
    var b1:B?
}
class D {
    var c1:C?
}
var a1 = A()
var b1 = B()
var c1 = C()
var d1 = D()

d1.c1 = c1
d1.c1?.b1?.a1 = a1
print(d1.c1?.b1?.a1?.name as Any)









