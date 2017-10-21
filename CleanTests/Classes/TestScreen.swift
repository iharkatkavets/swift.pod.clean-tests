//
//  TestScreen.swift
//  Pods
//
//  Created by Igor Kotkovets on 10/15/17.
//

import Foundation
import XCTest

@available(iOS 9.0, tvOS 10.0, *)
open class TestScreen {
    public var app: XCUIApplication

    public init(in app: XCUIApplication) {
        self.app = app
    }

    open func waitForExistence(timeout: TimeInterval) -> Bool {
        return false
    }

    open func launchApp() {
        app.launch()
    }

    open func launchWithResetApp() {
        app.launchArguments = ["--Reset"]
        app.launch()
    }
}

#if os(tvOS)
public extension TestScreen {
    public var remoteControl: XCUIRemote {
        return XCUIRemote()
    }

    func remoteSwipeRight(times count: Int = 1) {
        for _ in 0..<count {
            self.remoteControl.press(.right)
        }
    }

    func remoteSwipeDown(times count: Int = 1) {
        for _ in 0..<count {
            self.remoteControl.press(.down)
        }
    }

    func remoteSwipeLeft(times count: Int = 1) {
        for _ in 0..<count {
            self.remoteControl.press(.left)
        }
    }

    func remoteSwipeUp(times count: Int = 1) {
        for _ in 0..<count {
            self.remoteControl.press(.up)
        }
    }

    func remotePressSelect(times count: Int = 1) {
        for _ in 0..<count {
            self.remoteControl.press(.select)
        }
    }

    func remotePressMenu(times count: Int = 1) {
        for _ in 0..<count {
            self.remoteControl.press(.menu)
        }
    }
}
#endif
