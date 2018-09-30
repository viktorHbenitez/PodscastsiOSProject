//
//  EpisodesViewController.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 07/08/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation
import UIKit
import FeedKit  // 1. Import XML parser cocoa pods

class EpisodesViewController: UITableViewController {
    
    // generate a constructor with a ll properties on it
    struct Episode {
        let title : String
    }
    
    var arrEpisode : [Episode] = [Episode]()
    
    var podcast : Podcast? {
        didSet{
            navigationItem.title = podcast?.trackName
            fetchEpisode()
        }
    }
    
    private func fetchEpisode(){
        // Another way to unwrap an optional variable
        print("Looking for episodes at feed url:", podcast?.feedUrl ?? "")
        
        
        // 2. Create URL with String
        guard let feedUrl : String = podcast?.feedUrl else {return}
        
        // NOTE : CHANGE HTTP TO HTTPS OHTER WAY TO READ http domains
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        
        guard let url : URL = URL(string: secureFeedUrl) else {return}
        
        // 3. Parse XML url with FeedKit
        let parser = FeedParser(URL: url)
        
        parser?.parseAsync(result: { (result) in  // Method with block result
            
            // associative enumeration values
            switch result {
            case let .rss(feed):
                
                // 1. Show name podcast in the tableView
                var episodes = [Episode]() // 1.2 blank Episode array
                
                feed.items?.forEach({ (feedItem) in // 1.3 Loop the items
                    print("Name Feed Item", feedItem.title ?? "")
                    
                    let objectEpisode : Episode = Episode(title: feedItem.title ?? "")
                    episodes.append(objectEpisode)  // append in the blank array
                    
                })
                
                self.arrEpisode = episodes  // 1.4 Set the new array in the general Array
                DispatchQueue.main.async {
                    self.tableView.reloadData()  // 1.5 Reaload TableView in the main Thread
                }
                break
                
            case let .failure(error):
                print("Failed to parse feed:", error)
                break
            default:
                print("Found a feed....")
            }
        })
        
    }
    
    
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    
    fileprivate func setupTableView(){
        
        tableView.tableFooterView  = UIView() // Remove horizontal lines
        // default register Cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:  cellId)
        
    }
    
    // Number of section in table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of row in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEpisode.count
    }
    
    
    // Create a cell for each table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a new cell if needed or reuse an old one
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // Set the text from the date model
        let episode : Episode = arrEpisode[indexPath.row]
        
        cell.textLabel?.text = "\(episode.title)"
        
        return cell
        
    }
    
    // Method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped the row")
    }
    
}

