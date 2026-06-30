## Org file conversion to html
command run: emacs alspac_omics_data_catalogue.org --batch -f org-html-export-to-html -kill

## changes
06/05/2025 removed:
```{org}
** DNA methylation - 450k - G0 mothers + G1 (dnam_450_g0m_g1)

*** Description
This dataset contains Illumina Infinium HumanMethylation450K BeadChip array on G1 mothers at two timepoints (pregnancy and middle age), G1 participants at 5 timepoints and G0 participants at three timepoints (birth, childhood and adolescence).

This dataset was generated as part of the Accessible Resource for Integrated Epigenomics Studies (http://www.ariesepigenomics.org.uk/). This dataset is superseded by dnam_epic450_g0_g1.

*** Methodology
Associated publication: 
- https://doi.org/10.1093/ije/dyv072

Associated R package: 
- https://github.com/MRCIEU/aries

*** Freeze Docs
#+INCLUDE: "/mnt/storage/private/alspacdata/omics_data_catalogue/omics_documentation/dev_docs/freezes/dnam_450_g0m_g1_2016-05-03_f4.yaml" src
```

07/05/2026 removed:
```{markdown}
## Genome-wide - HapMap2 imputed - G1 (gi_hapmap2_g1)

### Description
This dataset contains genotype data imputed to HapMap 2 for G1.<br>
Reference genome build: `GRCh36`

### Methodology
A total of 9912 subjects were genotyped using the Illumina HumanHap550 quad genome-wide SNP genotyping platform by 23 and Me subcontracting the Wellcome Trust Sanger Institute, Cambridge, UK and the Laboratory Corporation of America, Burlington, NC, USA. 

Individuals were excluded from further analysis on the basis of having incorrect gender assignments; minimal or excessive heterozygosity (<0.320 and >0.345 for the Sanger data and <0.310 and >0.330 for the LabCorp data); disproportionate levels of individual missingness (>3%); evidence of cryptic relatedness (>10% IBD) and being of non-European ancestry (as detected by a multidimensional scaling analysis seeded with HapMap 2 individuals, EIGENSTRAT analysis revealed no additional obvious population stratification and genome-wide analyses with other phenotypes indicate a low lambda). The resulting data set consisted of 8365 individuals (84% of those genotyped). 

SNPs with a minor allele frequency of <1% and call rate of <95% were removed. Furthermore, only SNPs which passed an exact test of Hardy-Weinberg equilibrium (P > 5 x 10-7) were considered for analysis. Genotypes were subsequently imputed with MACH 1.0.16 Markov Chain Haplotyping software, using CEPH individuals from phase 2 of the HapMap project as a reference set (release 22). 

Associated publication:<br> 
- https://doi.org/10.1093/hmg/ddr309

### Freeze Docs
<!-- ```yaml
@include freezes/gi_hapmap2_g1_2022-12-07_f7.yaml
``` -->

## Genome-wide - HapMap2 imputed - G0 mothers (gi_hapmap2_g0m)

### Description
This dataset contains genotype data imputed to HapMap 2 for G0 mothers.<br>
Reference genome build: `GRCh36`

### Methodology
A total of 10 015 women (mothers from the ALSPAC cohort) were genotyped using the Illumina 660 quad SNP chip which contains 557 124 SNP markers. Markers with minor allele frequency < 1%, SNPs with >5% missing genotypes and any markers that failed an exact test of Hardy-Weinberg equilibrium (P < 1 x 10-6) were excluded from further analyses. Genome-wide identity by state sharing was calculated for each pair of individuals in the cohort to identify cryptic relatedness.

In order to identify individuals who might have ancestries other than Western European, we merged data from both cohorts with the 60 western European (CEU) founder, 60 Nigerian (YRI) founder and 90 Japanese (JPT) and Han Chinese (CHB) individuals from the International HapMap Project. Genome-wide IBS distances for each pair of individuals were calculated on markers shared between the HapMap and the Illumina 660K SNP chip, and then the multidimensional scaling option in R was used to generate a two-dimensional plot based upon individuals' scores on the first two principal coordinates from this analysis. Samples that did not cluster with the CEU individuals were excluded from subsequent analyses. In addition, we plotted the proportion of missing data for each individual against their genome-wide heterozygosity. Any individual, who did not cluster with others, was removed from further analyses. Samples were also excluded from analyses in the case of excessive missingness (>5%), unusual genome-wide or X chromosome heterozygosity, as well as one individual from each pair of putatively related individuals (genome-wide IBD >10%). After data cleaning, 8340 individuals and 526688 SNPs were left in the genome-wide data set.

We then conducted imputation using the MACH Markov Chain Haplotyping software with CEU individuals from phase 2 of the HapMap project as a reference set (release 22). The final imputed data set consisted of 8340 individuals, each with 2 594 390 imputed markers. Only imputed genotypes with minor allele frequencies ≥1% and R-sqr ≥0.3 were considered for association. Of these 8340 with genetic data, 2874 mothers also had phenotype data available. 

Associated publication:<br> 
- https://doi.org/10.1093/hmg/ddt239

### Freeze Docs
<!-- ```yaml
@include freezes/gi_hapmap2_g0m_2022-12-07_f7.yaml
``` -->
```

### Sections removed 19/11/2025:
- `Cryptic relatedness was measured as proportion of identity by descent (IBD > 0.1). Related subjects were removed.` gwa_550_g1 methodology
- `Cryptic relatedness was measured as proportion of identity by descent (IBD > 0.1). ` gi_hrc_g0m_g1 methodology
- `Cryptic relatedness was assessed using a IBD estimate of more than 0.125 which is expected to correspond to roughly 12.5% alleles shared IBD or a relatedness at the first cousin level. Related subjects that passed all other quality control thresholds were retained during subsequent phasing and imputation.` gi_hrc_g0m_g1, gi_1000g_g0m_g1, gi_topmed_g0m_g1 methodology
- `Cryptic relatedness was measured as proportion of identity by descent (IBD > 0.1). Related subjects that passed all other quality control thresholds were retained during subsequent phasing and imputation.` gi_1000g_g0m_g1 methodology


sections added April/May 2026 (freeze 7 preparation): 
- added metabolomics & proteomics sections (including table)
- change freeze timings to freeze changes section
- removed hapmap datasets
- Added gi_topmed_g0p

### 24/06/2026 
- Freeze 7 creation
- updated WGS dataset methodology to be more descriptive, following the release docs
- updated gwa_550_g1 dataset to include that relateds were removed in methodology, as prev this was missed in the release. 


## Markdown equivalent
Testing converting .org to .md file so it is easier to update in the future. 
`alspac_omics_data_catalogue.md` is the working attempt with this. 

requires `pandoc-include` to be installed via pip, in mamba/conda env as example. This is in `standard` env. 

To generate the html file, from the markdown file, run:
```{bash}
pandoc alspac_omics_data_catalogue.md \
-o alspac_omics_data_catalogue.html \
--standalone \
--toc \
--toc-depth=3 \
--template=styles/pico-template.html \
--highlight-style=pygments \
--lua-filter=styles/include_everywhere.lua \
--embed-resources
```
 to get the header image to display
 

