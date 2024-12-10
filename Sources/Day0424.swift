//
//  Day0424.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 03/12/2024.
//


import Algorithms
import Foundation

@available(iOS 16.0, *)
struct Day0424: AdventDay {
    
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
            let count = countLine(line: line)
            result += count

        }
        
        for letter in 0..<entities[0].count {
            var newLine = ""
            for row in 0..<entities.count {
                newLine += String(entities[row][entities[row].index(entities[row].startIndex, offsetBy: letter)])
                
            }

            result += countLine(line: newLine)
        }
        
        let allDiagonals = getMainDiagonals(from: entities) + getAntiDiagonals(from: entities)
        for diagonal in allDiagonals {
            result += countLine(line: diagonal)
        }
        
        return result
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        
        var result = 0
        
        for vertical in 1..<entities.count-1 {
            for horizontal in 1..<entities[vertical].count-1 {
                let index = entities[vertical].index(entities[vertical].startIndex, offsetBy: horizontal)
                let letter = entities[vertical][index]
                if letter == "A" {
                    
                    let aboveRightIndex = entities[vertical-1].index(entities[vertical-1].startIndex, offsetBy: horizontal+1)
                    let belowLeftIndex = entities[vertical+1].index(entities[vertical+1].startIndex, offsetBy: horizontal-1)
                    let aboveLeftIndex = entities[vertical-1].index(entities[vertical-1].startIndex, offsetBy: horizontal-1)
                    let belowRightIndex = entities[vertical+1].index(entities[vertical+1].startIndex, offsetBy: horizontal+1)
                    
                    if ((entities[vertical-1][aboveRightIndex] == "M" && entities[vertical+1][belowLeftIndex] == "S") ||
                        (entities[vertical+1][belowLeftIndex] == "M" && entities[vertical-1][aboveRightIndex] == "S")) &&
                       ((entities[vertical-1][aboveLeftIndex] == "M" && entities[vertical+1][belowRightIndex] == "S") ||
                        (entities[vertical+1][belowRightIndex] == "M" && entities[vertical-1][aboveLeftIndex] == "S")) {
                        result += 1
                    }
                }
            }
        
        }

        return result
        
    }
    
    func countOccurrences(of substring: String, in text: String) -> Int {
        var count = 0
        var searchRange: Range<String.Index>?
        
        while let range = text.range(of: substring, options: [], range: searchRange) {
            count += 1
            searchRange = range.upperBound..<text.endIndex
        }
        
        return count
    }
    
    func countLine(line: String) -> Int {
        var count = 0
        count += countOccurrences(of: "XMAS", in: line)
        count += countOccurrences(of: "SAMX", in: line)
        return count
    }
    
    func getMainDiagonals(from array: [String]) -> [String] {
        var diagonals: [String] = []
        let rowCount = array.count
        let colCount = array[0].count
        
        for col in 0..<colCount {
            var diagonal = ""
            var row = 0
            var currentCol = col
            while row < rowCount && currentCol < colCount {
                let charIndex = array[row].index(array[row].startIndex, offsetBy: currentCol)
                diagonal += String(array[row][charIndex])
                row += 1
                currentCol += 1
            }
            diagonals.append(diagonal)
        }
        
        for row in 1..<rowCount {
            var diagonal = ""
            var currentRow = row
            var col = 0
            while currentRow < rowCount && col < colCount {
                let charIndex = array[currentRow].index(array[currentRow].startIndex, offsetBy: col)
                diagonal += String(array[currentRow][charIndex])
                currentRow += 1
                col += 1
            }
            diagonals.append(diagonal)
        }
        
        return diagonals
    }
    
    func getAntiDiagonals(from array: [String]) -> [String] {
        var diagonals : [String] = []
        let rowCount = array.count
        let colCount = array[0].count
        
        for col in (0..<colCount).reversed() {
            var diagonal = ""
            var row = 0
            var currentCol = col
            while row < rowCount && currentCol >= 0 {
                let charIndex = array[row].index(array[row].startIndex, offsetBy: currentCol)
                diagonal += String(array[row][charIndex])
                row += 1
                currentCol -= 1
            }
            diagonals.append(diagonal)
        }
        
        for row in 1..<rowCount {
            var diagonal = ""
            var currentRow = row
            var col = colCount - 1
            while currentRow < rowCount && col >= 0 {
                let charIndex = array[currentRow].index(array[currentRow].startIndex, offsetBy: col)
                diagonal += String(array[currentRow][charIndex])
                currentRow += 1
                col -= 1
            }
            diagonals.append(diagonal)
        }
        
        return diagonals
    }
}
