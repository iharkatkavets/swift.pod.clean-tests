//
//  TestScreen.swift
//  Pods
//
//  Created by Igor Kotkovets on 10/15/17.
//

import Foundation
import XCTest

@available(iOS 9.0, *)
open class TestScreen {
    public let app: XCUIApplication

    @available(iOS 9.0, *)
    public init(with app: XCUIApplication) {
        self.app = app
    }

    open func waitForLoaded(timeout: TimeInterval) -> Bool {
        return false
    }

    open func startNewTest() {
        app.launch()
    }
}
