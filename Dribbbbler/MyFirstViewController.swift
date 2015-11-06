//
//  MyFirstViewController.swift
//  Dribbbbler
//
//  Created by Mike Mannix on 10/20/15.
//  Copyright © 2015 Mike Mannix. All rights reserved.
//

import UIKit
import Alamofire

class MyFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers = [
            "Authorization": "Bearer 649ee1d84d886e3fe79932d690004da1043fee042e46f321a03ddaa9f27f114b"
        ]
        
        
        Alamofire.request(.GET, "https://api.dribbble.com/v1/shots", headers: headers)
            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
