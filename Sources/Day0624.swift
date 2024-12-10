//
//  Day0624.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 06/12/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day0624: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
      data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      var result = 0
      let startRow = findStartRow(entities: entities)
      var map = makeMap(entities: entities)
      let startColumn = findStartColumn(line: map[startRow])
      
      var walking = true
      var direction: Direction = .up
      var currentRow = startRow
      var currentColumn = startColumn
      map[currentRow][currentColumn] = "X"
      
      while(walking) {
          if direction == .up {
              if currentRow == 0 {
                  walking = false
                  break
              }
              if map[currentRow - 1][currentColumn] != "#" {
                  currentRow -= 1
                  map[currentRow][currentColumn] = "X"
                  
              } else {
                  direction = .right
                 
              }
          } else if direction == .right {
              if currentColumn == map[currentRow].count-1 {
                  walking = false
                  break
              }
              if map[currentRow][currentColumn + 1] != "#" {
                  currentColumn += 1
                  map[currentRow][currentColumn] = "X"
              } else {
                  direction = .down
                 
              }
          } else if direction == .down {
              if currentRow == map.count-1 {
                 walking = false
                  break
              }
              if map[currentRow + 1][currentColumn] != "#" {
                  currentRow += 1
                  map[currentRow][currentColumn] = "X"
              } else {
                  direction = .left
                  
              }
          } else if direction == .left {
              if currentColumn == 0 {
                  walking = false
                  break
              }
              if map[currentRow][currentColumn - 1] != "#" {
                  currentColumn -= 1
                  map[currentRow][currentColumn] = "X"
              } else {
                  direction = .up
                  
              }
          }
          print(currentRow, currentColumn, direction)
          
          
          
          if currentRow == -1 || currentRow == map.count || currentColumn == -1 || currentColumn == map[currentRow].count {
              walking = false
          }
          
      }
      
      for row in map {
          print(row)
      }
      for row in map {
          for column in row {
              if column == "X" {
                  result += 1
              }
          }
      }
      return result
      
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      var result = 0

      var map = makeMap(entities: entities)

      for i in 0..<map.count {
          for k in 0..<map[i].count {
              if checkMap(map2: map, x: k, y: i) {
                  result += 1
              }
          }
      }
      return result
      
  }
    
    func checkMap(map2: [[Character]], x: Int, y: Int) ->Bool {
        var map = map2
        if map[y][x] == "^" {
            return false
        }
        map[y][x] = "#"
        
        let startRow = findStartRow(entities: entities)
        let startColumn = findStartColumn(line: map[startRow])
        
        var walking = true
        var direction: Direction = .up
        var currentRow = startRow
        var currentColumn = startColumn
        map[currentRow][currentColumn] = "X"
        
        var mortenIsSoNice = Set<Position>()
        mortenIsSoNice.insert(Position(x: currentRow, y: currentColumn, direction: .up))
        while(walking) {
            if direction == .up {
                if currentRow == 0 {
                    walking = false
                    break
                }
                if map[currentRow - 1][currentColumn] != "#" {
                    currentRow -= 1
                    map[currentRow][currentColumn] = "X"
                    let newPos = Position(x: currentRow, y: currentColumn, direction: direction)
                    if mortenIsSoNice.contains(newPos) {
                        return true
                    }
                    mortenIsSoNice.insert(newPos)
                    
                } else {
                    direction = .right
                    
                }
            } else if direction == .right {
                if currentColumn == map[currentRow].count-1 {
                    walking = false
                    break
                }
                if map[currentRow][currentColumn + 1] != "#" {
                    currentColumn += 1
                    map[currentRow][currentColumn] = "X"
                    let newPos = Position(x: currentRow, y: currentColumn, direction: direction)
                    if mortenIsSoNice.contains(newPos) {
                        return true
                    }
                    mortenIsSoNice.insert(newPos)
                } else {
                    direction = .down
                    
                }
            } else if direction == .down {
                if currentRow == map.count-1 {
                    walking = false
                    break
                }
                if map[currentRow + 1][currentColumn] != "#" {
                    currentRow += 1
                    map[currentRow][currentColumn] = "X"
                    let newPos = Position(x: currentRow, y: currentColumn, direction: direction)
                    if mortenIsSoNice.contains(newPos) {
                        return true
                    }
                    mortenIsSoNice.insert(newPos)
                } else {
                    direction = .left
                    
                }
            } else if direction == .left {
                if currentColumn == 0 {
                    walking = false
                    break
                }
                if map[currentRow][currentColumn - 1] != "#" {
                    currentColumn -= 1
                    map[currentRow][currentColumn] = "X"
                    let newPos = Position(x: currentRow, y: currentColumn, direction: direction)
                    if mortenIsSoNice.contains(newPos) {
                        return true
                    }
                    mortenIsSoNice.insert(newPos)
                } else {
                    direction = .up
                    
                }
            }
        }

        return false
        
    }
    
    struct Position : Hashable{
        var x: Int
        var y: Int
        var direction: Direction
    }
    
    func findStartRow(entities: [String]) -> Int {
        for i in 0..<entities.count {
            if entities[i].contains("^") {
                return i
            }
        }
        return 0
    }
    
    func findStartColumn(line: [Character]) -> Int {
        for i in 0..<line.count {
            if line[i] == "^" {
                return i
            }
        }
        return 0
    }
    
    func makeLineATable(line: String) -> [Character] {
        var result: [Character] = []
        for letter in line {
            result.append(letter)
        }
        return result
    }
    
    func makeMap(entities: [String]) -> [[Character]] {
        var result: [[Character]] = []
        for entity in entities {
            let line = makeLineATable(line: entity)
            result.append(line)
        }
        return result
    }
    
    enum Direction {
        case up
        case down
        case left
        case right
    }
}
