//
//  Day01.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 22/11/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day01: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n\n").map {
      $0.split(separator: "\n").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      var max = 0
      for elf in entities {
          let calories = elf.reduce(0, +)
          if calories > max { max = calories }
      }
    return max
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      var table : [Int] = []
      for elf in entities {
          let calories = elf.reduce(0, +)
          table.append(calories)
      }
      table.sort()
      return table[table.count-3] + table[table.count - 1] + table[table.count - 2]
      
  }
}
