//
//  main.swift
//  4.字符和字符串
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 Swift和OC字符不一样
 1.Swift是用双引号
 2.Swift中的字符类型和OC也不一样, OC中的字符占一个字节, 因为它自包含ASCII表中的字符, 而Swift中的字符除了可以存储ASCII表中的字符还可以存储unicode字符
 例如中文:
 OC:char charValue = '韩'  //不正确
 Swift: var charValue: Character = "韩" // 正确
 
 Swift Character类型只能放一个字符
 OC的字符是遵守ASCII标准的,Swift的字符是遵守unicode标准的, 所以可以存放实际上所有国家的字符(大部分)
 */
var charValue1:Character = "a"
var charValue2:Character = "韩"

//字符串的长度
var stringValue = "xiaolei"
//print(stringValue.count)
print(stringValue.lengthOfBytes(using: String.Encoding.utf8))

//字符串的拼接
var string1 = "hello "
var string2 = "world"
var string = string1+string2
print(string)

//格式化字符串
var index = 1
var string3 = "http://www.blog26.com/pic/\(index).png"
print(string3)

//字符串比较
var string4 = "abc"
var string5 = "abc"
if string4 == string5 {
    print("相等")
} else {
    print("不相等")
}
var string6 = "abd"
var string7 = "abc"
if string6 >= string7 {
    print("大于等于")
} else {
    print("不大于等于")
}

//判断前后缀
var string8 = "http://www.blog26.com"
if string8.hasPrefix("www") {
    print("包含前缀")
}
if string8.hasSuffix(".com"){
    print("包含后缀")
}

//大小写转换
var string9 = "ABC.txt"
print(string9.uppercased())
print(string9.lowercased())

//转换为基本数据类型
var string10 = "200"
var numberer:Int? = Int(string10)
if numberer != nil{
    print(numberer!)
}

