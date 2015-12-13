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
        let date1 = NSDate()
        
        let components = NSDateComponents()
        components.day = 23
        let calenar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let date2 = (calenar?.dateByAddingComponents(components, toDate: date1, options: []))!
        
        let date3 = date1.dateByAddingDays(23)
        
        let date4 = date1 + .Day(23)
        
        print("\(date2)  \n\(date3)  \n\(date4)")
        
        if date4 > date1 {
            print("")
        }
        if date4 >= date3 {
            print("")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

