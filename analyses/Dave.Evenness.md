Dave’s Evenness Paper
================
Riley M. Anderson & Diego Rincon
November 30, 2023

  

- [Overview](#overview)
  - [Summary of Results](#summary-of-results)
- [Diego’s model with poisson pdf](#diegos-model-with-poisson-pdf)
  - [Riley’s model](#rileys-model)
- [Model](#model)
  - [Session Information](#session-information)

## Overview

What is this analysis about?

### Summary of Results

- 

<!-- -->

    Maximum likelihood estimation

    Call:
    mle2(minuslogl = LL1, start = list(mb = 0.5, p0 = 0.1, p1 = 0.3, 
        p2 = 0.3, p3 = 0.3, a1 = 0.001, a2 = 0.001, a3 = 0.001), 
        method = "Nelder-Mead", data = list(x1 = alleven$Sc, x2 = alleven$Hm, 
            x3 = alleven$Bb, resp = alleven$Alive, initial = rep(10, 
                80)))

    Coefficients:
          Estimate  Std. Error z value     Pr(z)    
    mb  0.67861408  0.05523128 12.2868 < 2.2e-16 ***
    p0 -0.02444160  0.15522236 -0.1575 0.8748809    
    p1  0.33297737  0.11578693  2.8758 0.0040303 ** 
    p2  0.53488239  0.14450792  3.7014 0.0002144 ***
    p3  0.22368050  0.11638913  1.9218 0.0546267 .  
    a1  0.00365661  0.00245536  1.4892 0.1364259    
    a2  0.00042133  0.00033432  1.2602 0.2075873    
    a3  0.00280862  0.00282176  0.9953 0.3195695    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    -2 log L: 334.7401 

# Diego’s model with poisson pdf

This works with the boundaries in estimation

    ## Maximum likelihood estimation
    ## 
    ## Call:
    ## mle2(minuslogl = LL2, start = list(mb = 0.5, p0 = 0, p1 = 1, 
    ##     p2 = 1, p3 = 1, a1 = 0.001, a2 = 0.001, a3 = 0.001), method = "L-BFGS-B", 
    ##     data = list(x1 = alleven$Sc, x2 = alleven$Hm, x3 = alleven$Bb, 
    ##         resp = alleven$Alive, initial = rep(10, 80)), lower = list(p0 = 0, 
    ##         p1 = 0, p2 = 0, p3 = 0), upper = list(p0 = 10, p1 = 10, 
    ##         p2 = 10, p3 = 10))
    ## 
    ## Coefficients:
    ##      Estimate Std. Error z value   Pr(z)  
    ## mb 1.22014052 1.15731382  1.0543 0.29175  
    ## p0 0.75654268 0.84381816  0.8966 0.36995  
    ## p1 1.68127278 2.55392381  0.6583 0.51034  
    ## p2 1.68127278 2.55392381  0.6583 0.51034  
    ## p3 1.68127278 2.55392381  0.6583 0.51034  
    ## a1 0.00175424 0.00093185  1.8825 0.05976 .
    ## a2 0.00175424 0.00093185  1.8825 0.05976 .
    ## a3 0.00175424 0.00093185  1.8825 0.05976 .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## -2 log L: 323.182

## Riley’s model

This is not likely to be useful, it was more of a learning exercise to
understand the nls model features. The main problem is that this model
assumes the exponential regression coefficient is constant across each
species.

# Model

A negative exponential model with variable asymptote:

![y(t)=ae^{-bt}+cx](https://latex.codecogs.com/png.latex?y%28t%29%3Dae%5E%7B-bt%7D%2Bcx "y(t)=ae^{-bt}+cx")

## Session Information

    R version 4.2.3 (2023-03-15 ucrt)
    Platform: x86_64-w64-mingw32/x64 (64-bit)
    Running under: Windows 10 x64 (build 19045)

    Matrix products: default

    locale:
    [1] LC_COLLATE=English_United States.utf8 
    [2] LC_CTYPE=English_United States.utf8   
    [3] LC_MONETARY=English_United States.utf8
    [4] LC_NUMERIC=C                          
    [5] LC_TIME=English_United States.utf8    

    attached base packages:
    [1] stats4    stats     graphics  grDevices utils     datasets  methods  
    [8] base     

    other attached packages:
     [1] bbmle_1.0.25        nls.multstart_1.3.0 cowplot_1.1.1      
     [4] lubridate_1.9.2     forcats_1.0.0       stringr_1.5.0      
     [7] dplyr_1.1.1         purrr_1.0.1         readr_2.1.4        
    [10] tidyr_1.3.0         tibble_3.2.1        ggplot2_3.4.1      
    [13] tidyverse_2.0.0    

    loaded via a namespace (and not attached):
     [1] pillar_1.9.0        compiler_4.2.3      tools_4.2.3        
     [4] digest_0.6.31       lattice_0.20-45     timechange_0.2.0   
     [7] evaluate_0.20       lifecycle_1.0.3     gtable_0.3.3       
    [10] pkgconfig_2.0.3     rlang_1.1.0         Matrix_1.6-1       
    [13] cli_3.6.1           rstudioapi_0.14     yaml_2.3.7         
    [16] mvtnorm_1.1-3       xfun_0.38           fastmap_1.1.1      
    [19] withr_2.5.0         knitr_1.42          generics_0.1.3     
    [22] vctrs_0.6.1         hms_1.1.3           rprojroot_2.0.3    
    [25] grid_4.2.3          tidyselect_1.2.0    glue_1.6.2         
    [28] R6_2.5.1            bdsmatrix_1.3-6     fansi_1.0.4        
    [31] rmarkdown_2.21      tzdb_0.3.0          magrittr_2.0.3     
    [34] codetools_0.2-19    MASS_7.3-58.2       scales_1.2.1       
    [37] htmltools_0.5.5     colorspace_2.1-0    numDeriv_2016.8-1.1
    [40] utf8_1.2.3          stringi_1.7.12      munsell_0.5.0      
