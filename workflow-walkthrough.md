# Create and load image in iOS from service response

##  Load and catching image without SDWebImage (Original form)


### Steps

1. change the object model (podcast) to set the image property  
2. ATS App Transport Security for http domains add in `info.plist` (figure 1)  
3. Load image without SDWebImage (pod) in `PodcastCelll.xib` (use `URLSession`)  
4. construct the image with data response service and embed in the main thread  
when load and show the image (`DispatchQueue.main.async`)  
5. **IMPORTANT**: This method always load the image, never caching in the app  

Figure 1 
```swift
    // in info.plist Add in source code for ATS http domains
    
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSExceptionDomains</key>
        <dict>
            <key>mzstatic.com</key>
            <dict>
                <key>NSExceptionAllowsInsecureHTTPLoads</key>
                <true/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
        </dict>
    </dict>
```

![imagen](../master/assets/sketch.png)
