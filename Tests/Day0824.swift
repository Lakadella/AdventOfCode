//
//  Day0824.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 08/12/2024.
//



import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0824Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    ............
    ........0...
    .....0......
    .......0....
    ....0.......
    ......A.....
    ............
    ............
    ........A...
    .........A..
    ............
    ............
    
    """

  func testPart1() throws {
    let challenge = Day0824(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "14")
  }

  func testPart2() throws {
    let challenge = Day0824(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "34")
  }
}
