//
//  Day0224.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 02/12/2024.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0224Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

  func testPart1() throws {
    let challenge = Day0224(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "2")
  }

  func testPart2() throws {
    let challenge = Day0224(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "4")
  }
}
