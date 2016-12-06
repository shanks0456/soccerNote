//
//  noteCheckViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/28.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit
import CoreData

class noteCheckViewController: UIViewController {
    
    var scSelectedIndex = -1
    var noteCheck = NSDictionary()

    @IBOutlet weak var myTitle: UITextField!
    @IBOutlet weak var myPurpose: UITextField!
    @IBOutlet weak var myGood: UITextField!
    @IBOutlet weak var myBad: UITextField!
    @IBOutlet weak var myImprovement: UITextField!
    @IBOutlet weak var myPractice: UITextField!
    
    @IBOutlet weak var myCreated_at: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        一覧で指定された番号をもとにcoredataから情報を取得

        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var created_atEdit = noteCheck["created_atCheck"] as! String
        
        myTitle.text = noteCheck["titleCheck"] as! String
        myPurpose.text = noteCheck["purposeCheck"] as! String
        myGood.text = noteCheck["goodCheck"] as! String
        myBad.text = noteCheck["badCheck"] as! String
        myImprovement.text = noteCheck["improvementCheck"] as! String
        myPractice.text = noteCheck["practiceCheck"] as! String
        
        myCreated_at.text = created_atEdit

        
        
        
        print(noteCheck)
        
    }
    
//    編集機能参考
//    
//    var df = DateFormatter()
//    df.dateFormat = "yyyy/MM/dd hh:mm:ss +0000"
//    df.timeZone = TimeZone.current
//    //保存していた日付を文字列からDate型に変換
//    var savedDateTime:NSDate = df.date(from: "\(myAp.myCount)") as! NSDate
//    
//    print(savedDateTime)
//    
//    
//    //検索条件として指定
//    let predicate = NSPredicate(format: "SELF.created_at = %@", savedDateTime )
//    query.predicate = predicate
//    
//    
//    do {
//    let fetchResults = try viewContext.fetch(query)
//    
    
//    ------------↓編集機能--------------------
    
    @IBAction func editButton(_ sender: UIButton) {
        var titleEdit = myTitle.text
        var purposeEdit = myPurpose.text
        var goodEdit = myGood.text
        var badEdit = myBad.text
        var improvementEdit = myImprovement.text
        var practiceEdit = myPractice.text
        
        var created_atEdit = myCreated_at.text
        
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
//        createとtitleで検索して取ってくる
        
//        〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
//        
//        var request = NSFetchRequest(entityName: "Answers")
//        request.returnsObjectsAsFaults = false;

//        let resultPredicate1 = NSPredicate(format: "title = %i", titleEdit! and )
//        
//        let resultPredicate2 = NSPredicate(format: "created_at = %@", created_atEdit!)
//        
//        var compound = NSCompoundPredicate.andPredicate(withSubpredicates: [resultPredicate1, resultPredicate2])
//        request.predicate = compound
        
//        ＾＾＾＾＾＾＾＾＾＾＾＾＾＾＾＾
//        let fetchRequest: NSFetchRequest<Staff> = Staff.fetchRequest()
        print(noteCheck["created_atCheck"])
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var created_atEditDate:NSDate = df.date(from: noteCheck["created_atCheck"] as! String ) as! NSDate
        
        
        
        if viewContext != nil {
            request.predicate = NSPredicate(format: "title = %@", titleEdit!)
            request.predicate = NSPredicate(format: "created_at = %@", created_atEditDate )
        }
        
//        ======================================
        
        //検索条件として指定
//            let titkeserch = NSPredicate(format: "title = %@", titleEdit! )
//            let timeserch = NSPredicate(format: "SELF.created_at = %@", savedDateTime )
//            query.predicate = predicate

    
        
//        ＾＾＾＾＾＾＾＾＾＾＾＾＾＾
        
//        〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
        
        
         do {
            let fetchResults = try viewContext.fetch(request)
            for result: AnyObject in fetchResults {
                let record = result as! NSManagedObject
                //                別のテキストフォルダーを変数で指定して、その値をDATEの中に書く
//                record.setValue(Date(), forKey: "created_at")
                
                record.setValue(titleEdit, forKey: "title")
                record.setValue(purposeEdit, forKey: "purpose")
                record.setValue(goodEdit, forKey: "good")
                record.setValue(badEdit, forKey: "bad")
                record.setValue(improvementEdit, forKey: "improvement")
                record.setValue(practiceEdit, forKey: "practice")
            }
            try viewContext.save()
        } catch {
        }
    }
    
//    -------------↑変種機能------------------


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
