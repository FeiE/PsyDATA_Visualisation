# PsyDATA Visualisation

## Table of contents ##
- [Group and Individual results visualisation](#group-and-individual-results-visualisation) 
- [Stats](#stats)


## Group and Individual results visualisation ##


### one manipulation ###

<img src="/ss_compare.png" alt="" width="400">

  - The coloured disks show the group medians with their 95% confidence intervals. The black scatterplot shows the distribution of individual differences and the group results.


### multiple manipulations ###

<img src="/ss.png" alt="" width="800">

  - Coloured disks and circles indicate different conditions. Left: the coloured diskes show group medians per each condition. The vertical black bars indicate the 95% confidence intervals. Right: the coloured circles show individual results, with participants numbered from 1 to 24. 
  

<img src="/matrix_comparison.png" alt="" width="600">

  - In each panel, scatterplot in grey background shows the distribution of individual value (colour-coded cirlcle), separately for each condition. The coloured disks show the group medians with their 95% confidence intervals that are also detailed in the top. Each scatterplot in white background shows the distribution of individual differences between pairs from conditions and group results. Italic numbers above the x-axis show how many participant had stronger effects, and the number of participant that had opposite effects are placed below.

### time course of pairwise differences ###

<img src="/timecourse_pairwisediff.png" alt="" width="500">

  - Top: the light grey curves with shade show the mean of differences between pairs from face conditions. The shaded areas show the 95% confidence intervals. The red horizontal bar right above the x-axis indicates periods of statistically significant group differences. Bottom: Individual significant differences computed using permutation analyses are indicated in horizontal colour-coded bars. These bars above and below the x-axis show the direction of effects. 


## Stats ##
   - *Bootstrap technique is used to create confidence intervals, with 1000 samples.*

   - *Permutation approach is applied to determine statistical significance. We use the method of maximum statistics to addresse the problem of multiple comparisons (Holmes et al. 1996). In detail, We perform for example [MI calculation](https://github.com/FeiE/Bubbles) over all sensors and time points 1000 times, randomly permuting the stimulus class labels each time. We then take the maximum MI across electrodes of interest and time points as a permutation distribution and compared the real MI curves against the 95th percentile of this distribution.*
  
