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
//            lblEpisodeCount = podcast.resultCount
        }
    }
    
    
}
