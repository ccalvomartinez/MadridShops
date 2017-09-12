//
//  MainViewController.swift
//  MadridShops
//
//  Created by Administrador on 11/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit
import FillableLoaders

class MainViewController: UIViewController {

    var myLoader: WavesLoader?
    var v: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ejemplo de uso de controles de CocoaPods
        
        /// Star Drawing
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 180, y: 25))
        starPath.addLine(to: CGPoint(x: 195.16, y: 43.53))
        starPath.addLine(to: CGPoint(x: 220.9, y: 49.88))
        starPath.addLine(to: CGPoint(x: 204.54, y: 67.67))
        starPath.addLine(to: CGPoint(x: 205.27, y: 90.12))
        starPath.addLine(to: CGPoint(x: 180, y: 82.6))
        starPath.addLine(to: CGPoint(x: 154.73, y: 90.12))
        starPath.addLine(to: CGPoint(x: 155.46, y: 67.67))
        starPath.addLine(to: CGPoint(x: 139.1, y: 49.88))
        starPath.addLine(to: CGPoint(x: 164.84, y: 43.53))
        starPath.close()
        starPath.fill()
        
        let myPath = starPath.cgPath
        myLoader = WavesLoader.showLoader(with: myPath)
        self.view.addSubview(myLoader!)
        
        let rect = CGRect(x: 10, y: 100, width: 200, height: 200)
        v = UIView(frame: rect)
        v?.backgroundColor = UIColor.blue
        self.view.addSubview(v!)
        
        // gesture recognizer
        let tapTwoGesture = UITapGestureRecognizer(target: self, action: #selector(animateView))
        tapTwoGesture.numberOfTouchesRequired = 2
        tapTwoGesture.numberOfTapsRequired = 1
        
        //Add gesture recognizer to the view
        self.view.addGestureRecognizer(tapTwoGesture)
        
        // swipe gesture recognizer
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(restoreView))
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        
        // Add gesture recognizer to the view
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc func  animateView() {
        UIView.animate(withDuration: 2.0) {
            if let rectAct = self.myLoader?.frame {
                let rect = CGRect(x: rectAct.origin.x, y: rectAct.origin.y + 200, width: rectAct.size.width, height: rectAct.size.height)
                self.myLoader?.frame = rect
            }
            if let v = self.v {
                v.layer.cornerRadius = 30
                v.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
        }
    }
    
    @objc func  restoreView() {
        UIView.animate(withDuration: 2.0, animations: {
            if let rectAct = self.myLoader?.frame {
                let rect = CGRect(x: 0, y: 0, width: rectAct.size.width, height: rectAct.size.height)
                self.myLoader?.frame = rect
            }
        }) { (stop: Bool) in
            UIView.animate(withDuration: 2.0) {
                if let v = self.v {
                    v.layer.cornerRadius = 0
                    v.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
