//
//  SandBoxViewController.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 04/05/2018.
//

import UIKit

class SandBoxViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var timeoutButton: UIButton!
    
    @IBAction func clickSetTimeout(_ sender: Any) {
        
        let timer = setInterval(self, 3) {
            let alert = UIAlertController(title: "Please enter amount less than 1 billion", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        //timer.invalidate()      // cancel it.

        

    }
    
    var draw2d: Draw2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //UIColor.yellowColor()
        progress.trackTintColor = UIColor.cyan
        progress.progressTintColor = UIColor.black
        // Do any additional setup after loading the view.
        
        
        //////////////
        // DRAW CIRCLE
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.red.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
        
        // DRAW RECT
        let rectangle = CGRect(x: 0,y: 170,width: 200,height: 80)
        /*
        let context = UIGraphicsGetCurrentContext()
        let myShadowOffset = CGSize (width: -10,  height: 15)
        
        context?.saveGState()
        context?.setShadow (offset: myShadowOffset, blur: 5)
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 0,y: 170,width: 200,height: 80)
        context?.addEllipse(in: rectangle)
        context?.strokePath()
        context?.restoreGState()*/

        draw2d = Draw2D()
        self.view.addSubview(draw2d)

        
        //////////////
        // DRAW LABEL WITH CIRCLE
        let size:CGFloat = 35.0 // 35.0 chosen arbitrarily
        
        let countLabel = UILabel()
        countLabel.text = "5555"
        //countLabel.textColor = .green()
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 14.0)
        let rect = CGRect(origin: CGPoint(x: 100,y :100), size: CGSize(width: 100, height: 100))
        
        countLabel.bounds = rect // CGRect(origin: .zero, size: size)
        countLabel.layer.cornerRadius = size / 2
        countLabel.layer.borderWidth = 3.0
        countLabel.layer.backgroundColor = UIColor.green.cgColor
        countLabel.layer.borderColor = UIColor.yellow.cgColor
        
        countLabel.center = CGPoint(x:200.0, y:200.0)
        
        self.view.addSubview(countLabel)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

@IBDesignable
class DRAW: UIView {
    
    override func draw(_ rect: CGRect) {
        
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 100))
        UIColor.yellow.setStroke()
        UIColor.red.setFill()
        path.lineWidth = 5
        path.stroke()
        path.fill()
        
        
    }
    
    
}
