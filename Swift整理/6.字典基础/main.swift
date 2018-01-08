//
//  main.swift
//  6.字典基础
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

//字典定义: 键值对
var dict1 = ["name":"hjq","age":24] as Any
print(dict1)

var dict2:Dictionary<String,Any> = ["name":"jq","age":18]
print(dict2)

let arrDic:[[String:Any]] = [
    ["name":"hello","age":22],
    ["name":"hi","age":16]
]
print(arrDic)

//字典的增删查改
var dictionary:[String:Any] = ["name":"hjq","age":23]
print(dictionary)
//增加键值对
dictionary["score"] =  100
//对age键的修改
dictionary["age"] = 16
print(dictionary)

//删除键值对
dictionary.removeValue(forKey: "name")
print(dictionary)

//字典遍历
for e in dictionary {
    print("遍历1-->key = \(e.key) value = \(e.value)")
}

for (key,value) in dictionary {
    print("遍历2-->key = \(key) value = \(value)")
}

//获取字典的所有key值
let keysArray = Array(dictionary.keys)
print(keysArray)
let valueArray = Array(dictionary.values)
print(valueArray)

