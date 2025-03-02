// Copyright 2023–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import XCTest
import OSLog
import Foundation

let logger: Logger = Logger(subsystem: "SkipProto", category: "Tests")

@available(macOS 13, macCatalyst 16, iOS 16, tvOS 16, watchOS 8, *)
final class SkipProtoTests: XCTestCase {
    func testSkipProto() throws {
        logger.log("running testSkipProto")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }
}
