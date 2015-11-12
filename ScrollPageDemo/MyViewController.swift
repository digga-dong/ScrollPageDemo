//
//  MyViewController.swift
//  ScrollPageDemo
//
//  Created by HOLLEY on 15/11/11.
//  Copyright © 2015年 com.digga. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var number:Int!
    let colorMap=[
        1:UIColor.blackColor(),
        2:UIColor.orangeColor(),
        3:UIColor.blueColor()
    ]
    
    init(number initNumber:Int){
        self.number = initNumber
        super.init(nibName:nil, bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        let numberLabel = UILabel(frame:CGRectMake(0,0,100,100))
        numberLabel.center = self.view.center
        numberLabel.text = "第\(number)页"
        numberLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(numberLabel)
        self.view.backgroundColor = colorMap[number]
    }

}
