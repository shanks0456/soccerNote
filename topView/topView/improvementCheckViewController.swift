//
//  improvementCheckViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/30.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit

class improvementCheckViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    var scSelectedIndex = -1
    var resultCheck:String = ""


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        一覧で指定された番号をもとにcoredataから情報を取得
        
                myLabel.text = resultCheck as! String
        
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
