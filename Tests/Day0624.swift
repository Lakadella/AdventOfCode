//
//  Day0624.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 06/12/2024.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0624Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
    
    """

  func testPart1() throws {
    let challenge = Day0624(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "41")
  }

  func testPart2() throws {
    let challenge = Day0624(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "6")
  }
}
