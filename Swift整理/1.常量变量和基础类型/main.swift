//
//  main.swift
//  1.常量变量和基础类型
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

//输出
print("Hello, World!")
var num:Int = 8
print("变量输出 \(num)")

//使用let来声明常量，使用var来声明变量
var num1: Int
num1 = 10;
var num2:Int = 20
var num3 = 20

//自增自减
num1 += 1
num1 -= 1

//Swift中的常量必须在定义时初始化(OC可以不初始化), 否则会报错
let num4 = 10

//整型
var intValue0:Int = 10
//浮点型
var intValue1:Double = 10.10 // 表示64位浮点数
var intValue2:Float = 8.9    // 表示32位浮点数

//Swift不允许隐式类型转换, 但可以使用显示类型转换(强制类型转换)
var intValue:Int = 10
var doubleValue:Double
doubleValue = Double(intValue)//类型转换
print(intValue)
print(doubleValue)

//BOOL类型(true false)
let isOpen = true
if isOpen {
    print("开启")
} else {
    print("关闭")
}

//for循环
var sum:Int = 0
for i in 1..<10 // 会将区间的值一次赋值给i
{
    sum += i
}
print("总和 \(sum)")

let numberList = [1,2,3,4]
for num in numberList.enumerated(){
    print("正序枚举遍历-->\(num.offset) \(num.element)")
}
for (index, item) in numberList.enumerated().reversed() {
    print("逆序枚举遍历-->\(index) \(item)")
}

//switch语句 可以不写break
var rank = "A"
switch rank{
case "A":  // 相当于if
    print("A")
case "B": // 相当于 else if
    print("B")
case "C": // 相当于 else if
    print("C")
default:  // 相当于 else
    print("其他")
}

