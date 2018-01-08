//
//  main.swift
//  8.Block闭包
//
//  Created by linkiing on 2018/1/4.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 闭包:
 函数是闭包的一种
 类似于OC语言的block
 闭包表达式(匿名函数) -- 能够捕获上下文中的值
 
 语法: in关键字的目的是便于区分返回值和执行语句
 闭包表达式的类型和函数的类型一样, 是参数加上返回值, 也就是in之前的部分
 {
 (参数) -> 返回值类型 in
 执行语句
 }
 
 一般形式：{
 (parameters) -> returnType in
 statements
 }
 */
let say:(String) -> Void = {
    (name:String) -> Void in
    print("hello \(name)")
}
print("HaRi")

/*
 自动闭包:
 顾名思义，自动闭包是一种自动创建的闭包，封装一堆表达式在自动闭包中，然后将自动闭包作为参数传给函数。而自动闭包是不接受任何参数的，但可以返回自动闭包中表达式产生的值。
 自动闭包让你能够延迟求值，直到调用这个闭包，闭包代码块才会被执行。
 */
var array = ["1","100","hi","hello"]
print(array.count)
let removeBlock = {array.remove(at: 0)}
print(array.count)
print("执行代码块移除 \(removeBlock())")
print(array.count)

/*
 逃逸闭包:
 当一个闭包作为参数传到一个函数中，需要这个闭包在函数返回之后才被执行，我们就称该闭包从函数种逃逸。一般如果闭包在函数体内涉及到异步操作，但函数却是很快就会执行完毕并返回的，闭包必须要逃逸掉，以便异步操作的回调。
 
 逃逸闭包一般用于异步函数的回调，比如网络请求成功的回调和失败的回调。语法：在函数的闭包行参前加关键字“@escaping”。
 */
var comletionHandle:() -> String = {"约吗"}
func doSomthing(some:@escaping() -> String){
    comletionHandle = some
}
doSomthing { () -> String in
    return "约啊"
}
print(comletionHandle())

//闭包捕获值  函数返回(Int) -> Int
func getIncFunc(inc:Int) -> (Int) -> Int{
    var max = 10
    func incFunc(x:Int) -> Int{
        print("incFunc函数结束")
        max += 1
        return max + x
    }
    /*
     执行结束后getIncFunc函数和max都被释放了,但是由于在内部函数中使用到了它, 所以它被捕获了
     */
    print("getIncFunc函数结束")
    return incFunc
}
let incFunc = getIncFunc(inc: 5)
print(incFunc(5))
print(incFunc(5))
let incFunc2 = getIncFunc(inc: 5)
print(incFunc2(5))




