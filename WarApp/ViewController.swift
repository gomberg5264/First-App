//
//  ViewController.swift
//  WarApp
//
//  Created by Eddy Yeung on 1/11/18.
//  Copyright © 2018 Eddy Yeung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var winRate: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    var counter = 0
    var rate = 0.00
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playerDealTapped(_ sender: Any) {
        counter += 1
        let leftRandomNumber = Int(arc4random_uniform(13) + 2)
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        
        let rightRandomNumber = Int(arc4random_uniform(13) + 2)
        rightImageView.image = UIImage(named: "card\(rightRandomNumber)")
        if leftRandomNumber > rightRandomNumber{
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
        }
            
        else{
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            reset()
        }
        
        func reset(){
            leftImageView.image = UIImage(named: "back")
            rightImageView.image = UIImage(named: "back")
        }
        
        rate = ((Double(leftScore))/(Double(counter)))
        print(rate)
        rate = Double(round(1000*rate)/1000)
        winRate.text = String("Win Rate: \(rate*100)%")
        
    }
    
}

