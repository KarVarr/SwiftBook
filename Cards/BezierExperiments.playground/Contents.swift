//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        self.view = view
        createBezier(on: view)
    }
    
    private func createBezier(on view: UIView) {
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = UIColor.cyan.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.magenta.cgColor
        shapeLayer.lineCap = .round
//        shapeLayer.lineDashPattern = [2,10]
//        shapeLayer.lineDashPhase = 1
//        shapeLayer.strokeStart = 0.5
        shapeLayer.lineJoin = .round
        shapeLayer.path = getPath().cgPath
    }
    
    private func getPath() -> UIBezierPath {
//        let path = UIBezierPath()
        //треугольник
//        path.move(to: CGPoint(x: 50, y: 50))
//        path.addLine(to: CGPoint(x: 150, y: 50))
//        path.addLine(to: CGPoint(x: 150, y: 150))
//        path.close()
//
        //треугольник
//        path.move(to: CGPoint(x: 50, y: 70))
//        path.addLine(to: CGPoint(x: 150, y: 170))
//        path.addLine(to: CGPoint(x: 50, y: 170))
//        path.close()
        
        //прямоугольник
//        let rect = CGRect(x: 10, y: 10, width: 200, height: 100)
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 30, height: 0))
        //круг
//        let centerPoint = CGPoint(x: 200, y: 200)
//        let path = UIBezierPath(arcCenter: centerPoint,
//        radius: 150, startAngle: .pi/5, endAngle: .pi, clockwise: true)
//        let path = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 100, height: 100))
//        let path = UIBezierPath(arcCenter: centerPoint, radius: 150, startAngle: .pi * 2, endAngle: .pi , clockwise: true)
//
        //шляпа повора
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 100, y: 100))
//        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 50,
//        startAngle: .pi, endAngle: 0, clockwise: true)
//        path.addLine(to: CGPoint(x: 220, y: 100))
//        path.addArc(withCenter: CGPoint(x: 220, y: 150), radius: 50,
//        startAngle: .pi*3/2, endAngle: .pi/2, clockwise: true)
//        path.addLine(to: CGPoint(x: 200, y: 200))
//        path.addLine(to: CGPoint(x: 200, y: 260))
//        path.addLine(to: CGPoint(x: 100, y: 260))
//        path.addLine(to: CGPoint(x: 100, y: 200))
//        path.addLine(to: CGPoint(x: 80, y: 200))
//        path.addArc(withCenter: CGPoint(x: 80, y: 150),
//        radius: 50,
//        startAngle: .pi/2, endAngle: .pi*3/2, clockwise: true)
//        path.close()
        
        //chatGPT не справился с кружкой и ложной...
        let path = UIBezierPath()
           
           // Рисуем круг (кружка)
           let centerPoint = CGPoint(x: 150, y: 150)
           path.addArc(withCenter: centerPoint, radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
           
           // Рисуем ручку (прямоугольник)
           path.move(to: CGPoint(x: 180, y: 150))
           path.addLine(to: CGPoint(x: 220, y: 150))
           
           // Рисуем ложку (кривая Безье)
           path.move(to: CGPoint(x: 180, y: 120))
           path.addQuadCurve(to: CGPoint(x: 200, y: 90), controlPoint: CGPoint(x: 220, y: 110))
           path.addQuadCurve(to: CGPoint(x: 220, y: 120), controlPoint: CGPoint(x: 220, y: 100))
           
           path.close()
           
        return path
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
