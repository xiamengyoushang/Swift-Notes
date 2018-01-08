//
//  main.swift
//  3.可选值
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 可选值: optionals 有两种状态:
 1.有值 2.没有值, 没有值就是nil
 */

//有值
var optValues1:Int? = 9
//没有值
var optValues2:Int?
var optValues3:Int? = nil

/*
 可选值可以用if语句来进行判断
 */
var optValues4:Int?
if optValues4 != nil {
    print("不为空")
} else {
    print("为空")
}

/*
 提取可选类型的值(强制解析)
 会将optValue中的整型值强制拿出来赋值给result, 换言之就是告诉编译器optValue一定有值, 因为可选类型有两种状态 有值和没有值, 所以告诉编译器到底有没有值
 需要注意的是如果强制解析optValue, 但是optValue中没有值时会引发一个运行时错误
 */
var optValue5:Int? = 10
var result1:Int = optValue5!
print(result1)

/*
 可选绑定:
 为了安全的解析可选类型的值, 一般情况下使用可选绑定
 如果optValue没有值就不会做任何操作, 如果opValue有值会返回并将optValue的值赋值给result执行大括号中的内容
 */
var optValue6:Int? = 11
if let result2 = optValue6 {
    print(result2)
}

