<p align="right">
-- back to [main](R_stuff.html) --
</p>
Here, we plot box plots with significance codes using the packages
**ggplot2** (included in **tidyverse**), **ggsignif**. and
\***hrbrthemes**.

To start our **R** session we have to **load the required R packages**
and set up our working environment:

    setwd('~/Desktop/R_bocas18_fishes/')
    library(tidyverse)
    library(ggsignif)
    library(hrbrthemes)
    source('pieMap/functions.R')

Than we create the fake data...

    data <- data.frame(x=rep(1:8,each=5),
                       y=rep(1:8,each=5)+rnorm(40), 
                       gr=rep(letters[1:8],each=5))

...and plot it.

    # initializing the plot
    ggplot(data,aes(x=x,y=y,fill=gr))+
      # adding the boxplots
      geom_boxplot()+
      # adding selected significance codes
      geom_signif(comparisons = list(c(1, 3),c(4,6)),y_position = 8,
                  map_signif_level=TRUE)+
      # add title and subtitle
      ggtitle("boxplots",subtitle = 'including significance codes')+
      # choose color map (from the hrbrthemes package)
      scale_fill_viridis_d()+
      # change the overall plot layout (from the hrbrthemes package)
      theme_ipsum(base_family = "Arial",
                  plot_margin = unit(c(5,5,5,5),'pt'),
                  axis_title_face = 'bold')

<img src="signiv_boxplot_files/figure-markdown_strict/unnamed-chunk-3-1.png" width="90%" style="display: block; margin: auto;" />
