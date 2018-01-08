//
//  main.swift
//  2.元祖
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 元组:
 将多个相同或者不同类型的值用一个小括号括起来就是一个元组
 */

let student = ("xiaolei",25,99.8)
print(student)
print(student.0)
print(student.1)
print(student.2)

/*
 元组其实和结构体很像, 只是不需要提前定义类型,元组其实是符合类型, 小括号可以写任意类型
 */
let student1:(String, Int, Double) = ("hello",30,19.9)

/*
 元组的其他定义方式:指明应用元组元素的名称
 */
let student2 = (name:"hi",age:20,core:99.2)
print(student2.name)
print(student2.age)
print(student2.core)

/*
 元组的其他定义方式:
 通过指定的名称提取元组对应的值, 会将对应位置的值赋值给对应位置的名称
 */
let (name,age,score) = ("xiaoming",30,99.9)
print(name)
print(age)
print(score)

/*
 如果不关心元组中的某个值可以利用_通配符来忽略提取
 */
let (name1, age1, _) = ("hello", 30, 99.9)
print(name1)
print(age1)

//元祖嵌套
var t_t:(String,(String,Int)) = ("基本信息",("xiaolei",25))
print(t_t)

//可以将元组的类型重定义为一个类型名
typealias namedFinshesType = (first:String, second:String, third:String)
let namedFinshes : namedFinshesType = ("aaa", "bbb", "ccc")
print(namedFinshes.first)
print(namedFinshes.second)
print(namedFinshes.third)

/** 元组与Array, Dictionary的组合定义**/
var moneyArray:[(Int,String)] = [(20,"Cidy"), (18,"Nickle"), (14, "Quarter")]
print(moneyArray[0])

var userInfoDic:[String:(Int,String)] = ["cidy":(20,"girl"), "nickl":(15,"boy")]
print(userInfoDic)

/** 元组的常见使用场景 **/

// 非常适用于Dictionary遍历
var airports: [String:String] = ["YYZ": "toronto", "DUB": "Dublin"]
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// 非常适合用于Array的enumerated()
var shoppingList = ["Eggs", "Milk"]
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

/*
 遍历元组 (实际跟遍历字典类似)
 */
let tupleArray = [("zhangShang",60,170.0),
                  ("liSi",77,175.0),
                  ("wangWu",80,180.0)]
for t in tupleArray {
    print("name : \(t.0), weight : \(t.1), height : \(t.2)")
}

