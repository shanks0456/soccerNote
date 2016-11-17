//
//  rogNoteViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/15.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit
import CoreData

class rogNoteViewController: UIViewController {
    @IBOutlet weak var myText1: UITextField!
    @IBOutlet weak var myText2: UITextField!
    @IBOutlet weak var myText3: UITextField!
    @IBOutlet weak var myText4: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    -------------データの引き渡し↓--------------
    //        サイトのコードを参考に添付したので、あってるかわからない
//    var delegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBAction func tapBtn(_ sender: UIButton) {
        

//        // AppDelegateのmessageに押されたボタンのtagを代入
//        self.delegate.message = String(sender.tag)
//        // NavigationControllerを使ったページの遷移
//        let receiveViewController: ReceiveViewController = ReceiveViewController()
//        self.navigationController?.pushViewController(receiveViewController, animated: true)
    }
    
//    -------------データ引き渡し↑----------------

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
