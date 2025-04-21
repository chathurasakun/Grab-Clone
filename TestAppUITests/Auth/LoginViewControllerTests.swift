//
//  LoginViewControllerTests.swift
//  TestApp
//
//  Created by CHATHURA ELLAWALA on 16/01/2025.
//
import XCTest

class LoginViewControllerTests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    @MainActor
    func testInitailDataLodingTableView() throws {
        XCUIApplication().buttons["Login"].tap()
    }
    
}
