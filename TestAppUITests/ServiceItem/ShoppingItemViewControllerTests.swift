//
//  Untitled.swift
//  TestApp
//
//  Created by CHATHURA ELLAWALA on 14/01/2025.
//
import XCTest

class ShoppingItemViewControllerTests: XCTestCase {
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
    func testTableViewSwipeUpDown() throws {
        let contenttableviewTable = app.tables["contentTableView"]
        contenttableviewTable/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ad Roclet Express @ Mont Kiara")/*[[".cells.containing(.staticText, identifier:\"BEST ORANGE CHICKEN IN TOWN\")",".cells.containing(.staticText, identifier:\"Ad. Agrain - Healthy Low Catlorie Grain Bowls\")",".cells.containing(.staticText, identifier:\"Delicious & Healthy Meals - Now on PROMO\")",".cells.containing(.staticText, identifier:\"Ad Roclet Express @ Mont Kiara\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .staticText).matching(identifier: "BEST ORANGE CHICKEN IN TOWN").element(boundBy: 1).swipeUp()
        contenttableviewTable/*@START_MENU_TOKEN@*/.collectionViews/*[[".cells.collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.containing(.image, identifier:"IMG_5051C50B6F67-1").element.swipeDown()
    }
    
    @MainActor
    func testSwipeOptions() throws {
        app.tables["contentTableView"]/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Only on 23rd, 24th Dec")/*[[".cells.containing(.staticText, identifier:\"Car\")",".cells.containing(.button, identifier:\"heart\")",".cells.containing(.staticText, identifier:\"Save with GrabMart Kombo Jimat\")",".cells.containing(.staticText, identifier:\"~40%\")",".cells.containing(.staticText, identifier:\"Search places\")",".cells.containing(.staticText, identifier:\"Dine out deals\")",".cells.containing(.staticText, identifier:\"Ride to airport\")",".cells.containing(.staticText, identifier:\"GXBank\")",".cells.containing(.staticText, identifier:\"All\")",".cells.containing(.staticText, identifier:\"Food\")",".cells.containing(.staticText, identifier:\"Dine Out\")",".cells.containing(.staticText, identifier:\"Only on 23rd, 24th Dec\")"],[[[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .staticText).matching(identifier: "Dine out deals").element(boundBy: 0).swipeLeft()
    }
    
    @MainActor
    func testSwipeRecentRestaurants() throws {
        
    }
    
}
