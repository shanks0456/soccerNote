//
//  noteCheckViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/28.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit

class noteCheckViewController: UIViewController {
    
    var scSelectedIndex = -1
    var noteCheck = NSMutableArray()

    @IBOutlet weak var myTitle: UITextField!
    @IBOutlet weak var myPurpose: UITextField!
    @IBOutlet weak var myGood: UITextField!
    @IBOutlet weak var myBad: UITextField!
    @IBOutlet weak var myImprovement: UITextField!
    @IBOutlet weak var myPractice: UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
//    @IBAction func titleText(_ sender: UITextField) {
//        print(noteCheck["titleCheck"])
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        一覧で指定された番号をもとにcoredataから情報を取得
        
        
        print(noteCheck)

        
        
        
    }
    
    @IBAction func myButton(_ sender: UIButton) {
//        トップページに戻るコードを書く
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
