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

    /**
         Start UITest and reset data in keychain
     
             // main.swift
             import Foundation
             import UIKit

             enum AppReset {
               static func resetKeychain() {
                 let secClasses = [
                   kSecClassGenericPassword as String,
                   kSecClassInternetPassword as String,
                   kSecClassCertificate as String,
                   kSecClassKey as String,
                   kSecClassIdentity as String
                 ]
                 for secClass in secClasses {
                   let query = [kSecClass as String: secClass]
                   SecItemDelete(query as CFDictionary)
                 }
               }
             }

             _ = autoreleasepool {

               if ProcessInfo().arguments.contains("--Reset") {
                 AppReset.resetKeychain()
               }

               UIApplicationMain(
                 CommandLine.argc,
                 UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to:
                 UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)),
                 nil,
                 NSStringFromClass(AppDelegate.self)
               )
             }
     */
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
