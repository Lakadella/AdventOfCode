//
//  Day2202.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 17/10/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day2202: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
      data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      var result = 0
        for battle in entities {
            let t = battle.trimmingCharacters(in: .whitespaces)
            result += battle1(line: t)
      }
      return result
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      return 5
      
  }
    func battle1(line: String) -> Int {
        var result = 0
        let home = line.first
        let away = line.last
        if home == "A" {
            if away == "Y" {
                result += 6
            } else if away == "X" {
                result += 3
            }
        }
        if home == "B" {
            if away == "Z" {
                result += 6
            } else if away == "Y" {
                result += 3
            }
        }
        if home == "C" {
            if away == "X" {
                result += 6
            } else if away == "Z" {
                result += 3
            }
        }
        if away == "X" {
            result += 1
        }
        if away == "Y" {
            result += 2
        }
        if away == "Z" {
            result += 3
        }
        
        return result
    }
}
