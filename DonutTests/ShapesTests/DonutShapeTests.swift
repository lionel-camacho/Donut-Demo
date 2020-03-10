import XCTest
@testable import Donut

class DonutShapeTests: XCTestCase {
    let donutShape = DonutShape.configure()

    func testDonutShapeBorderLayer() {
        let donutBorderLayer = donutShape.borderLayer
        let expectedCircularPath = UIBezierPath(arcCenter: .zero, radius: 127, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        XCTAssertEqual(expectedCircularPath, donutBorderLayer.path, "Donut border layer path does not match expected value")
        XCTAssertEqual(UIColor.clear.cgColor, donutBorderLayer.fillColor, "Donut border layer fill color does not match expected value")
        XCTAssertEqual(1.0, donutBorderLayer.lineWidth, "Donut border layer line width does not match expected value")
        XCTAssertEqual(UIColor.black.cgColor, donutBorderLayer.strokeColor, "Donut border layer stroke color does not match expected value")
    }
    
    func testDonutShapeDonutLayer() {
        let donutLayer = donutShape.donutLayer
        let expectedCircularPath = UIBezierPath(arcCenter: .zero, radius: 120, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        XCTAssertEqual(expectedCircularPath, donutLayer.path, "Donut layer path does not match expected value")
        XCTAssertEqual(UIColor.clear.cgColor, donutLayer.fillColor, "Donut layer fill color does not match expected value")
        XCTAssertEqual(5.0, donutLayer.lineWidth, "Donut layer line width does not match expected value")
        XCTAssertEqual(UIColor.orange.cgColor, donutLayer.strokeColor, "Donut layer stroke color does not match expected value")
        XCTAssertEqual(0.0, donutLayer.strokeEnd, "Donut layer stroke end does not match expected value")
        XCTAssertEqual(CAShapeLayerLineCap.round, donutLayer.lineCap, "Donut layer line cap does not match expected value")
    }
}
