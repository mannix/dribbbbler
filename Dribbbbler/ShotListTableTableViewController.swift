//
//  ShotListTableTableViewController.swift
//  Dribbbbler
//
//  Created by Mike Mannix on 11/8/15.
//  Copyright © 2015 Mike Mannix. All rights reserved.
//

import UIKit

class ShotListTableTableViewController: UITableViewController {
    
    var shots = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shots.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shotCell", forIndexPath: indexPath)

        cell.textLabel?.text = shots[indexPath.row]

        return cell
    }
}
