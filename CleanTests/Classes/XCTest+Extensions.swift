//
//  XCTest+Extensions.swift
//
//
//  Created by Igor Kotkovets on 7/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest

func assertPairsEqual<T: Equatable>(expected: T, actual: T, file: StaticString = #file, line: UInt = #line) {
    if actual != expected {
        XCTFail("Expected \(expected) but was \(actual)", file: file, line: line)
    }
}

func assertEqualNil<T>(actual: T?, file: StaticString = #file, line: UInt = #line) {
    if actual != nil {
        XCTFail("Expected nil but was \(String(describing: actual))", file: file, line: line)
    }
}

func assertEqualNotNil<T>(actual: T?, file: StaticString = #file, line: UInt = #line) {
    if actual == nil {
        XCTFail("Expected object but was nil", file: file, line: line)
    }
}

func assertThrowsError<T, U>(expected: T, _ expression: @autoclosure () throws -> U, file: StaticString = #file, line: UInt = #line) where T:Error, T:Equatable {
    do {
        let _ = try expression()
        XCTFail("Expected error \(expected) but expression did not throwed error", file: file, line: line)
    } catch let error {
        guard let castedError = error as? T else {
            XCTFail("Expected error of type \(T.self) but was \(error.self)", file: file, line: line)
            return
        }

        if castedError != expected {
            XCTFail("Expected error \(expected) but was \(error)", file: file, line: line)
        }
    }
}
