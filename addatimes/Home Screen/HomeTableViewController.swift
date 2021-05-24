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
    var movieLocalObject = MovieModel(allMovies: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate = self
        movieManager.fetchData()

        let headerNib = UINib(nibName: tableViewHeaderNibName, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableViewHeaderIdentifier)
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return movieLocalObject.allMovies.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movieLocalObject.allMovies[section].title
    }
    
    
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    } 
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
    
    /// For Future Use
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewHeaderIdentifier) as! HomeTableViewHeaderView
    //
    //       // headerView.categoryLabel.text = "trending now"
    //        return headerView
    //    }
    
}




// MARK: - UICollectionViewDataSource

extension HomeTableViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        let link = movieLocalObject.allMovies[0].items[indexPath.last!].vertical_image
        
        let url = URL(string: link)
        if let data = try? Data(contentsOf: url!)
        {
            let image: UIImage = UIImage(data: data)!
            cell.collectionViewMovieUIImage.image = image
        }
        return cell
    }
    
    
}




//Mark: - MovieManagerDelegate
extension HomeTableViewController : MovieManagerDelegate {
    func didUpdateMovie(_ Manager: MovieManager, movieObject: MovieModel) {
        movieLocalObject = movieObject
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}


