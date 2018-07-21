//
//  PodCastsViewController.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 21/07/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit


class PodCastViewController: UITableViewController {
    
    let podcast = [
        Podcast(name: "Lets Buld That App", artistName: "Viktor Hugo Benitez"),
        Podcast(name: "Podcast Project", artistName: "Some Author")
    ]
    
    let cellId = "cellId"
    
     override func viewDidLoad() {
        super.viewDidLoad()
    
        // 1. Register a cell for our tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcast.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // Show the name of the Author
        let podcast = self.podcast[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
        
        
    }
    
    
    
}


