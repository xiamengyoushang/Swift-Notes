//
//  main.swift
//  5.数组基础
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

//有值数组
var array0 = [1,2,3]
var array1:Array = [1,2,3]
var array2:Array<Int> = [1,2,3]
var array3:[Int] = [1,2,3]

//空数组
var array5 = [Int]()
var array6 = Array<Int>()

//不可变数组
let array7:[Int] = []
//可变数组
let array8:[String] = [String]()

//元素类型
var array9 = [1,"hjq",1.65] as Any
print(array9)
var array10:Array<Any> = [1,"hjq",1.65]
print(array10)

//数组的长度
print("数组的长度 \(array10.count)")

//判断是否为空
print("判断是否为空 \(array10.isEmpty)")

//数组的追加 [1, 2, 3, 4, 5]
var array11 = [1,2,3,4]
array11.append(5)
print(array11)

//数组的插入 [6, 1, 2, 3, 4, 5]
array11.insert(6, at:0)
print(array11)

//数组的删除 [6, 2, 3, 4, 5]
array11.remove(at: 1)
print(array11)

/*
 array11.removeFirst()
 array11.removeLast()
 array11.removeAll()
 */
//移除某区间位置的数组元素 [3, 4, 5]
array11.removeSubrange(0...1)
print(array11)

//数组的替换
var array12 = [1,2,3,4,5]
var range1 = 0...2
//[8, 4, 5]
array12.replaceSubrange(range1, with: [8])
print(array12)

var range2:Range<Int> = Range(0...10)
print(range2)

var range3:Range<Int> = Range(0..<5)
print(range3)

array12.replaceSubrange(0...1, with: [6,7,8])
print(array12)

for i in array12 {
    print(i)
}

