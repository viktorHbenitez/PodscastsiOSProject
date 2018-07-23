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
    
    var arrPodcasts = [
        Podcast(trackName: "Lets Buld That App", artistName: "Viktor Hugo Benitez"),
        Podcast(trackName: "Podcast Project", artistName: "Some Author")
    ]
    
    let cellId = "cellId"
    
    // Lets implement a UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarController()
        setupTableView()
    }
    
    
    fileprivate func setupBarController(){
        // Only for iOS 11.0+
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        
    }
    
    fileprivate func setupTableView(){
        
        // 1. Register a cell for our tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPodcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // Show the name of the Author
        let podcast = self.arrPodcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.trackName ?? "")\n\(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = -1
        
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
        
        
    }
    
    
    
}

// MARK:- Delegate and Protocols searchBar
extension  PodCastViewController :  UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        // later implements Alamofire toi search iTunes API
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        
        // CREATE RESPONSE SERVICE TO HTTP REQUEST
        Alamofire.request(url).responseData { (dataReponse) in
            
            if let error = dataReponse.error{
                print("Failed to contact to iTunes", error)
                return
            }
            
            guard let data = dataReponse.data else { return }
//            let dummyString = String(data: data, encoding: .utf8)
//            print(dummyString ?? "")
            
            do{
                // Decodable external representantion with struct SearchResult
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                print("Result Count", searchResult.resultCount)
//
//                searchResult.results.forEach({ (podcast) in
//
//
//                    print(podcast.artistName,podcast.trackName)
//
//                })
//
                self.arrPodcasts = searchResult.results
                self.tableView.reloadData()
            
                
            }catch let decodeErr{
                print("Faild to decoder", decodeErr)
            }
          
            
        }
    }
    
    // JSON is a external representation and tranfor to SearchResult Object
    // IMPORTANT
    /*
     {  // THE SAME NAME OF THE JSON RESPONSE
     "resultCount": 50,
     "results": [
     {
     },
     */
    struct SearchResult: Decodable{
        let resultCount: Int
        let results: [Podcast]
    }
    
}

