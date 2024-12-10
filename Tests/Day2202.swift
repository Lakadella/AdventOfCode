//
//  Day2202.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 17/10/2024.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day2202Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    A Y
    B X
    C Z
    """

  func testPart1() throws {
    let challenge = Day2202(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "15")
  }

  func testPart2() throws {
    let challenge = Day2202(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "45000")
  }
}
