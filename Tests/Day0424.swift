//
//  Day0424.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 03/12/2024.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0424Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
    
    """

  func testPart1() throws {
    let challenge = Day0424(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "18")
  }

  func testPart2() throws {
    let challenge = Day0424(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "9")
  }
}
