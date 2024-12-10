//
//  Day0324.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 03/12/2024.
//

import Algorithms
import Foundation

@available(iOS 16.0, *)
struct Day0324: AdventDay {
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        
        data.split(separator: "\n").map { String($0) }
        
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var result = 0
        
        let pattern = #"mul\s*\(\d+,\d+\)"#
        
        for line in entities {
            do {
                let regex = try NSRegularExpression(pattern: pattern)
                let matches = regex.matches(in: line, range: NSRange(line.startIndex..., in: line))
                
                for match in matches {
                    if let range = Range(match.range, in: line) {
                        result += findMul(data: "\(line[range])")
                    }
                    
                }
            } catch {
                print("woopsie")
            }
        }
        
        
        return result
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        
        var result = 0
        var justDoIt = true
        for line in entities {
            do {
                let pattern = try NSRegularExpression(pattern: #"mul\s*\(\d+,\d+\)"#)
                let doPattern = try NSRegularExpression(pattern: #"do\(\)"#)
                let dontPattern = try NSRegularExpression(pattern: #"don't\(\)"#)
                
                
                
                let patterns: [NSRegularExpression] = [pattern, doPattern, dontPattern]
                let matches = findMatches(in: line, patterns: patterns)
                
                
                
                for match in matches {
                    if match.contains("do()") {
                        justDoIt = true
                        print("do")
                    }
                    if match.contains("don't()") {
                        justDoIt = false
                    }
                    if match.starts(with: "mul") && justDoIt {
                        print(match)
                        result += findMul(data: match)
                    } else {
                        print("dont")
                    }
                }
                
                
                
            } catch {
                print("woopsie")
            }
        }
        
        return result
        
    }
    
    func findMul(data: String) -> Int {
        let shavedString = String(data.dropFirst(4))
        let shavedString2 = String(shavedString.dropLast(1))
        let splitString = shavedString2.split(separator: ",")
        print(splitString)
        if let a = Int(splitString[0]), let b = Int(splitString[1]) {
            return a * b
            
        }
        return 0
    }
    
    func findMatches(in text: String, patterns: [NSRegularExpression]) -> [String] {
        var matches: [(String, NSRange)] = []
        
        for pattern in patterns {
            let results = pattern.matches(in: text, range: NSRange(text.startIndex..., in: text))
            matches.append(contentsOf: results.map {
                (String(text[Range($0.range, in: text)!]), $0.range)
            })
        }
     
        matches.sort { $0.1.location < $1.1.location }

        return matches.map { $0.0 }
    }
}
