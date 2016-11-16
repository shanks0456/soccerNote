//
//  rogNote2ViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/15.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit

class rogNote2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBtn(_ sender: UIButton) {
        
        
        //        アラートを作る
        var alertController = UIAlertController (title: "確認", message:"ノートを記録してもよろしいですか？", preferredStyle: .alert)
        
        //        OKボタンを追加
        alertController.addAction(UIAlertAction (title:"記録完了", style: .default, handler: {action in self.myOK()}))
        
        //        キャンセルボタンを追加
        alertController.addAction(UIAlertAction(title:"キャンセル", style: .cancel, handler: {action in self.myOK()}))
        
        //        アラートを表示する(重要)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    //    OKボタンが押された時に呼ばれるメソッド
    func myOK(){
        print("記録完了")
//        トップページに戻るコードを書く
    }
    
    //    キャンセルボタンが押された時に呼ばれるメソッド
    func myCancel() {
        print("キャンセル")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
