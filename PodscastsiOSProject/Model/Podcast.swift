//
//  Podcast.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 21/07/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation


struct Podcast: Decodable {
    
    var trackName : String?
    var artistName : String?
    var artworkUrl600 : String?
    var trackCount : Int?
    var feedUrl : String?
}



