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
    @available(iOS 9.0, *)
    public var app: XCUIApplication

    @available(tvOS 10.0, *)
    public var remoteControl: XCUIRemote {
        return XCUIRemote()
    }

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

public extension TestScreen {
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
