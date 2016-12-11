//
//  noteListViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/25.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit
import CoreData

class noteListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTableView: UITableView!
    
    var selectedIndex = -1
    
    var noteCheck = NSDictionary()
    
    
    //    ノート配列の用意
    var noteList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.image = UIImage(named:"002.jpg")
        
//        ノートデータの読み取り
       
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let viewContext = appDelegate.persistentContainer.viewContext
            let query: NSFetchRequest<Note> = Note.fetchRequest()
            
            do {
                let fetchResults = try viewContext.fetch(query)
                for result: AnyObject in fetchResults {
                    
                    let title: String? = result.value(forKey: "title") as? String
                    let purpose: String? = result.value(forKey: "purpose") as? String
                    let good: String? = result.value(forKey: "good") as? String
                    let bad: String? = result.value(forKey: "bad") as? String
                    let improvement: String? = result.value(forKey: "improvement") as? String
                    let practice: String? = result.value(forKey: "practice") as? String

                    let start: String? = result.value(forKey: "start") as? String
                    let end: String? = result.value(forKey: "end") as? String

                    let created_at: Date? = result.value(forKey: "created_at") as? Date
                    
                    noteList.add(
                        ["title":title,"purpose":purpose,"good":good,"bad":bad,"improvement":improvement,"practice":practice,"start":start,"end":end,"created_at":created_at])
                    
                }
            } catch {
            }
    }
    
    
    //    行数を決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return noteList.count
        
    }
    
    //    セルに行番号を表示
    func tableView(_ tableview: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .default, reuseIdentifier:"mycell")
        
        //        タイトルを取得し代入
        var title = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["title"] as! String
        
                //        日付を取得し代入
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
        df.timeZone = TimeZone.current
         var noteDate = df.string(from:(noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["created_at"] as! Date)

        
        //        表示の文字を設定
        cell.textLabel?.text = "\(title)　\(noteDate)"
                return cell
        
    }
  
    
//        選択された時に行う処理
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\((indexPath as! NSIndexPath).row)行目を選択")
            //        選択された行番号をメンバ変数に保存
            selectedIndex = (indexPath as NSIndexPath).row
            
            let df = DateFormatter()
            df.dateFormat = "yyyy/MM/dd hh:mm:ss"
            df.timeZone = TimeZone.current
            var created_at = df.string(from:(noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["created_at"] as! Date)
            //var created_at = ""
            

//        print((noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["created_at"] as! Date)
            
            var title = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["title"] as! String
            
            var purpose = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["purpose"] as! String
            
            var good = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["good"] as! String
            
            var bad = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["bad"] as! String
            
            var improvement = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["improvement"] as! String
            
            var practice = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["practice"] as! String

            noteCheck =
                ["titleCheck":title,"purposeCheck":purpose,"goodCheck":good,"badCheck":bad,"improvementCheck":improvement,"practiceCheck":practice,"created_atCheck":created_at]
            
//            print(noteCheck)
            
    
            performSegue(withIdentifier: "secondSegue", sender: nil)
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender:Any?){
            //        ここに、次の画面へ渡すデータの代入処理を記述
            let secondVC = segue.destination as! noteCheckViewController
            secondVC.scSelectedIndex = selectedIndex

            secondVC.noteCheck = noteCheck
            
            

            
        }

    //Bar Button Itemの中の"追加アイテム"自体をactionとして記述する必要がある！！
    @IBAction func tapAddBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    //    戻ってきた時
    @IBAction func returnMenu(segue:UIStoryboardSegue){
        
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
