//
//  Day0924.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 09/12/2024.
//


import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0924Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    2333133121414131402
    """

  func testPart1() throws {
    let challenge = Day0924(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "1928")
  }

  func testPart2() throws {
    let challenge = Day0924(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "2858")
  }
}
