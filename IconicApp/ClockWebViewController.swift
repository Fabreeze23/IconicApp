//
//  ClockWebViewController.swift
//  IconicApp
//
//  Created by Fabrice Mulumba on 11/4/18.
//  Copyright © 2018 Fabrice Mulumba. All rights reserved.
//
// Quick web view of an accurate analog clock

import UIKit
import WebKit

class ClockWebViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://analog.onlineclock.net/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        let hour = (Calendar.current.component(.hour, from: Date()))
        let minute = (Calendar.current.component(.minute, from: Date()))

        
        timeLabel.text = "\(hour):\(minute)"

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
