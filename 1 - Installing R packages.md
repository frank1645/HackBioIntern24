# R Packages for Cancer Biology
## Introduction
R is an open-source programming language used for statistical computing and graphical presentations. It is a particularly great resource in cancer biology
where it is used for complex data analysis and visualization. 

## Installing packages in R
Installing packages in R is very simple. Use the `install.packages()` function to download and install the package from CRAN. For example:

`install.packages("ggplot2") `

This command installs the _ggplot2_ package for data visualization. Once installed, the package can be loaded with the `library()` function:

`library(ggplot2)`

## Packages in Cancer Research
### Bioconductor
In cancer research, R packages are invaluable for analyzing large datasets, visualizing complex data, and performing statistical tests. 
One such package is `Bioconductor`, which is a repository of tools specifically designed for bioinformatics and computational biology.  
Within `Bioconductor`, packages like `edgeR`, `TCGAbiolinks` and `limma` are widely used to analyze gene expression data. For example, in a study published in BMC, researchers used `edgeR` to analyze gene expression in breast cancer samples, leading to the identification of potential therapeutic targets. `TCGAbiolinks` allows users to search, download and perform integrative analyses from The Cancer Genome Atlas. 

### Survival
The `survival` package is essential for conducting survival analysis of cancer patients. It implements techniques such as Kaplan-Meier curves and Cox proportional hazards models to evaluate time-to-event data (e.g. recurrence, progression of disease). One study utilized the survival R package to analyze time-series survival data of patients with hepatocellular carcinoma. 

### maftools
`maftools` is designed for analyzing and visualizing mutation annotation format (MAF) files. `maftools` was utilized in a study of colorectal cancer to visualized mutation frequencies, identifying driver mutations and comparing mutation patterns between patients.


## Conclusion
Installing R packages is a quick and easy process. To begin, retrieve packages from CRAN using the `install.packages()` function, then load them using the `library()` function.

## References
1. Herschkowitz, J.I., Simin, K., Weigman, V.J. et al. Identification of conserved gene expression features between murine mammary carcinoma models and human breast tumors. Genome Biol 8, R76 (2007). https://doi.org/10.1186/gb-2007-8-5-r76
2. Antonio Colaprico, Tiago C. Silva, Catharina Olsen, Luciano Garofano, Claudia Cava, Davide Garolini, Thais S. Sabedot, Tathiane M. Malta, Stefano M. Pagnotta, Isabella Castiglioni, Michele Ceccarelli, Gianluca Bontempi, Houtan Noushmehr, TCGAbiolinks: an R/Bioconductor package for integrative analysis of TCGA data, Nucleic Acids Research, Volume 44, Issue 8, 5 May 2016, Page e71, https://doi.org/10.1093/nar/gkv1507 
3. Yang Z, Yang Y, Zhou G, Luo Y, Yang W, Zhou Y, Yang J. The Prediction of Survival in Hepatocellular Carcinoma Based on A Four Long Non-coding RNAs Expression Signature. J Cancer. 2020 Apr 12;11(14):4132-4144. doi: 10.7150/jca.40621. PMID: 32368296; PMCID: PMC7196252.
4. Mayakonda A, Lin DC, Assenov Y, Plass C, Koeffler HP. Maftools: efficient and comprehensive analysis of somatic variants in cancer. Genome Res. 2018 Nov;28(11):1747-1756. doi: 10.1101/gr.239244.118. Epub 2018 Oct 19. PMID: 30341162; PMCID: PMC6211645.




