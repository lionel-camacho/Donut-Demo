import XCTest
@testable import Donut

class DashboardViewModelTests: XCTestCase {
    let networkManager = NetworkManager()
    var viewModel: DashboardViewModel!
    
    override func setUp() {
        viewModel = DashboardViewModel(networkManager: networkManager)
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testDashboardScreenTitle() {
        XCTAssertEqual("Dashboard", viewModel.title(), "Dashboard screen title does not match expected value.")
    }
    
    func testCreditScoreTitleText() {
        XCTAssertEqual("Your credit score is", viewModel.creditScoreTitleText(), "Credit score title text does not match expected value")
    }
    
    func testCreditScorePercentageWhenNoValuesSet() {
        XCTAssertEqual(0.0, viewModel.creditScorePercentage(), "Credit score percentage does not match expected value when max and min credit score values have not been set")
    }
    
    func testMaxCreditScoreTextAndCurrentCreditScoreTextWhenNoValuesSet() {
        XCTAssertNil(viewModel.maxCreditScoreText(), "Max credit score text has a value when it was expected to be nil")
        XCTAssertNil(viewModel.currentCreditScoreText(), "Current credit score text has a value when it was expected to be nil")
    }
    
    func testCreditScoreWithValuesSet() {
        viewModel.creditScoreResponse = CreditScore(currentCreditScore: 300, maxCreditScore: 700)
        XCTAssertEqual(0.42857142857142855, viewModel.creditScorePercentage(), "Credit score percentage does not match expected value when max and min credit score values have been set")
        XCTAssertEqual("300", viewModel.currentCreditScoreText(), "Current credit score text does not match expected value when current credit score value has been set")
        XCTAssertEqual("out of 700", viewModel.maxCreditScoreText(), "Max credit score text does not match expected value when max credit score value has been set")
        
    }
    
    
}
