//
//  noteListViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/25.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit

class noteListViewController: UIViewController {
    
    
    //    ノート配列の用意
    var noteList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ノートデータの読み取り
       
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let viewContext = appDelegate.persistentContainer.viewContext
            let query: NSFetchRequest<Note> = Note.fetchRequest()
            
            do {
                let fetchResults = try viewContext.fetch(query)
                for result: AnyObject in fetchResults {
                    
                    let body: String? = result.value(forKey: "body") as? String
                    let created_at: Date? = result.value(forKey: "created_at") as? Date
                    
                    //                実際にprintで表示
                    print(body)
                    print(created_at)
                    //                配列に追加してtabelも表示ていく
                    
                    
                }
            } catch {
            }

        
//        ノートデータを配列に代入
        
        noteList =
            [["title":"title1","date":"2016-05-13","category":"cebu","note":"ノート1"],
             ["title":"title2","date":"2016-05-14","category":"cebu","note":"ノート2"],
             ["title":"title3","date":"2016-05-15","category":"cebu","note":"ノート3"]]
        
        
        
        
        //        UserDefaultから保存した配列を取り出す
        var myDefault = UserDefaults.standard
        
        //                UserDefaultを全削除する
        var appDomain:String = Bundle.main.bundleIdentifier!
        myDefault.removePersistentDomain(forName: appDomain)
        
        //        蓄積されたデータがあったら
        //        =の周りは空けないと=として認識されない
        if (myDefault.object(forKey: "noteList") != nil){
            //        データを取り出して、noteListを更新
            noteList = myDefault.object(forKey: "noteList") as!NSMutableArray
            
            //            一つの文法に途中で改行を入れるとエラーが出るので気をつける
            
            var noteListTmp:NSMutableArray = myDefault.object(forKey:"noteList") as!NSMutableArray
            noteList = noteListTmp.mutableCopy() as!NSMutableArray
        }
        
        print(noteList)
    }
    
    //    行数を決定
    
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
        var noteDate = (noteList[(indexPath as NSIndexPath).row] as! NSDictionary)["date"] as! String
        
        //        表示の文字を設定
        cell.textLabel?.text = "\(noteDate) \(title)"
        
        return cell
        
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
