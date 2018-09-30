//
//  EpisodesViewController.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 07/08/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation
import UIKit

class EpisodesViewController: UITableViewController {
    
    var podcast : Podcast? {
        didSet{
            navigationItem.title = podcast?.trackName
        }
    }
    
    // generate a constructor with a ll properties on it
    struct Episode {
        let title : String
    }
    
    var arrEpisode : [Episode] = [
        Episode(title: "FirsEpisode"),
        Episode(title: "SecondEpisode"),
        Episode(title: "ThirdEpisode")
    ]
    
    
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

