//
//  main.swift
//  11.下标subscripts
//
//  Created by linkiing on 2018/1/4.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 subscripts(下标): 访问对象中数据的快捷方式
 所谓下标脚本语法就是能够通过, 实例[索引值]来访问实例中的数据
 类似于以前我们访问数字和字典, 其实Swift中的数组和字典就是一个结构体
 
 Array:      subscript (index: Int) -> T
 Dictionary: subscript (key: Key) -> Value?
 arr[0] == arr.subscript(0)
 dict["key"] == dict.subscript("key")
 */

struct Student {
    var name:String = "xiaolei"
    var math:Double = 98.0
    var chinese:Double = 99.0
    var english:Double = 100.0
    
    func getScore(course:String) -> Double {
        switch course {
        case "math" :
            return math
        case "chinese" :
            return chinese
        case "english" :
            return english
        default:
            return math + chinese + english
        }
    }
    
    //1.要想实现下标访问, 必须实现subscript方法;
    //2.要想通过下标访问, 必须实现get方法;
    //3.要想通过下标赋值, 必须实现set方法.
    subscript(course:String) -> Double{
        get{
            switch course {
            case "math":
                return math
            case "chinese":
                return chinese
            case "english":
                return english
            default:
                return math + chinese + english
            }
        }
        set{
            switch course{
            case "math":
                //以为返回的是可选类型
                math = newValue
            case "chinese":
                chinese = newValue
            case "english":
                english = newValue
            default:
                print("not found")
            }
        }
    }
}

var student = Student(name: "xiaolei", math: 99.0, chinese: 98.0, english: 66.0)
print("函数获取: \(student.getScore(course: "")) \(student.getScore(course: "math"))")
//可以下标设置和读取
print("下标读取英文成绩: \(student["english"])")
student["math"] = 80.0
print("下标读取数学成绩: \(student["math"])")



