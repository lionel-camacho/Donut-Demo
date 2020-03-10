import Foundation
import UIKit

typealias Donut = (borderLayer: CAShapeLayer, donutLayer: CAShapeLayer)

class DonutShape {
    
    static func configure() -> Donut {
        return (borderLayer: configureBorderLayer(), donutLayer: configureDonutLayer())
    }
    
    static private func configureDonutLayer() -> CAShapeLayer {
        let donutShapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 120, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        donutShapeLayer.path = circularPath
        donutShapeLayer.strokeColor = UIColor.orange.cgColor
        donutShapeLayer.fillColor = UIColor.clear.cgColor
        donutShapeLayer.strokeEnd = 0
        donutShapeLayer.lineWidth = 5
        donutShapeLayer.lineCap = .round
        donutShapeLayer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        return donutShapeLayer
    }
    
    static private func configureBorderLayer() -> CAShapeLayer {
        let borderShapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 127, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        borderShapeLayer.path = circularPath
        borderShapeLayer.strokeColor = UIColor.black.cgColor
        borderShapeLayer.fillColor = UIColor.clear.cgColor
        borderShapeLayer.lineWidth = 1
        return borderShapeLayer
        
    }
}
