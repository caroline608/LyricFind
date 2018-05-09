//
//  ViewController.swift
//  LyricApp
//
//  Created by C4Q on 3/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var artistCollecionView: UICollectionView!
    @IBOutlet weak var trackTableview: UITableView!
   
    
    var tracks = [TrackWrapper]() {
        didSet {
            DispatchQueue.main.async {
                self.trackTableview.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        trackTableview.delegate = self
        trackTableview.dataSource = self
        searchBar.delegate = self
        defaultSearch()
    }
    
    
    func defaultSearch() {
        SearchAPIClient.artistSearch(keyword: "bad", completion: { (error, tracks) in
            if let error = error {
                let alertController = UIAlertController(title: "Error Occured", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(okAction)
            } else if let tracks = tracks {
                self.tracks = tracks
            }
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            let detailVC = segue.destination as! DetailViewController
            let cell = sender as! SearchTableViewCell
            if let indexPath = trackTableview.indexPath(for: cell) {
                detailVC.track = tracks[indexPath.row]
                // TODO: Send lyrics
//                detailVC.image = cell.imageView.image
            }
        }
    }
    
    
    
    
    
}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let track = tracks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        cell.nameLabel.text = track.track.trackName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else { return }
        if !searchText.isEmpty {
            guard let encodedString = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
            SearchAPIClient.artistSearch(keyword: encodedString, completion: { (error, tracks) in
                if let error = error {
                    let alertController = UIAlertController(title: "Error Occured", message: "\(error.localizedDescription)", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                } else if let tracks = tracks {
                    self.tracks = tracks
                }
            })
        }
    }
}
