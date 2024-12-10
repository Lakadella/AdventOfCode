//
//  Day1024.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 10/12/2024.
//


import Algorithms

@available(iOS 16.0, *)
struct Day1024: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
      data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var result = 0
        let map = makeMap(entities: entities)
        for line in 0..<map.count {
            for position in 0..<map[line].count {
                if map[line][position] == 0 {
                    let targets = trailhead(map: map, position: Position(x: position, y: line, value: 0))
                    let uniqueTargets = Set(targets)
                    result += uniqueTargets.count
                }
            }
        }
        
        return result
    }


  // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var result = 0
        let map = makeMap(entities: entities)
        for line in 0..<map.count {
            for position in 0..<map[line].count {
                if map[line][position] == 0 {
                    let targets = trailhead(map: map, position: Position(x: position, y: line, value: 0))
                    result += targets.count
                }
            }
        }
        return result
    }
    func trailhead(map: [[Int]], position: Position) -> [Position] {
        var result: [Position] = []
            if position.value == 9 {
                return [position]
            }
    
            if position.y<map.count-1 && map[position.y+1][position.x] == position.value+1  {
                let newPosition = Position(x: position.x, y: position.y+1, value: position.value+1)
                result += (trailhead(map: map, position: newPosition))
            }
            if position.x<map.count-1  && map[position.y][position.x+1] == position.value+1  {
                let newPosition = Position(x: position.x+1, y: position.y, value: position.value+1)
                result += (trailhead(map: map, position: newPosition))
            }
            if position.y > 0 && map[position.y-1][position.x] == position.value+1  {
                let newPosition = Position(x: position.x, y: position.y-1, value: position.value+1)
                result += (trailhead(map: map, position: newPosition))
            }
            if position.x > 0 && map[position.y][position.x-1] == position.value+1  {
                let newPosition = Position(x: position.x-1, y: position.y, value: position.value+1)
                result += trailhead(map: map, position: newPosition)
            }
    
    
    
            return result
        }

    

    
    func makeMap(entities: [String]) -> [[Int]] {
        var result: [[Int]] = []
        for entity in entities {
            let line = makeLineATable(line: entity)
            result.append(line)
        }
        return result
    }

    func makeLineATable(line: String) -> [Int] {
        var result: [Int] = []
        for char in line {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        return result
    }

    
    struct Position: Hashable {
        let x: Int
        let y: Int
        let value: Int
    }

  
}
