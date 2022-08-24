//
//  ViewController.swift
//  DatePicker
//
//  Created by Yonghun Roh on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    // 타이머가 구동되면 실행할 함수
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0      // 타이머 간격. 1초
    var count = 0           // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel!      // 현재 시간 레이블의 아웃렛 변수
    @IBOutlet var lblPickerTime: UILabel!       // 선택 시간 레이블의 아웃렛 변수
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // timeInterval = 타이머 간격,  target = 동작될 view,  selector = 타이머가 구동될 때 실행할 함수, userInfo = 사용자 정보,  repeats = 반복여부
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender             // 전달된 인수 저장
        let formatter = DateFormatter()         // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"       // formatter의 dateFormat 속성을 설정
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        // 데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(string)로 변환
        
    }
    
    // 타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func updateTime() {
        /*
        // #selector()의 인자로 사용될 메서드를 선언할 때 Object-C와의 호환성을 위하여 함수 앞에 반드시 @objc 키워드를 붙여야 합니다
    lblCurrentTime.text = String(count)
        //count 값을 문자열로 변환하여 lblCurrentTime.text에 출력
        // String으로 변환한 count 값을 lblCurrentTime 레이블의 text 속성에 저장합니다
    count = count + 1
        
        //여기까지 타이머
         */
        
        let date = NSDate()     // 현재 시간을 NSDate 함수를 사용하여 가져옵니다.
        
        let formatter = DateFormatter()     // 날짜를 출력하기 위하여 DateFormatter라는 클래스의 상수 formatter를 선언합니다
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"        // 앞에서 선언한 상수 formatter의 dateFormat 속성을 설정합니다
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)       // formatter.string(date)은 피커 뷰에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환합니다. lblCurrentTime.text = "현재시간: " + 는 "현재시간: " 이라는 String에 위에서 String으로 변환한 date 값을 추가하여 lblCurrentTime의 text에 넣습니다.
    }
    
}

