//
//  rogNote2ViewController.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/15.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//

import UIKit
import CoreData
//--------先生のサンプルを基にとにかく貼り付けておく--------------
import Photos
import MobileCoreServices
import AVFoundation
//-----------------------

//class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

class rogNote2ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myText1: UITextField!
    
//    -----------
    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var bCameraStart: UIButton!
//    ----------
    
    @IBOutlet weak var myText2: UITextField!
    @IBOutlet weak var myText3: UITextField!
    @IBOutlet weak var myText4: UITextField!
    @IBOutlet weak var myText5: UITextField!
    @IBOutlet weak var myText6: UITextField!
    @IBOutlet weak var myDatePicker1: UIDatePicker!
    @IBOutlet weak var myDatePicker2: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.image = UIImage(named:"011.jpg")

//        フォーマットをyyyy/MM/ddに変更
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        myDatePicker1.minimumDate = df.date(from: "2016/01/01")
        myDatePicker2.maximumDate = df.date(from:"2050/12/30")

//        ----キーボード非表示------
        
        myText1.delegate = self
        myText2.delegate = self
        myText3.delegate = self
        myText4.delegate = self
        myText5.delegate = self
        myText6.delegate = self

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//    ------------↑-------------------
    
    
//    -----------↓----------------------
    
//     カメラの撮影開始
        @IBAction func cameraStart(_ sender: UIButton) {
            
            let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
            // カメラが利用可能かチェック
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                // インスタンスの作成
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                self.present(cameraPicker, animated: true, completion: nil)
    
//            }
//            else{
//                label.text = "error"
                
            }
        }

//    ------------↑----------------------
    
    
//    -------↓------------------
    //　撮影が完了時した時に呼ばれる
        func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
//                先生のサンプルによると下の二つは非表示になる
                cameraView.contentMode = .scaleAspectFit
                cameraView.image = pickedImage
    
                
//   --------------ここに先生のサンプルを見ると違いがある。-------------
//                 When taking a picture with the camera, store it in the user roll
                PHPhotoLibrary.shared().performChanges(
                    { () -> Void in
                        
//                         save the image
                        var assetChangeRequest:PHAssetChangeRequest = PHAssetCreationRequest.creationRequestForAsset(from: pickedImage)
                        
                        
                        self.localID = (assetChangeRequest.placeholderForCreatedAsset?.localIdentifier)!
                        
                        print(self.localID)
                        
                        // TODO how to get the asset url
                        
            }, completionHandler:
                    { (finished, error) -> Void in
                        if (finished)
                        {
                            
                            
                            print(self.localID)
                            
                            
                            self.selectedUrl = "assets-library://asset/asset.JPG?id="+self.localID+"&ext=JPG"
                            
                            print(self.selectedUrl)
                            
                    
                            
                            
                            
                        }
                    }
//            謎！
            )
            
    //                -------サンプルとの違い------------------
                
            }
//            閉じる処理
            imagePicker.dismiss(animated: true, completion: nil)
//            label.text = "Tap the [Save] to save a picture"
    
        }
    
        // 撮影がキャンセルされた時に呼ばれる
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
//            label.text = "Canceled"
        }


        // 写真を保存の保存は記録完了ボタンを押した時に発動する
//        @IBAction func savePic(_ sender : AnyObject) {
//            let image:UIImage! = cameraView.image
//    
//            if image != nil {
//                
//                if #available(iOS 9.3, *) {
    
//    cameraViewControllerじゃなくていいのか？アルバムのコードだから必要ない
//                UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
            
//   ------------ 先生のサンプルから持ってきたもの--------------

    
////         書き込み完了結果の受け取り
//        func image(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
//            print("1")
//    
//            if error != nil {
//                print(error.code)
////                label.text = "Save Failed !"
////            }
////            else{
////                label.text = "Save Succeeded"
////            }
//        }
    

    
//    --------↑-----------------
    
    @IBAction func changedDate1(_ sender: UIDatePicker) {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd hh:mm:ss"
        var start = df.string(from:myDatePicker1.date)

    }
    
    @IBAction func changedDate2(_ sender: UIDatePicker) {
        
//        var end = myDatePicker2.date as! String
//        
//        let df = DateFormatter()
//        df.dateFormat = "yyyy/MM/dd"
//        myDatePicker2.maximumDate = df.date(from:"3000/12/31")
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd hh:mm:ss"
        var end = df.string(from:myDatePicker2.date)

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
        df.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        //        ------タイムゾーンの設定-------------------
        df.timeZone = TimeZone.current
        var strDateTmp = df.string(from: Date())
        var changeDate = df.date(from: strDateTmp)

        
//        let created2 = DateFormatter()
//        created2.dateFormat = "yyyy/MM/dd hh:mm:ss"
//        created2.timeZone = TimeZone.current
//        
//        var strDateTmp = created2.string(from: Date())
//        var changeDate = created2.date(from: strDateTmp)
//        
//        //coreDataに設定
//        newRecord.setValue(changeDate, forKey: "created_at")
        
//        ---------------------------
        
//        --------カメラの写真をcoredataに送る----------
//         写真を保存の保存は記録完了ボタンを押した時に発動する
//                    let image:UIImage! = cameraView.image
        
//                    if image != nil {
//                        UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
//                    }
//                    else{
////                        label.text = "image Failed !"
//                    }

//        ----------カメラ↑-------------------------
        
        var title = myText1.text
        var purpose = myText2.text
        var good = myText3.text
        var bad = myText4.text
        var improvement =  myText5.text
        var practice = myText6.text
        var start = df.string(from: myDatePicker1.date)
        var end = df.string(from: myDatePicker2.date)
        
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let Note = NSEntityDescription.entity(forEntityName: "Note", in: viewContext)
        let newRecord = NSManagedObject(entity: Note!, insertInto: viewContext)
        
        
        
        newRecord.setValue(myText1.text, forKey: "title") //値を代入
        //        カメラの追加コード
        newRecord.setValue(selectedUrl, forKey: "image") //値を代入
        
        newRecord.setValue(myText2.text, forKey: "purpose") //値を代入
        newRecord.setValue(myText3.text, forKey: "good") //値を代入
        newRecord.setValue(myText4.text, forKey: "bad") //値を代入
        newRecord.setValue(myText5.text, forKey: "improvement") //値を代入
        newRecord.setValue(myText6.text, forKey: "practice") //値を代入
        newRecord.setValue(start, forKey: "start") //値を代入
        newRecord.setValue(end, forKey: "end") //値を代入
        

        
//        ----上の続きでタイムゾーンの設定-----
//        newRecord.setValue(Date(), forKey: "created_at")//値を代入
        newRecord.setValue(changeDate, forKey: "created_at")
        
//        --------------
        
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
