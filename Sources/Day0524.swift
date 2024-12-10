//
//  Day0524.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 05/12/2024.
//


import Algorithms
import Foundation

@available(iOS 16.0, *)
struct Day0524: AdventDay {
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n\n").map { String($0) }
    }
    
    var rules: [String] {
        entities[0].split(separator: "\n").map { String($0) }
    }
    
    var lines: [String] {
        entities[1].split(separator: "\n").map { String($0) }
    }
    
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var result = 0
        for line in lines {
            var lineIsGood = true
            let intLine = line.split(separator: ",").map { Int($0) ?? 0}
            for rule in rules {
                let ruleTable = rule.split(separator: "|").map { Int($0) ?? 0}
                
                if !ruleCheck1(line: intLine, first: ruleTable[0], second: ruleTable[1]) {
                    lineIsGood = false
                    
                }
            }
            if lineIsGood {
                result += intLine[intLine.count/2]
            }
        }
        
        
        return result
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        
        var result = 0
        
        var intLines :[[Int]] = []
        for line in lines {
            let intLine = line.split(separator: ",").map { Int($0) ?? 0}
            intLines.append(intLine)
        }

        var intRules : [[Int]] = []
        for rule in rules {
            let ruleTable = rule.split(separator: "|").map { Int($0) ?? 0}
            intRules.append(ruleTable)
        }
        var intLines2 : [[Int]] = [[]]
        for line in intLines {
            for rule in intRules {
                if !ruleCheck1(line: line, first: rule[0], second: rule[1]) {
                    intLines2.append(line)
                    break
                }
            }
        }
        intLines2.removeFirst()
        
        for line in intLines2 {
            
            var newLine = line
            var lineIsGood = false
            while !lineIsGood {
                var check = true
                for rule in intRules {
                    if !ruleCheck1(line: newLine, first: rule[0], second: rule[1]) {
                        newLine.removeAll { $0 == rule[1] }
                        newLine.append(rule[1])
                        
                    }
                    
                    for rule in intRules {
                        if ruleCheck1(line: newLine, first: rule[0], second: rule[1]) {
                            
                        } else {
                            check = false
                        }
                    }
                }
                if check {
                    lineIsGood = true
                }
               
            }
            result += newLine[newLine.count/2]
        }
        return result
    }
    
    func isbefore(_ first: Int, before second: Int, in array: [Int]) -> Bool {
        if let firstIndex = array.firstIndex(of: first), let secondIndex = array.firstIndex(of: second) {
            return firstIndex < secondIndex
        }
        return false
    }
    
    func doTheLoop(intLine: [Int], rules: [String]) -> [Int]{
        for rule in rules {
            let ruleTable = rule.split(separator: "|").map { Int($0) ?? 0}
            if ruleCheck1(line: intLine, first: ruleTable[0], second: ruleTable[1]) {
                return intLine
            } else {
                return doTheLoop(intLine: ruleCheck2(line: intLine, first: ruleTable[0], second: ruleTable[1]), rules: rules)
            }
        }
        return intLine
    }
    
    func ruleCheck1(line: [Int], first: Int, second: Int) -> Bool{
        if line.contains(first) && line.contains(second) {
            for number in line {
                if number == first {
                    return true
                }
                if number == second {
                    return false
                }
            }
        }
        return true
    }
    
    func ruleCheck2(line: [Int], first: Int, second: Int) -> [Int]{
        var newLine = line
        if newLine.contains(first) && newLine.contains(second) {
            for number in newLine {
                if number == second {
                    newLine.removeAll(where: { $0 == second})
                    if let index = newLine.firstIndex(of: first) {
                        newLine.insert(second, at: index+1)
                    }
                    return newLine
                }
                if number == first {
                    return newLine
                }
            }
        }
        return newLine
    }
    
}




