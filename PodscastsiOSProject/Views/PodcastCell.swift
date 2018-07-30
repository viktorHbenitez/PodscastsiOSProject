//
//  PodcastCell.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 25/07/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var imgPodcast: UIImageView!
    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblEpisodeCount: UILabel!
    
    var podcast: Podcast!{
        didSet{  // first set object in tableview then enter to didSet
            lblTrackName.text = podcast.trackName
            lblAuthor.text = podcast.artistName
            
            guard let iNumberEpisode: Int = podcast.trackCount else {return}
//            lblEpisodeCount.text = "\(podcast.trackCount ?? 0) Episode" // other way
            lblEpisodeCount.text = "\(iNumberEpisode) Episodes"
            
//            print("Loading image with url", podcast.artworkUrl600 ?? "")
            
            // Load image with url
            guard let url : URL = URL(string: podcast.artworkUrl600 ?? "") else {return}
            
            // Load the image again when scroll the UITableView.
            // The original form to load image without SDWebImage pod
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                
                guard let data = data else {return}
                
//                print("Finished downloading image data:", data)
                
                DispatchQueue.main.async {
                    self.imgPodcast.image = UIImage(data: data)
                }
                
            }.resume()
            
            
        }
    }
    
    
}
