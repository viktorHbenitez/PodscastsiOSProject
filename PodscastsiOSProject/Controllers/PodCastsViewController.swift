//
//  PodCastsViewController.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 21/07/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit
import Alamofire

class PodCastViewController: UITableViewController {
    
    var arrPodcasts = [Podcast]()  // Array init
    
    let cellId = "cellId"
    
    // Lets implement a UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarController()
        setupTableView()
    }
    
    
    fileprivate func setupBarController(){
        
        self.definesPresentationContext = true // I do not cover all the UITableViewController, show the navigationController
        // Only for iOS 11.0+
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        
    }
    
    fileprivate func setupTableView(){
        
        tableView.tableFooterView  = UIView() // Remove horizontal lines
        
        // 1. Register a cell for our tableView
        let nibName = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: cellId)
        
    }
    
    // MARK:- Delegate and Protocols UITableView
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeVC = EpisodesViewController()
        
        let podcast : Podcast = self.arrPodcasts[indexPath.row]
        episodeVC.podcast = podcast
        navigationController?.pushViewController(episodeVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lblDescription = UILabel()
        lblDescription.text = "Please enter a Search Term"
        lblDescription.textAlignment = .center
        lblDescription.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return lblDescription
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // ternary operation
        return self.arrPodcasts.count > 0 ? 0 : 250 // Show and hide please enter a search term
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPodcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCell
        
        
        let podcastObject: Podcast = self.arrPodcasts[indexPath.row];
        cell.podcast = podcastObject
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    
    
    
}

// MARK:- Delegate and Protocols searchBar
extension  PodCastViewController :  UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     
        APIService.shareInstance.fetchPodcast(with: searchText) { (arrPodcast) in
            self.arrPodcasts =  arrPodcast
            self.tableView.reloadData()
        }
        
    }
    
}

