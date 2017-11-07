//
//  TableViewController.swift
//  SimonSaysOfficial
//
//  Created by Tim Snelling on 11/5/17.
//  Copyright © 2017 Tim. All rights reserved.
//

import UIKit

var Games = ["Simon", "Simon Reversed", "Buy DLC"]
var Title = ["Simon", "Broken, Try Again Later", "More Coming Soon"]
var myIndex = 0

class TableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = Games[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "Segue", sender: self)
    }

}
