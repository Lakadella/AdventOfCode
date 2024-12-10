//
//  Day0124.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 01/12/2024.
//


import Algorithms

@available(iOS 16.0, *)
struct Day0124: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
      data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      var result = 0
      var count = 0
      var leftList = getListOne(list: entities)
      var rightList = getListTwo(list: entities)
      leftList.sort()
      rightList.sort()
      for line in entities {
          let left = leftList[count]
          let right = rightList[count]
          let diff = left - right
          print(" \(left) \(right) \(diff)")
          result += abs(diff)
          count += 1
      }
      return result
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      var result = 0
      let leftList = getListOne(list: entities)
      let rightList = getListTwo(list: entities)
      for number in leftList {
          var multiplier = 0
          for compareWith in rightList {
              if number == compareWith {
                  multiplier += 1
              }
          }
          result += number * multiplier
      }
      
      return result
      
  }
    
    func getListOne(list: [String]) -> [Int] {
        var table : [Int] = []
        for line in list {
            let splitLine = line.split(separator: " ")
            if let number = Int(splitLine.first ?? "0") {
                table.append(number)
            }
        }
        return table
    }
    
    func getListTwo(list: [String]) -> [Int] {
        var table : [Int] = []
        for line in list {
            let splitLine = line.split(separator: " ")
            if let number = Int(splitLine.last ?? "0") {
                table.append(number)
            }
        }
        return table
    }
}
