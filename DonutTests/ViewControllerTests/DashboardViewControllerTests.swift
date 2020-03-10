import XCTest
@testable import Donut

class DashboardViewControllerTests: XCTestCase {
    
    var dashboardViewController: DashboardViewController!
    let defaultFont = UIFont.systemFont(ofSize: 20, weight: .regular)
    let customCreditScoreFont = UIFont.systemFont(ofSize: 60, weight: .thin)
    
    override func setUp() {
        dashboardViewController = DashboardViewController()
        dashboardViewController.viewModel.creditScoreResponse = CreditScore(currentCreditScore: 300, maxCreditScore: 700)
    }
    
    override func tearDown() {
        dashboardViewController = nil
    }
    
    func testDashboardCreditScoreTitleLabel() {
        let creditScoreTitleLabel = dashboardViewController.creditScoreTitleLabel
        XCTAssertEqual("Your credit score is", creditScoreTitleLabel.text, "Credit score title label text does not match expected value")
        XCTAssertEqual(UIColor.black, creditScoreTitleLabel.textColor, "Credit score title label text color does not match expected value")
        XCTAssertEqual(NSTextAlignment.center, creditScoreTitleLabel.textAlignment, "Credit score title label text alignment does not match expected value")
        XCTAssertEqual(defaultFont, creditScoreTitleLabel.font, "Credit score title label font does not match expected value")
    }
    
    func testDashboardCurrentCreditScoreLabel() {
        let creditScoreTitleLabel = dashboardViewController.currentCreditScoreLabel
        XCTAssertEqual("300", creditScoreTitleLabel.text, "Current credit score title label text does not match expected value")
        XCTAssertEqual(UIColor.orange, creditScoreTitleLabel.textColor, "Current credit score title label text color does not match expected value")
        XCTAssertEqual(NSTextAlignment.center, creditScoreTitleLabel.textAlignment, "Current credit score title label text alignment does not match expected value")
        XCTAssertEqual(customCreditScoreFont, creditScoreTitleLabel.font, "Current credit score title label font does not match expected value")
    }
    
    func testDashboardMaxCreditScoreLabel() {
        let creditScoreTitleLabel = dashboardViewController.maxCreditScoreLabel
        XCTAssertEqual("out of 700", creditScoreTitleLabel.text, "Max credit score title label text does not match expected value")
        XCTAssertEqual(UIColor.black, creditScoreTitleLabel.textColor, "Max credit score title label text color does not match expected value")
        XCTAssertEqual(NSTextAlignment.center, creditScoreTitleLabel.textAlignment, "Max credit score title label text alignment does not match expected value")
        XCTAssertEqual(defaultFont, creditScoreTitleLabel.font, "Max credit score title label font does not match expected value")
    }
    
    func testConfigureCreditScoreLabelsStackView() {
        let labelsStackView = dashboardViewController.configureCreditScoreLabelsStackView()
        let expectedLabelsStackViewFrame = CGRect(x: 97.5, y: 273.5, width: 180, height: 120)
        XCTAssertEqual(expectedLabelsStackViewFrame, labelsStackView.frame,"Credit score labels stack view frame does not match expected value")
        XCTAssertEqual(NSLayoutConstraint.Axis.vertical, labelsStackView.axis, "Credit score labels stack view axis does not match expected value")
        XCTAssertEqual(UIStackView.Alignment.center, labelsStackView.alignment, "Credit score labels stack view alignment does not match expected value")
        XCTAssertEqual(UIStackView.Distribution.fillProportionally, labelsStackView.distribution, "Credit score labels stack view distribution does not match expected value")
        XCTAssertEqual(dashboardViewController.view.center, labelsStackView.center, "Credit score labels stack view center does not match expected value")
        XCTAssertEqual(3, labelsStackView.arrangedSubviews.count, "Credit score labels stack view arranged subview count does not match expected value")
        XCTAssertEqual(dashboardViewController.creditScoreTitleLabel, labelsStackView.arrangedSubviews[0], "Credit score labels stack view first arranged subview does not match expected value")
        XCTAssertEqual(dashboardViewController.currentCreditScoreLabel, labelsStackView.arrangedSubviews[1], "Credit score labels stack view second arranged subview does not match expected value")
        XCTAssertEqual(dashboardViewController.maxCreditScoreLabel, labelsStackView.arrangedSubviews[2], "Credit score labels stack view third arranged subview does not match expected value")
    }
    
    func testConfigureLabel() {
        let defaultLabel = dashboardViewController.configureLabel(with: "Default label text")
        XCTAssertEqual("Default label text", defaultLabel.text, "Default label text does not match expected value")
        XCTAssertEqual(UIColor.black, defaultLabel.textColor, "Default label text color does not match expected value")
        XCTAssertEqual(NSTextAlignment.center, defaultLabel.textAlignment, "Default label text alignment does not match expected value")
        XCTAssertEqual(defaultFont, defaultLabel.font, "Default label font does not match expected value")
        let customLabel = dashboardViewController.configureLabel(with: "Custom label text", textColor: .green, fontSize: 40, fontWeight: .heavy)
         let customFont = UIFont.systemFont(ofSize: 40, weight: .heavy)
        XCTAssertEqual("Custom label text", customLabel.text, "Custom label text does not match expected value")
        XCTAssertEqual(UIColor.green, customLabel.textColor, "Custom label text color does not match expected value")
        XCTAssertEqual(NSTextAlignment.center, customLabel.textAlignment, "Custom label text alignment does not match expected value")
        XCTAssertEqual(customFont, customLabel.font, "Custom label font does not match expected value")
    }
}
