//
//  GameViewController.swift
//  Acceleromator
//
//  Created by 小林玲衣奈 on 2020/09/09.
//  Copyright © 2020 Reina Kobayashi. All rights reserved.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    @IBOutlet private weak var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable{
            
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(date, error) in
                self.accelerationX = (Data?.acceleration.x)!
                self.awaImageView.center.x =
                    self.awaImageView.center.x - CGFloat(self.accelerationX! * 20)
                
                if self.awaImageView.frame.origin.x < 40{
                    self.awaImageView.frame.origin.x = 40
                }
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
                
            })
        }
        
        override func prepare(for segue: UIStorybordSegue, sender: Any?){
             let resultViewController:ResultVeiwController = segue.destination as! ResultViewController
             resultViewController.accelerationX = self.accelerationX
         }

        // Do any additional setup after loading the view.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
