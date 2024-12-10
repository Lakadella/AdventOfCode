//
//  Day0824.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 08/12/2024.
//



import Algorithms

@available(iOS 16.0, *)
struct Day0824: AdventDay {
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map { String($0) }
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var nodes: [Node] = []
        var result = 0
        var map: [[Character]] = makeMap(entities: entities)
        for line in 0..<map.count {
            for index in 0..<map[0].count {
                if map[index][line] != "." {
                    nodes.append(Node(x: index, y: line, type: map[index][line]))
                }
            }
        }
        print(nodes)
        for node in nodes {
            for secondNode in nodes {
                if node.type == secondNode.type && node != secondNode{
                    let diffX = node.x - secondNode.x
                    let diffY = node.y - secondNode.y
                    
                    let newNode = Node(x: node.x + diffX, y: node.y + diffY, type: "#")
                    
                    
                    
                    if !nodes.contains(newNode) && newNode.x >= 0 && newNode.y >= 0 && newNode.x < map.count && newNode.y < map[0].count{
                        
                        map[newNode.x][newNode.y] = "#"
                        
                        nodes.append(newNode)
                    }
                    let newNode2 = Node(x: node.x - secondNode.x, y: node.y + secondNode.y, type: "#")
                    if !nodes.contains(newNode2) && newNode.x >= 0 && newNode.y >= 0 && newNode.x < map.count && newNode.y < map[0].count{
                        
                        map[newNode.x][newNode.y] = "#"
                        
                        nodes.append(newNode2)
                    }
                    
                }
            }
        }
        for line in map{
            result += line.filter { $0 == "#" }.count
        }
        
        //let result = map.filter { $0 == "#" }.count
        return result
    }
    
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var result = 0
        var nodes: [Node] = []
        var map: [[Character]] = makeMap(entities: entities)
        for line in 0..<map.count {
            for index in 0..<map[0].count {
                if map[index][line] != "." {
                    nodes.append(Node(x: index, y: line, type: map[index][line]))
                }
            }
        }
        for line in map {
            print(line)
        }
        print(nodes)
        for node in nodes {
            for secondNode in nodes {
                if node.type == secondNode.type && node != secondNode {
                    let diffX = node.x - secondNode.x
                    let diffY = node.y - secondNode.y
                    for i in 0...100 {
                        if node.x + diffX*i > map[0].count-1 || node.x + diffX*i < 0  {
                            break
                        }
                        if node.y + diffY*i > map.count-1 || node.y + diffY*i < 0  {
                            break
                        }
                        let newNode = Node(x: node.x + diffX*i, y: node.y + diffY*i, type: "#")
                            map[newNode.x][newNode.y] = "#"
                    }
                }
            }
        }
        
        for line in map {
            print(line)
        }
        
        for line in map{
            result += line.filter { $0 == "#" }.count
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
    
    func makeLineATable(line: String) -> [Character] {
        var result: [Character] = []
        for letter in line {
            result.append(letter)
        }
        return result
    }
    
    struct Node : Hashable{
        var x: Int
        var y: Int
        var type: Character
    }
    
}
