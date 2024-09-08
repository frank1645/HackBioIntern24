# Literature Review -  TCGAplot: An R package for Integrative Pan-Cancer Analysis and Visualization of Multi-Omics Data
Authors - Liao, C., Wang, X.

## Introduction

Pan-cancer analysis seeks to identify comparison and differences among various tumor types by analyzing large genomic datasets. The Cancer Genome Atlas (TCGA) has significantly contributed to this by offering comprehensive multi-omics data for 33 cancer types. Various web-based servers and R packages i.e. TCGAbiolinks,GEPIA2 and TIMER2.0 have been developed to explore TCGA data, but many are limited in functionality, focusing on specific data types or lacking user-defined customization features. This study introduces TCGAplot, an R package designed to address these limitations by enabling comprehensive pan-cancer analysis and visualization of multi-omics data, including gene expression, tumor mutational burden (TMB), microsatellite instability (MSI), tumor immune microenvironment (TIME), and promoter methylation.

## Methods
The authors implemented the TCGAplot R package with integrated built-in TCGA data to facilitate multiple types of pan-cancer analysis. This package allows for:
- Paired/unpaired differential gene expression analysis across 33 cancer types.
- Correlation analysis between gene expression and TMB, MSI, TIME, and promoter methylation.
- Visualization options such as boxplots, ROC curves, survival plots, heatmaps, radar charts, and forest plots.

The data used in the package were sourced from various TCGA repositories and processed using established R packages like TCGAbiolinks, cBioPortal, and others. Several functions are included for users to perform gene-specific and gene-set-specific analyses and to extract TCGA data for custom analyses.

## Results and Discussion
The package was tested for its ability to handle several types of analyses:

1. *Pan-Cancer Expression Analysis*: This analysis can be performed on both tumor and normal tissue samples across 33 cancer types. The functions allow the user to visualize differential gene expression with statistical significance.
   
2. *Correlation Analysis*: The authors demonstrated how gene expression could be correlated with TMB, MSI, and immune-related markers. For example, the transcription factor KLF7 showed varying correlation with TMB and MSI across different cancer types, which could have implications for understanding immune evasion mechanisms.

3. *Survival Analysis*: TCGAplot also supports survival analysis using the Cox regression model. This is essential for identifying gene expressions associated with better or worse clinical outcomes. KLF7 was shown to be a risk factor in Head & Neck Squamous cell carcinoma (HNSC) and Brain Lower Grade Glioma (LGG) while acting as a protective factor in Kidney Renal Clear Cell Carcinoma (KIRC) and Rectum Adenocarcinoma (READ).

4. *Cancer-Type-Specific Analysis*: The package extends its functionality to more specific analyses within individual cancer types. These include correlation between gene expression and immune infiltration or diagnostic capabilities, as shown by ROC curves for various cancers.

The authors discuss the versatility of the package in integrating and analyzing multiple data types. However, some limitations remain, particularly in terms of processing speed with large datasets and the need for users to have a basic understanding of R.

## Conclusion
TCGAplot fills a significant gap in the field by providing an all-in-one tool for pan-cancer analysis of multi-omics data. It stands out by allowing user-defined functions for more customized research and detailed correlation analysis. The package is freely available on [GitHub](https://github.com/tjhwangxiong/TCGAplot), and includes comprehensive built-in data for ease of use.

---

## Current Knowledge and Research Gaps
While significant progress has been made in pan-cancer analysis using multi-omics data, limitations in existing tools, particularly in their scope and customizability, have hindered comprehensive studies. TCGAplot addresses some of these gaps by offering integrated analysis across various dimensions of cancer biology. However, gaps remain in processing efficiency for large-scale datasets and in extending analyses to new omics technologies.

## Questions for Further Research
1. How can the computational efficiency of TCGAplot be improved for large datasets?
2. What novel insights into cancer biology can be gained from integrating additional omics layers (e.g., metabolomics or single-cell sequencing) into TCGAplot?
3. Can the package be extended to incorporate machine learning approaches for predicting patient outcomes?

## References
Liao, C., Wang, X. TCGAplot: an R package for integrative pan-cancer analysis and visualization of TCGA multi-omics data. BMC Bioinformatics 24, 483 (2023). https://doi.org/10.1186/s12859-023-05615-3

