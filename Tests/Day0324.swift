//
//  Day0324.swift
//  AdventOfCode
//
//  Created by Erik Lexander on 03/12/2024.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
@available(iOS 16.0, *)
final class Day0324Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    
    """

  func testPart1() throws {
    let challenge = Day0324(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "161")
  }

  func testPart2() throws {
    let challenge = Day0324(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "48")
  }
}
