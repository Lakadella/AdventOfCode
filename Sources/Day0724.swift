
//
//  Day0124.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 01/12/2024.
//


import Algorithms

@available(iOS 16.0, *)
struct Day0724: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
      data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      var result = 0
      
      for line in entities {
          let splitline = line.split(separator: ":")
          if let target = Int(splitline[0]) {
              let numbers = splitline[1].split(separator: " ").map { Int($0) ?? 0 }
              let combinations = generateCombinations(numbers)
              if evaluateCombinations(combinations, target: target){
                  result += target
                 
              }
          }
      }

      return result
  }
    func generateCombinations(_ numbers: [Int]) -> [[Int]] {
        guard !numbers.isEmpty else { return [[]] }
        
        let head = numbers[0]
        let tail = Array(numbers.dropFirst())
        
        let withoutHead = generateCombinations(tail)
        let withHead = withoutHead.map { [head] + $0 }
        
        return withHead + withoutHead
    }

    func evaluateCombinations(_ combinations: [[Int]], target: Int) -> Bool {
        for combination in combinations {
            guard !combination.isEmpty else { continue }
            
            if evaluateCombination(combination, target: target, currentResult: combination[0], index: 1) {
                return true
            }
        }
        
        return false
    }

    func evaluateCombination(_ combination: [Int], target: Int, currentResult: Int, index: Int) -> Bool {
        if index == combination.count {
            return currentResult == target
        }
        
        let nextNumber = combination[index]
        
        // Try addition
        if evaluateCombination(combination, target: target, currentResult: currentResult + nextNumber, index: index + 1) {
            return true
        }
        
        // Try multiplication
        if evaluateCombination(combination, target: target, currentResult: currentResult * nextNumber, index: index + 1) {
            return true
        }
        
        // Try concatenation
        let concatenatedNumber = Int("\(currentResult)\(nextNumber)") ?? 0
        if evaluateCombination(combination, target: target, currentResult: concatenatedNumber, index: index + 1) {
            return true
        }
        
        return false
    }
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      var result = 0
      
      for line in entities {
          let splitline = line.split(separator: ":")
          if let target = Int(splitline[0]) {
              let numbers = splitline[1].split(separator: " ").map { Int($0) ?? 0 }
              
              
              if calculate(target: target, values: numbers, sum: 0, index: 0) {
                  result += target
                  print(target)
                  
              }
          }
          
      }
      
      return result
  }

    
    func calculate(target: Int, values: [Int], sum: Int, index: Int) -> Bool {
        if sum > target {
            return false
        }
        if index < values.count {
            return calculate(target: target, values: values, sum: sum * values[index], index: index + 1) ||
                   calculate(target: target, values: values, sum: sum + values[index], index: index + 1) ||
                   calculate(target: target, values: values, sum: Int("\(sum)\(values[index])")!, index: index + 1)
        } else {
            return index == values.count && sum == target
        }
    }
    
    func checkNumbers(_ numbers: [Int], target: Int) -> Bool {
        for number in numbers {
            if number == target {
               return true
            }
            var current = number
            if current != target {
                current += number
            }
        }
        
        for number in numbers {
            if number == target {
                return true
            }
            var current = number
            if current != target {
                current *= number
            }
        }
        
        return false
    }
    
    func combinations<T>(_ array: [T]) -> [[T]] {
        guard !array.isEmpty else { return [[]] }
        
        let head = array[0]
        let tail = Array(array.dropFirst())
        
        let withoutHead = combinations(tail)
        let withHead = withoutHead.map { [head] + $0 }
        
        return withHead + withoutHead
    }
  
}
