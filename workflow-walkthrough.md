# Create and load image in iOS from data service response

##  Load and catching image with  SDWebImage framework

![imagen](../master/assets/SDWebImageLogo.png)  
A link:  
[SDWebImage](https://github.com/rs/SDWebImage)  

This library provides an async image downloader with cache support. For convenience, 
we added categories for UI elements like UIImageView, UIButton, MKAnnotationView  

### Steps
1. Go to podfile and add de SDWebImage pod  
2. `import SDWebImage` extension for UIView  
3. Set the image wtih methos `imgPodcast.sd_setImage(with: url, completed: nil)` 
4. go to Network  and test the activity  (check the differents networking activity)

**Custom the `UITableView` when no exist any podcast object  (figure 2)**
1. Use `viewForHeaderInSection` UITableView method to set a label
2. `heightForHeaderInSection` to set the size (label description)
3. Remove horizontal lines  `UITableView.tableFooterView = UIView()`  
4. labels properties : `font =  UIFont.systemFont()`, `TextAlignment = .center`

What the different between `URLSession` and SDWebImage framework?  

SDWebImage: Not load more data use catching  
URLSession: Network activity, no catching the image  

![imagen](../master/assets/figure2.png)  

![imagen](../master/assets/SDWebImage.png)  

