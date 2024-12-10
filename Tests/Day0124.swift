//
//  Day0124.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 01/12/2024.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0124Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

  func testPart1() throws {
    let challenge = Day0124(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "11")
  }

  func testPart2() throws {
    let challenge = Day0124(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "31")
  }
}
