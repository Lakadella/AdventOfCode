//
//  Day1024.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 10/12/2024.
//


import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day1024Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    89010123
    78121874
    87430965
    96549874
    45678903
    32019012
    01329801
    10456732
    """

  func testPart1() throws {
    let challenge = Day1024(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "36")
  }

  func testPart2() throws {
    let challenge = Day1024(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "81")
  }
}
