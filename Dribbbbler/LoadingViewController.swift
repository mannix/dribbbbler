//
//  LoadingViewController.swift
//  Dribbbbler
//
//  Created by Mike Mannix on 10/20/15.
//  Copyright © 2015 Mike Mannix. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoadingViewController: UIViewController {

    var shots = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = getDribbbleAccessToken()
        let headers = [
            "Authorization": "Bearer " + token
        ]
        
        Alamofire.request(.GET, "https://api.dribbble.com/v1/shots", headers: headers)
            .responseJSON { response in
                if let resultValue = response.result.value {
                    let jsonResponse = JSON(resultValue)
                    for jsonShot in jsonResponse.arrayObject! {
                        if let shotTitle = jsonShot["title"] as? String {
                            self.shots.append(shotTitle)
                        }
                    }
                    self.performSegueWithIdentifier("showShots", sender: self)
                }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let shotsTableViewController = segue.destinationViewController as? ShotListTableTableViewController {
            shotsTableViewController.shots = self.shots
        }
    }

    func getDribbbleAccessToken() -> String {
        var token = ""
        let fileName = "dribbbler"
        let fileType = "token"
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType:fileType) {
            do {
                token = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            }
            catch {
                print("Unable to retrieve token")
            }
        }
        return token
    }

}
