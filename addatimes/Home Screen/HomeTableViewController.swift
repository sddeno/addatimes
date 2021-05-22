//
//  ViewController.swift
//  addatimes
//
//  Created by shubham on 22/05/21.
//

import UIKit

class HomeTableViewController: UITableViewController {

    let tableViewCellIdentifier = "HomeTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // no. of rows in each sections
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5 // no. of sections
    }
     
    // MARK: - UITableViewDelegate
    

}

