# PsyDATA Visualisation

## Table of contents ##
- [Group and Individual results visualisation](#group-and-individual-results-visualisation) 
- [Stats](#stats)


## Group and Individual results visualisation ##


### one manipulation ###

<img src="/ss_compare.png" alt="" width="400">

  - The coloured disks show the group medians with their 95% confidence intervals. The black scatterplot shows the distribution of individual differences and their group results.


### multiple manipulations ###

<img src="/ss.png" alt="" width="800">

  - Coloured disks and circles indicate different conditions. Left: the coloured diskes show the group medians per each condition. The vertical black bars indicate the 95% confidence intervals. Right: the coloured circles show individual results, with participants numbered from 1 to 24. 
  

<img src="/matrix_comparison.png" alt="" width="600">

  - In each panel, scatterplot in grey background shows the distribution of individual value (colour-coded cirlcle) for each condition. The coloured disks show the group medians with their 95% confidence intervals that are also detailed in the top. Each scatterplot in white background shows the distribution of individual differences between pairs from conditions and their group results. Italic numbers above the x-axis show how many participant had stronger effects, and the numbers below show opposite effects.

### time course of pairwise differences ###

<img src="/timecourse_pairwisediff.png" alt="" width="500">

  - Top: the drak grey curve shows the mean of differences between conditions. The shaded area shows the 95% bootstrap confidence intervals. The red horizontal bar indicates periods of statistically significant group differences. Bottom: Individual significant differences computed using permutation analyses are indicated in horizontal colour-coded bars. These bars above and below the x-axis show the direction of effects. ❗️❗️❗️❗️❗️ Group effects can be observed ~ 50 - 80 ms. HOWEVER, statistical analyses of single participant revealed null effects in every participant. Group analyses might hide inter-participant variability (Rousselet, 2011; Rousselet & Pernet, 2011), so Group analyses should be provided in conjunction with single participant results. 


## Stats ##
   - *Bootstrap technique is used to create confidence intervals, with 1000 samples.*

   - *Permutation approach coupled with the method of maximum statisticsis are applied to achieve multiple comparison correction over time points and electrdoes (Holmes et al. 1996). In detail, We perform for example [MI calculation](https://github.com/FeiE/Bubbles) over all sensors and time points 1000 times, randomly permuting the stimulus class labels each time. We then take the maximum MI across electrodes of interest and time points as a permutation distribution and compared the real MI curves against the 95th percentile of this distribution.*
  
