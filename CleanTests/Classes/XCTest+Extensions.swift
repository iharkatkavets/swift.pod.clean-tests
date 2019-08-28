//
//  XCTest+Extensions.swift
//
//
//  Created by Igor Kotkovets on 7/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest

public func assertPairsEqual<T: Equatable>(expected: T, actual: T, message: String = "", file: StaticString = #file, line: UInt = #line) {
    if actual != expected {
        XCTFail("Expected result is \"\(expected)\" but actual is \"\(actual)\" \(message)", file: file, line: line)
    }
}

public func assertPairsEqual<T: Equatable>(expected: T?, actual: T?, message: String = "", file: StaticString = #file, line: UInt = #line) {
    if actual != expected {
        XCTFail("Expected result is \"\(expected)\" but actual is \"\(actual)\" \(message)", file: file, line: line)
    }
}

public func assertTrue(_ actual: Bool, file: StaticString = #file, line: UInt = #line) {
    if actual != true {
        XCTFail("Expected result to be equal to \"true\" but actual is \(actual)", file: file, line: line)
    }
}

public func assertFalse(_ actual: Bool, file: StaticString = #file, line: UInt = #line) {
    if actual != false {
        XCTFail("Expected result to be equal to \"false\" but actual is \(actual)", file: file, line: line)
    }
}

public func assertNil<T>(_ actual: T?, file: StaticString = #file, line: UInt = #line) {
    if actual != nil {
        XCTFail("Expected \"nil\" but actual is \(String(describing: actual))", file: file, line: line)
    }
}

public func assertNotNil<T>(_ actual: T?, file: StaticString = #file, line: UInt = #line) {
    if actual == nil {
        XCTFail("Expected non-nil object but actual is nil", file: file, line: line)
    }
}

public func assertThrowsError<T, U>(expected: T, _ expression: @autoclosure () throws -> U, file: StaticString = #file, line: UInt = #line) where T:Error, T:Equatable {
    do {
        let _ = try expression()
        XCTFail("Expected expression throws error \"\(expected)\" but actual didn't throwed", file: file, line: line)
    } catch let error {
        guard let castedError = error as? T else {
            XCTFail("Expected error of type \"\(T.self)\" but actual is \"\(error.self)\"", file: file, line: line)
            return
        }

        if castedError != expected {
            XCTFail("Expected error \"\(expected)\" but actual is \"\(error)\"", file: file, line: line)
        }
    }
}

public func assertThrowsError<U>(_ expression: @autoclosure () throws -> U, file: StaticString = #file, line: UInt = #line) {
    do {
        let _ = try expression()
        XCTFail("Expected expression throws error but actual didn't throwed", file: file, line: line)
    } catch {
    }
}

public func assertNoThrow<U>(_ expression: () throws -> U, file: StaticString = #file, line: UInt = #line) {
    do {
        let _ = try expression()
    } catch {
        XCTFail("Expected expression doesn't throw error but actual throwed", file: file, line: line)
    }
}
