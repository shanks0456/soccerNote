//
//  rogNote2ViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/15.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit
import CoreData

class rogNote2ViewController: UIViewController {
    @IBOutlet weak var myText5: UITextField!
    @IBOutlet weak var myText6: UITextField!
    @IBOutlet weak var myDatePicker1: UIDatePicker!
    @IBOutlet weak var myDatePicker2: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //        フォーマットをyyyy/MM/ddに変更
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
        myDatePicker1.minimumDate = df.date(from: "0001/01/01")
        myDatePicker2.maximumDate = df.date(from:"3000/12/31")
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
        
//        ----------CoreData-----------------------------------
        
        //        前のページの記入項目の内容を引き継ぐ必要あり
//        var title = myText1.text
//        var purpose = myText2.text
//        var good = myText3.text
//        var bad = myText4.text
        
        
        //        各記入項目の値を変数に入れて、表示。
        var improvement = myText5.text
        var practice = myText6.text
        var start = myDatePicker1.date
        var end = myDatePicker1.date
        
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let Note = NSEntityDescription.entity(forEntityName: "Note", in: viewContext)
        let newRecord = NSManagedObject(entity: Note!, insertInto: viewContext)
        
//        titleが他と被ってエラーにならないか注意
//        newRecord.setValue(title, forKey: "title") //値を代入
//        newRecord.setValue(purpose, forKey: "purpose") //値を代入
//        newRecord.setValue(good, forKey: "good") //値を代入
//        newRecord.setValue(bad, forKey: "bad") //値を代入
        newRecord.setValue(improvement, forKey: "improvement") //値を代入
        newRecord.setValue(practice, forKey: "practice") //値を代入
        newRecord.setValue(start, forKey: "start") //値を代入
        newRecord.setValue(end, forKey: "end") //値を代入
        newRecord.setValue(Date(), forKey: "created_at")//値を代入
        
        do {
            try viewContext.save()
        } catch {
        }

        
        
        
//        ----------------------------------------------
    }
    
    
    //    OKボタンが押された時に呼ばれるメソッド
    func myOK(){
        print("記録完了")
//        トップページに戻るコードを書く
        
        // rootViewControllerに戻る
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
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
