# Showing episode controller

##  Showing episode controller

![imagen](../feature-showingEpisodeController/assets/sketch1.gif)  

### Steps
1. Use a ternary operator to control the size heightForHeaderInSection return `self.arrPodcasts.count > 0 ?0:250`  
2. Process to create and load the new `EpisodesViewController class`    
3. Present the EpisodioVC  with `navigationController?.pushViewController()` method   
4. if you have problem with navigation Controller programatically or the title in the navigationItem does 
not appers you can use `self.definesPresentationContext = true` **figure1**  

![imagen](../feature-showingEpisodeController/assets/figure1.png)  


