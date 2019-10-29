install.packages('psych')
install.packages('tidyverse')
install.packages('Hmisc')

library(psych)
library(tidyverse)
library(Hmisc)

#load data
#Study 1 mean accuracy data from Brady et al. 2019 can be downloaded here:
#https://osf.io/yvnxk/


#locate data
setwd("G:/My Drive/...")

#read data
data <- read_csv('p_plot.csv')

#make a dotplot that shows distribution + mean and error bars
data %>% ggplot(aes(x = Lag, y = T2_Acc, fill = Word_Type))+
  geom_dotplot(stackdir = "center",
               binaxis = "y",
               position = position_dodge(width=1),
               dotsize = 0.4,
               alpha=.5)+
  stat_summary(fun.data = "mean_cl_boot", geom = "crossbar", 
               position = position_dodge(width=1),
               size=.5, width=.7, alpha=.5) +
  labs(x='Lag Phase', y="T2 Accuracy") +    
  scale_fill_manual(name ="Word Type", labels = c("Emotional", "Moral", "Moral-emotoinal", "Neutral"),
                    values=c('blue4', 'red4', 'green4', 'gray89')) +
  theme_bw() +
  theme(text=element_text(size = 15, face = 'bold')) +
  theme(panel.border = element_blank()) +
  geom_hline(yintercept=.50, linetype="dashed", color = "gray30") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#save hi-res
ggsave('Fig. 4.png', width=8, height=5, unit='in', dpi=320)