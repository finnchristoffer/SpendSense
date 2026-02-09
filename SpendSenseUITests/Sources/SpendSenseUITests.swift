//
//  SpendSenseUITests.swift
//  SpendSenseUITests
//

import XCTest

final class SpendSenseUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Teardown code
    }

    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
