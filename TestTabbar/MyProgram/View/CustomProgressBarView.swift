//
//  CustomProgressBar.swift
//  TestTabbar
//
//  Created by Eri on 1/16/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

class CustomProgressBarView: UIView {
    var progressPath: UIBezierPath!
    var stripes: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var copyShapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    
    var progress: Float = 0 {
        willSet(newValue)
        {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    
    let staticProgressBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.contentMode = .redraw
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(staticProgressBar)
        setupStaticProgressBar()
        
        progressPath = UIBezierPath()
        stripes = UIBezierPath()
        self.simpleShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func simpleShape()
    {
        createPaths()
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = stripes.cgPath
        shapeLayer.lineWidth = 5
        shapeLayer.strokeColor = UIColor.white.cgColor
        
        copyShapeLayer = CAShapeLayer()
        copyShapeLayer.path = stripes.cgPath
        copyShapeLayer.lineWidth = 5
        copyShapeLayer.strokeColor = PROGRESS_BAR_VIEW_PROGRESS_TRACK_COLOR.cgColor
        
        progressLayer = CAShapeLayer()
        progressLayer.path = progressPath.cgPath
        progressLayer.lineWidth = 40.0
        progressLayer.fillColor = nil
        progressLayer.strokeColor = PROGRESS_BAR_VIEW_PROGRESS_COLOR.cgColor
        progressLayer.strokeEnd = 0.50
        
        progressLayer.mask = shapeLayer
        
        self.layer.addSublayer(progressLayer)
        self.staticProgressBar.layer.addSublayer(copyShapeLayer)
    }
    
    func createPaths()
    {
        let progressBarWidth = (screenWidth - 20) * 0.5;
        var x: CGFloat = 5.0
        
        while x < progressBarWidth {
            stripes.move(to: CGPoint(x: x + 5, y: 0.0))
            stripes.addLine(to: CGPoint(x: x, y: 40.0))
            x += 10.0
        }
        
        progressPath.move(to: CGPoint(x: 0, y: 20.0))
        progressPath.addLine(to: CGPoint(x: stripes.bounds.width + 10, y: 20.0))
    }
    
    private func setupStaticProgressBar() {
        staticProgressBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        staticProgressBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        staticProgressBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        staticProgressBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
