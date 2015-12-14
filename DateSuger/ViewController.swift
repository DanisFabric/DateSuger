//
//  ViewController.swift
//  DateSuger
//
//  Created by Danis on 15/12/13.
//  Copyright © 2015年 danis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date1 = NSDate.dateWithYear(2018, month: 3, day: 28)!
        let date2 = date1.dateByAddingDays(23)
        let date3 = date2 + .Year(1) + .Month(4)
        
        if date1 < date2 {
            print("2333")
        }
        if date3 == NSDate() {
            print("What ~")
        }
//        print(date3.daysFrom(date2))
        let func1 = NSDate.daysFrom(date1)
        //科里化
        print(func1(date2))
//        print(NSDate.daysFrom(date1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

