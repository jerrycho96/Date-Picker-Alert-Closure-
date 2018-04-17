//
//  ViewController.swift
//  Date Picker
//
//  Created by D7703_26 on 2018. 4. 12..
//  Copyright © 2018년 조영진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var normalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePic: UIDatePicker!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTimer()
        })

    }
    
    func updateTimer() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss a EE"
        normalLabel.text = formatter.string(from: date)
        
        if dateLabel.text == normalLabel.text {
            view.backgroundColor = UIColor.red
            let myAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default) { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.blue
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.green
            }
            
            myAlert.addAction(okAction)
            myAlert.addAction(cancelAction)
            
            
            present(myAlert, animated: true, completion: nil)
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionPicker(_ sender: Any) {
        print("change Date Picker")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss a EE"
        dateLabel.text = formatter.string(from: datePic.date)
    }
    
    @IBAction func reset(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
}

