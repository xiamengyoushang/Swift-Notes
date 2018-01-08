//
//  main.swift
//  15.内存管理
//
//  Created by linkiing on 2018/1/5.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 Swift内存管理:
 1.管理引用类型的内存, 不会管理值类型, 值类型不需要管理;
 2.内存管理原则: 当没任何强引用指向对象, 系统会自动销毁对象(默认情况下所有的引用都是强引用);
 3.如果做到该原则: ARC 自动回收内存
 */
class Person1 {
    var name:String
    init(name:String) {
        self.name = name
    }
    deinit {
        print("Person1 deinit")
    }
}
var person:Person1? =  Person1(name:"xiaowang")
person = nil

/**强引用**/
class Person2 {
    var name:String
    init(name:String) {
        self.name = name
    }
    deinit {
        print("Person2 deinit")
    }
}
//强引用，引用计数+1
var strongP1 = Person1(name:"hjq")  //1
var strongP2 = strongP1 //2

/*
1.弱引用, 引用计数不变;
2.如果利用weak修饰变量, 当对象释放后会自动将变量设置为nil;
3.所以利用weak修饰的变量必定是一个可选类型, 因为只有可选类型才能设置为nil.
 */
weak var weakP:Person2? = Person2(name:"hjq")
if let p = weakP{
    print(p)
} else {
    print(weakP as Any)
}
















