//
//  ViewController.swift
//  addatimes
//
//  Created by shubham on 22/05/21.
//

import UIKit

class HomeTableViewController: UITableViewController {

    let tableViewCellIdentifier = "HomeTableCell"
    let collectionViewCellIdentifier = "HomeCollectionCell"
     
    let tableViewHeaderNibName = "HomeTableViewHeaderView"
    let tableViewHeaderIdentifier = "HomeTableViewHeaderView"
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate = self
        movieManager.fetchData()
        
        // register HomeTableViewHeaderView.xib
        let headerNib = UINib(nibName: tableViewHeaderNibName, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableViewHeaderIdentifier)
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    } 
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewHeaderIdentifier) as! HomeTableViewHeaderView
        headerView.categoryLabel.text = " Trending Movies"
        return headerView
    }

}




// Mark: - UICollectionViewDataSource

extension HomeTableViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as! HomeCollectionViewCell
        return cell
    }

}





 //Mark: - MovieManagerDelegate
extension HomeTableViewController : MovieManagerDelegate {
    
    func didUpdateMovie(_ Manager: MovieManager, movieObject: MovieModel) {
        print(movieObject.allMovies[0].title)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

}


