//
//  Day0924.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 09/12/2024.
//



import Algorithms

@available(iOS 16.0, *)
struct Day0924: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
      data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var result = 0
        let inputString = entities[0]
        var input: [Int] = inputString.split(separator: "").map { Int($0) ?? 0 }
        var files: [Int] = []
        var spaces: [Int] = []
        
        for number in 0..<input.count {
            if number % 2 == 0 {
                files.append(input[number])
            } else {
                spaces.append(input[number])
            }
        }
        
        var fileSystem: [Int] = []
        var i = 0
        
        while i < files.count {
            for _ in 0..<files[i] {
                fileSystem.append(i)
            }
            if i < spaces.count && spaces[i] > 0 {
                for _ in 0..<spaces[i] {
                    fileSystem.append(-1)
                }
            }
            i += 1
        }
        
        
        var go = true
        var number = 0
        while go {
            
            if fileSystem.last == -1 {
                fileSystem.removeLast()
            } else if fileSystem[number] == -1 {
                fileSystem[number] = fileSystem.last!
                fileSystem.removeLast()
                number += 1
               
            } else {
                number += 1
            }
            if !fileSystem.contains(-1) {
                go = false
            }
            //print(fileSystem)
            
        }
        
        for number in 0..<fileSystem.count {
            result += fileSystem[number] * number
        }
        
        
        return result
    }


  // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var result = 0
        let inputString = entities[0]
        var input: [Int] = inputString.split(separator: "").map { Int($0) ?? 0 }
        var files: [Int] = []
        var spaces: [Int] = []
        
        for number in 0..<input.count {
            if number % 2 == 0 {
                files.append(input[number])
            } else {
                spaces.append(input[number])
            }
        }
        
        var fileFiles: [File] = []
        var fileSystem: [Int] = []
        
        for file in 0..<files.count {
            let newFile = File(size: files[file], value: file)
            fileFiles.append(newFile)
        }
        
        for file in 0..<fileFiles.count {
            if spaces[file] == 0 {
                spaces.removeFirst()
            }
           
        }
        
        return result
    }

    struct File {
        let size: Int
        let value: Int
    }
  
}
