//
//  evaluationViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/12/01.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit

class evaluationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
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
