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
        self.hourImage.frame = CGRect(x: (UIScreen.main.bounds.width/2)-15, y: (UIScreen.main.bounds.height/2)-65, width: 30, height: 160)
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
        guard let hour = date.hour  else {return}
        guard let minute = date.minute else {return}
        guard let second = date.second else { return}
        if second >= 0  && second<=9 {
            if minute >= 0  && minute <= 9{
                self.lblTime.text = String(hour) + ":" + "0"+String(minute) + ":" +  "0"+String(second)
            }
            else{
                self.lblTime.text = String(hour) + ":" + String(minute) + ":" + "0" + String(second)
            }
        }
        else if minute >= 0  && minute <= 9 {
            self.lblTime.text = String(hour) + ":" + "0" + String(minute) + ":" +  String(second)
        }
        else {
            self.lblTime.text = String(hour) + ":" + String(minute) + ":" + String(second)
        }
    }
    func fireTimer(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
            guard let selfNew = self else {return}
            selfNew.updateUI()
        }.fire()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initClockHands()
        fireTimer()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
}

