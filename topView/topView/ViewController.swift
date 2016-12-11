//
//  ViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/14.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!

    override func viewDidLoad() {
        myImageView.image = UIImage(named:"033.jpg")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

