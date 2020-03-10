import XCTest

class DashboardUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    func testDashboardLoading() {
        XCTAssertTrue(XCUIApplication().alerts.activityIndicators["In progress"].exists)
        XCTAssertTrue(XCUIApplication().alerts.scrollViews.otherElements.containing(.staticText, identifier:"Credit score loading...").element.exists)
    }
    
    func testDashboardScreen() {
        app.navigationBars["Dashboard"].waitForExistence(timeout: 5)
        XCTAssertTrue(app.navigationBars["Dashboard"].staticTexts["Dashboard"].exists)
        XCTAssertTrue(app.staticTexts["Your credit score is"].exists)
        XCTAssertTrue(app.staticTexts["514"].exists)
        XCTAssertTrue(app.staticTexts["out of 700"].exists)
    }
}
