//
//  APIService.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 25/07/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    // Singleton
    static let shareInstance = APIService()
    
    func fetchPodcast(with searchText : String, completionHandler:@escaping ([Podcast]) -> ()) {
        
        let dicParameters : Dictionary = ["term": searchText, "media": "podcast"]
        // CREATE RESPONSE SERVICE TO HTTP REQUEST
        
        
        Alamofire.request(baseiTunesSearchURL, method: .get, parameters: dicParameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let error = dataResponse.error{
                print("Failed to contact to iTunes", error)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do{
                // Decodable external representantion with struct SearchResult
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completionHandler(searchResult.results)
                
            }catch let decodeErr{
                print("Faild to decoder", decodeErr)
            }
            
            
        }
        
        
        
    }
    
    struct SearchResult: Decodable{
        let resultCount: Int
        let results: [Podcast]
    }
    
    
    
}
