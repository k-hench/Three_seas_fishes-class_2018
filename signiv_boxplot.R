setwd('~/Desktop/R_bocas18_fishes/')
source('pieMap/functions.R')
data <- data.frame(x=rep(1:8,each=5),
                   y=rep(1:8,each=5)+rnorm(40), 
                   gr=rep(letters[1:8],each=5))


ggplot(data,aes(x=x,y=y,fill=gr))+geom_boxplot()+
  geom_signif(comparisons = list(c(1, 3),c(4,6)),y_position = 8,
              map_signif_level=TRUE)+
  scale_fill_viridis_d()+
  theme_ipsum(base_family = "Arial",plot_margin = unit(c(5,5,5,5),'pt'))
ggsave('~/Desktop/test.pdf',width=5,height=7,device=cairo_pdf)
#### 
dat2 <- expand.grid(x=1:20,y=1:20) %>% mutate(z = rnorm(1)+x*y)
ggplot(dat2,aes(x=x,y=y,fill=z))+geom_tile()+
  coord_equal()+
  scale_fill_viridis_c()+
  theme_ipsum(grid = F,plot_margin = unit(c(5,5,5,5),'pt'))
ggsave('~/Desktop/test.pdf',width=6,height=5,device=cairo_pdf)
