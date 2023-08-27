//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        setupViews()
    }
    
    private func setupViews() {
        self.view = getRootView()
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        let pinkView = getPinkView()
        set(view: greenView, toCenterOfView: redView)
        whiteView.center = greenView.center
        
        
        self.view.addSubview( redView )
        redView.addSubview( greenView )
        redView.addSubview( whiteView )
        self.view.addSubview(pinkView)
    }
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 300, height: 200)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    
    private func getGreenView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 10, width: 180, height: 180)
        view.backgroundColor = .green
        return view
    }
    
    private func getWhiteView() -> UIView {
        let viewFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 300, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        view.layer.shadowOpacity = 0.5
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.layer.borderWidth = 1
        
        let layer = CALayer()
        layer.backgroundColor  = UIColor.black.cgColor
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        layer.cornerRadius = 10
        view.layer.addSublayer(layer)

        return view
    }
    
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView){
        moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
