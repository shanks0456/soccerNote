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
    

    
    @IBAction func tapBtn(_ sender: UIButton) {
        

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
