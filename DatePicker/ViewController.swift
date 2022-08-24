//
//  ViewController.swift
//  DatePicker
//
//  Created by Yonghun Roh on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // timeInterval = 타이머 간격,  target = 동작될 view,  selector = 타이머가 구동될 때 실행할 함수, userInfo = 사용자 정보,  repeats = 반복여부
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime() {
        // #selector()의 인자로 사용될 메서드를 선언할 때 Object-C와의 호환성을 위하여 함수 앞에 반드시 @objc 키워드를 붙여야 합니다
    lblCurrentTime.text = String(count)
        // String으로 변환한 count 값을 lblCurrentTime 레이블의 text 속성에 저장합니다
    count = count + 1
    }
    
}

