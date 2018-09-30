# Showing episode controller


## 2. Parsing RSS XML Feed with FeedKit
[LBTA](https://www.letsbuildthatapp.com/course_video?id=2532)  

**library through Cocoapods to quickly and easily parse XML into usable Swift objects**  

![imagen](../feature-Podcast-Episodes/assets/parsingRSSXMl.gif)  

### Steps
1. Install pod feedKit version `pod 'FeedKit', '~> 7.0.1'` 
[FeedKit](https://github.com/nmdias/FeedKit)  

2.  Fetch Episode : `import FeedKit`, create the url with string, user the parse method    
3. Add the new item in the array of Episode 
4. Reload TableView in the main thread  

**NOTE:** CHANGE HTTP TO HTTPS OHTER WAY TO READ HTTP DOMAINS  `let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")`  

```swift 
import FeedKit  // 1. Import XML parser cocoa pods


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
```


##  1. Showing episode controller

![imagen](../feature-showingEpisodeController/assets/sketch1.gif)  

### Steps
1. Use a ternary operator to control the size heightForHeaderInSection return `self.arrPodcasts.count > 0 ?0:250`  
2. Process to create and load the new `EpisodesViewController class`    
3. Present the EpisodioVC  with `navigationController?.pushViewController()` method   
4. if you have problem with navigation Controller programatically or the title in the navigationItem does 
not appers you can use `self.definesPresentationContext = true` **figure1**  

![imagen](../feature-showingEpisodeController/assets/figure1.png)  


