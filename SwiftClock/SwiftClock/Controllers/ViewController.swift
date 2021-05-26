//
//  ViewController.swift
//  SwiftClock
//
//  Created by Angelos Staboulis on 26/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var secondsImage: UIImageView!
    @IBOutlet var minutesImage: UIImageView!
    @IBOutlet var hourImage: UIImageView!
    @IBOutlet var lblTime: UILabel!
    var date:DateComponents!
    func initClockHands(){
        self.hourImage.frame = CGRect(x: UIScreen.main.bounds.width/2-15, y: (UIScreen.main.bounds.height/2)-65, width: 30, height: 160)
        self.minutesImage.frame = CGRect(x: UIScreen.main.bounds.width/2-15, y: (UIScreen.main.bounds.height/2)-65, width: 30, height: 160)
        self.secondsImage.frame = CGRect(x: UIScreen.main.bounds.width/2-15, y: (UIScreen.main.bounds.height/2)-65, width: 30, height: 160)
    }
    func updateUI(){
        date = Calendar.current.dateComponents(in:.current , from: Date())
        let hourAngle = (CGFloat(date.hour!) / 12.0) * CGFloat.pi * 2.0
        let minutesAngle = (CGFloat(date.minute!) / 60.0) * CGFloat.pi * 2.0
        let secondsAngle = (CGFloat(date.second!) / 60.0) * CGFloat.pi * 2.0
        self.hourImage.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
        self.minutesImage.transform = CGAffineTransform(rotationAngle: CGFloat(minutesAngle))
        self.secondsImage.transform = CGAffineTransform(rotationAngle: CGFloat(secondsAngle))
        if date.second! >= 0  && date.second!<=9 {
            if date.minute! >= 0  && date.minute! <= 9{
                self.lblTime.text = String(date.hour!) + ":" + "0"+String(date.minute!) + ":" +  "0"+String(date.second!)
            }
            else{
                self.lblTime.text = String(date.hour!) + ":" + String(date.minute!) + ":" + "0" + String(date.second!)
            }
        }
        else if date.minute! >= 0  && date.minute!<=9 {
            self.lblTime.text = String(date.hour!) + ":" + "0" + String(date.minute!) + ":" +  String(date.second!)
        }
        else {
            self.lblTime.text = String(date.hour!) + ":" + String(date.minute!) + ":" + String(date.second!)
        }
    }
    func fireTimer(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            DispatchQueue.main.async {
                self.updateUI()
            }
        }.fire()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            initClockHands()
        fireTimer()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
}

