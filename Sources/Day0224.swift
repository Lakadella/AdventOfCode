//
//  Day0224.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 02/12/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day0224: AdventDay {
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map { String($0) }
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var counter = 0
        for line in entities {
            var safe = true
            let newTable = line.split(separator: " ").map { String($0) }
            var intTable: [Int] = []
            for item in newTable {
                let intItem = Int(item)
                intTable.append(intItem ?? 0)
            }
            for i in 0..<intTable.count-1 {
                if abs(intTable[i] - intTable[i+1]) > 3 {
                    safe = false
                }
            }
            for i in 0..<intTable.count-2 {
                if (intTable[i] > intTable[i+1] && intTable[i+1] > intTable[i+2]) || (intTable[i] < intTable[i+1] && intTable[i+1] < intTable[i+2]){
                    
                } else {
                    safe = false
                }
            }
            if safe {
                counter += 1
            }
            
            
        }
        return counter
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return entities.map { line in
            let newTable = line.split(separator: " ").map { String($0) }
            var intTable: [Int] = []
            for item in newTable {
                let intItem = Int(item)
                intTable.append(intItem ?? 0)
            }
            return intTable
        }.filter { table in
            if isSafe(data: table) {
                return true
            } else {
                for i in 0..<table.count {
                    var copy = table
                    var removedValue = copy.remove(at: i)
                    if isSafe(data: copy){
                        return true
                    }
                }
            }
            return false
        }.count
      
    }
    func isSafe(data: [Int]) -> Bool {
        var safe = true
        var intTable = data
        for i in 0..<intTable.count-1 {
            if abs(intTable[i] - intTable[i+1]) > 3 {
                safe = false
            }
        }
        for i in 0..<intTable.count-2 {
            if (intTable[i] > intTable[i+1] && intTable[i+1] > intTable[i+2]) || (intTable[i] < intTable[i+1] && intTable[i+1] < intTable[i+2]){
                
            } else {
                safe = false
            }
        }
        return safe
    }
}
