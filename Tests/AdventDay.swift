import XCTest

@testable import AdventOfCode

// One off test to validate that basic data load testing works
@available(iOS 16.0, *)
final class AdventDayTests: XCTestCase {
  func testInitData() throws {
    let challenge = Day0324()
    XCTAssertTrue(challenge.data.starts(with: "4514"))
  }
}
