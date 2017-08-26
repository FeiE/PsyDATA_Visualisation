# Stats & Visualisation

## Table of contents ##
- [Statistics](#statistics) 
  - [bootstrap](#bootstrap) 
  - [permutation](#permutation)
- [Results visualisation](#results-visualisation) 


## Statistics ##
### bootstrap
  - Bootstrap technique is used to create confidence intervals, with 1000 samples.

### permutation
  - To determine statistical significance we apply a permutation approach. we use the method of maximum statistics to addresse the problem of multiple comparisons. In detail, We perform for example [MI calculation](https://github.com/FeiE/Bubbles) over all sensors and time points 1000 times, randomly permuting the stimulus class labels each time. We then take the maximum MI across electrodes of interest and time points as a permutation distribution and compared the real MI curves against the 95th percentile of this distribution.

## Results visualisation ##
### one to one 
  - The coloured disks show the group medians with their 95% CI. The black scatterplot shows the distribution of individual differences (upright - inverted) of maximum MI and the group median with 95% CI

<img src="/ss_compare.png" alt="" width="400">



### multiple ###

<img src="/ss.png" alt="" width="400">

  - Coloured disks and circles indicate the conditions. Left: the coloured diskes with lines show group medians. The vertical black bars indicate the 95% confidence intervals per each condition. Right: the coloured circles show individual results, with participants numbered from 1 to 24. 
  

<img src="/matrix_comparison.png" alt="" width="600">

  - In each panel, scatterplot in grey background shows the distribution of individual value (colour-coded cirlcle), separately for each condition. The coloured disks show the group medians with their 95% confidence intervals that are also detailed in the top. Each scatterplot in white background shows the distribution of individual differences between pairs from face conditions and group results. Italic numbers above the x-axis show how many participant had stronger effects, and the number of participant that had opposite effects are placed below.

### time course of pairwise differences ###

<img src="/timecourse_of_pairwisediff.png" alt="" width="600">

  - The red horizontal bar right above the x-axis indicates periods of statistically significant group differences. Individual significant differences computed using permutation analyses are indicated in horizontal colour-coded bars. These bars above and below the x-axis show the direction of effects. 


