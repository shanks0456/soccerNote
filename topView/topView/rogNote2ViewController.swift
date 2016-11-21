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
    
    @IBAction func changedDate1(_ sender: UIDatePicker) {
        
        print(sender.date)
        
        var start = myDatePicker1.date as! String
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        myDatePicker1.minimumDate = df.date(from: "0001/01/01")
        
        
      	
    }
    
    @IBAction func changedDate2(_ sender: UIDatePicker) {
        
        var end = myDatePicker2.date as! String
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
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
        
    
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
        var improvement =  myText5.text
        var practice = myText6.text
        var start = df.string(from: myDatePicker1.date)
        var end = df.string(from: myDatePicker2.date)
        
        var currentdate = df.string(from: Date())
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let tweet = NSEntityDescription.entity(forEntityName: "Note", in: viewContext)
        let newRecord = NSManagedObject(entity: tweet!, insertInto: viewContext)
        newRecord.setValue(myText5.text, forKey: "improvement") //値を代入
        newRecord.setValue(myText6.text, forKey: "practice") //値を代入
        newRecord.setValue(start, forKey: "start") //値を代入
        newRecord.setValue(end, forKey: "end") //値を代入
        newRecord.setValue(currentdate, forKey: "created_at")//値を代入
        
        do {
            try viewContext.save()
        } catch {
        }
        

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