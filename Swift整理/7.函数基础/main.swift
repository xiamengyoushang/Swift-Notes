//
//  main.swift
//  7.函数基础
//
//  Created by linkiing on 2018/1/3.
//  Copyright © 2018年 linkiing. All rights reserved.
//

import Foundation

/*
 函数: 完成某个特定任务的代码块, 给代码起一个合适的名称, 称为函数名称; 以后需要执行代码块只需要利用函数名称调用即可.
 格式:
 func 函数名称(参数名:参数类型, 参数名:参数类型,...) -> 函数返回值 {函数实现部分}
 */
func say1() -> Void{
    print("Hello1")
}
func say2(){
    print("Hello2")
}
say1()
say2()

//有参无返回值
func sayWithName(name:String, age:Int) -> Void{
    print("hello \(name), I'm \(age) years old")
}
sayWithName(name: "xiaolei", age: 16)

func showArray(array:[Int]) -> Void {
    for num in array {
        print("\(num)")
    }
}
showArray(array: [1,2,3,4,5])

//有参有返回值
func info(name:String, age:Int) -> String{
    return "name = \(name), age = \(age)"
}
print(info(name: "HaRi", age: 26))

func add(num1:Int, num2:Int, num3:Int) -> Int
{
    let sum = num1 + num2 + num3
    return sum
}
print(add(num1: 1, num2: 2, num3: 3))

//传递指针参数 inout->指针
func bubbleSort(array:inout [Int]) -> Void {
    for i in 0..<array.count{
        for j in (i+1)..<array.count{
            if array[i] > array[j] {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
}
func printSortArray(array:[Int]){
    for index in array{
        print(index)
    }
}
var sortArray:Array<Int> = [10,23,22,40,5]
bubbleSort(array: &sortArray)
printSortArray(array: sortArray)

//函数类型可以作为函数的参数
func sum(a: Int, b: Int) -> Int{
    return a + b
}
func sub(a: Int, b: Int) -> Int{
    return a - b
}
func calFunc(a:Int,b:Int,Option:(Int,Int)->Int) -> Int{//相当于传入一个函数
    return Option(a,b)
}
print(calFunc(a: 10, b: 20, Option: sum))
print(calFunc(a: 10, b: 20, Option: sub))

// 函数类型可以作为返回值
func max(a: Int, b: Int) -> Int{
    return a > b ? a : b
}
func min(a: Int, b: Int) -> Int{
    return a > b ? b : a
}
func chooseFunc(getMax:Bool) -> (Int, Int) -> Int{//相当于返回一个函数
    return getMax ? max : min
}
var funcP2:(Int, Int) -> Int = chooseFunc(getMax: true)
print(funcP2(10, 20))

