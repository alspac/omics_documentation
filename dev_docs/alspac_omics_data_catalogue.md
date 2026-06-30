---
title: "ALSPAC OMICs Data Catalogue"
author: "ALSPAC Omics team"
header-image: "styles/logo.png"
---

# Introduction
Welcome to the ALSPAC Omics Catalogue, a guide to the omics data offered by ALSPAC. This catalogue features a variety of named ALSPAC datasets, each consisting of collected or produced data that has been organized, named, and curated for ease of use. Every named ALSPAC dataset comes with accompanying metadata that provides information about the dataset as a whole. Each named ALSPAC dataset has at least one release version that includes a curated selection of files detailed in the metadata sections.

Please note that these datasets are not generally accessible. Please see http://www.bristol.ac.uk/alspac/researchers/access/ for details for access. 

The information within this catalogue is made available for browsing to help both internal ALSPAC users and external researchers understand the data and facilitate prospective data requests.

For external collaborators we offer as standard "freezes" of specific named ALSPAC datasets. These freezes, along with their metadata, are outlined in this catalogue. External collaborators will be granted access to these freezes upon request approval. A freeze represents a carefully selected subset of data files within a version, containing the core data from a dataset with withdrawn consent removed and specific dataset IDs applied. These freezes are subject to periodic updates. 

Documentation for the current freeze is in the form of a yaml file is present below, listing the files external collaborators will receive, accompanied by metadata.

Due to the removal of withdrawn individuals from the freezes, please note that the number of participants within each dataset may change over time and may not match those found in the Methodology fields. 

## Freeze information: <br>
| Number | Timing               | Updates                        |
|-       |-                     |-                               |
|1       |July 2021 - Dec 2022  | Updated to using the freeze release system. |
|2       |Dec 2022 - Dec 2023   | Dataset added: `dnam_epic450_g0_g1`. Update freeze 2.1 fixed truncated bgen issue in HRC dataset. |
|3       |Jan 2023 - Oct 2024   | |
|4       |Oct 2024 - June 2025  | Datasets added: `wes_novaseq_g0_g1`, `wes_novaseq_g1`|
|5       |June 2025 - Dec 2025  | Dataset removed: `dnam_450_g0m_g1`. Dataset added: `gi_topmed_g0m_g1`. |
|6       |Dec 2025 - June 2026  | Dataset `dnam_epic450_g0_g1` has QC reports integrated into the freeze dataset. Dataset `gi_topmed_g0m_g1` now filters out monomorphic SNPs. |
|7       |June 2026 - Current   | Datasets removed: `gi_hapmap2_g0m`, `gi_hapmap2_g1`. Dataset added: `gi_topmed_g0p`. Dataset updated to TOPMed R3: `gi_topmed_g0m_g1`. |

# Genetic Array Data

## Genome-wide - Illumina 550 quad - G1 (gwa_550_g1)

### Description
This dataset contains genome wide array data genotype calls for G1 individuals. <br>
Reference genome build: `GRCh37`

### Methodology
ALSPAC children were genotyped using the Illumina HumanHap550 quad chip genotyping platforms by 23andme subcontracting the Wellcome Trust Sanger Institute, Cambridge, UK and the Laboratory Corporation of America, Burlington, NC, US. The resulting raw genome-wide data were subjected to standard quality control methods. 
Individuals were excluded on the basis of gender mismatches; minimal or excessive heterozygosity; disproportionate levels of individual missingness (>3%) and insufficient sample replication (IBD < 0.8). 

Population stratification was assessed by multidimensional scaling analysis and compared with Hapmap II (release 22) European descent (CEU), Han Chinese, Japanese and Yoruba reference populations; all individuals with non-European ancestry were removed. 

SNPs with a minor allele frequency of < 1%, a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 5E-7) were removed. Cryptic relatedness was measured as proportion of identity by descent (IBD > 0.1). Related subjects were removed.

Associated publication:<br>
- Horikoshi et al 2013 (https://doi.org/10.1038/ng.2477)

### Freeze Docs

```yaml
@include freezes/gwa_550_g1_2022-12-05_f7.yaml
```

## Genome-wide - Illumina exome core array - G0 partners (gwa_exome_g0p)

### Description
This dataset contains genome wide array genotype calls for G0 mothers and partners.<br>
Reference genome build: `GRCh37`

### Methodology
3,453 ALSPAC mother and fathers and 535,478 SNPs were genotyped using the Illumina HumanCoreExome chip genotyping platforms by the ALSPAC lab and called using GenomeStudio. The resulting raw genome-wide data were subjected to standard quality control methods using PLINK (v1.07). Individuals were excluded on the basis of gender mismatches (n = 80); minimal or excessive heterozygosity (n = 64); disproportionate levels of individual missingness (>5%, n = 60) and possible contamination (n = 3). 

Population stratification was assessed by multidimensional scaling analysis and compared with 1000 Genomes phase 3 data and principal component analysis (n = 266); all individuals with non-European ancestry were removed. Cryptic relatedness was measured as SNP relatedness in GCTA (relatedness > 0.1, n = 69 removed). SNPs with a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 1E-7) and those which failed GenomeStudio quality control measures were removed (n = 21,298). 6,594 duplicate SNPs were also removed. This resulted in 2,911 unrelated mothers and father genotypes at 507,586 SNPs. We then identified 2217 samples where aln assigned historically by the lab matched genetically assigned aln. 

1737 putative G0 partner-G1 pairs for whom both G0 partner and G1 have called genotype data available were identified based on ALN. Given the G0 partners were invited by the G0 mother to take part and only enrolled in the study in their own right several years later, it could not be assumed that all G0 partners were biologically related to G1. Called genotype data for the 1720 unique G0 partners and 1737 unique G1s were merged (i.e. there were 17 pairs of siblings/twins among the G1 offspring), using plink v1.90b7.2 64-bit (11 Dec 2023).

After aplication of the plink filters --geno 0.05, --maf 0.01, --snps-only just-acgt and --autosome, 113288 SNPs remained. The --related command in KING version 2.3.2 was used to perform kinship analysis, which confirmed that all 1737 putative G0 partner-G1 pairs are genetically related. This would be expected for biological father-offspring pairs, using the inference criteria described in in Table 1 of "Manichaikul, Ani, et al. "Robust relationship inference in genome-wide association studies." Bioinformatics 26.22 (2010): 2867-2873."

### Freeze Docs

```yaml
@include freezes/gwa_exome_g0p_2016-11-22_f7.yaml
```

## Genome-wide - Illumina 660 quad - G0 mothers (gwa_660_g0m)

### Description 
This dataset contains genome-wide array data including raw files and genotype calls for G0 mothers.<br>
Legacy 1 reference genome: `GRCh36`<br>
Legacy 2 reference genome: `GRCh37`

### Methodology
ALSPAC mothers were genotyped using the Illumina human660W-quad array at Centre National de Génotypage (CNG) and genotypes were called with Illumina GenomeStudio. PLINK (v1.07) was used to carry out quality control measures on an initial set of 10,015 subjects and 557,124 directly genotyped SNPs. 

SNPs were removed if they displayed more than 5% missingness or a Hardy-Weinberg equilibrium P value of less than 1.0e-06. Additionally SNPs with a minor allele frequency of less than 1% were removed. Samples were excluded if they displayed more than 5% missingness, had indeterminate X chromosome heterozygosity or extreme autosomal heterozygosity. Samples showing evidence of population stratification were identified by multidimensional scaling of genome-wide identity by state pairwise distances using the four HapMap populations as a reference, and then excluded. 

Cryptic relatedness was assessed using a IBD estimate of more than 0.125 which is expected to correspond to roughly 12.5% alleles shared IBD or a relatedness at the first cousin level. Related subjects that passed all other quality control thresholds were retained. This resulted in 9,048 subjects and 526,688 SNPs passed these quality control filters.

Associated publication:<br>
- Rietveld et al 2013 (https://doi.org/10.1126%2Fscience.1235488)

### Freeze Docs
```yaml
@include freezes/gwa_660_g0m_2022-12-05_f7.yaml
```

## Genome-wide - CNV - G1 (cnv_550_g1)

### Description
This dataset contains predicted ALSPAC CNVs using PennCNV, generated from 23andMe raw genotype data.

### Methodology
original-cnv:

  LRR and BAF data was missing from the 23andMe raw genotype data, so we had to generate this data ourselves using an in house algorithm. Once this data was generated, we ran PennCNV using the hh550 libraries. 

  There are filtered PennCNV calls. Multiple calls were merged using the `clean_cnv.pl` script, using a merge fraction of 0.5. Individuals with > 30 CNVs, a Log R Ratio SD of >0.3, a BAF drift of > 0.002, and a waviness factor of > 0.05 were removed. CNVs in which at least 50% of the length of the CNV call overlapped with any of telomeric centromeric, immunoglobulin regions were removed using the 'scan_region.pl' script in PennCNV.

  In addition, CNVs covering fewer than 5 probes, of a length < 5kb, and with a confidence score of below 10 were removed. Density was calculated as the number of probes in a CNV divided by the length of the CNV, and CNVs where the density of probes across the call was < 1 probe per 20kb was removed. 

  These QC parameters are suggestions only and provided in filtered.cnv. Analysts can apply their own filter parameters to the raw calls in data.cnv

nd-cnv:

  Full Neurodevelopmental CNV data available within dataset or on request: `docs/nd-cnv/ALSPAC_CNV_protocol.md`. 

  Raw .tab files were generated per individual in the dataset. LRR and BAF were missing from the 23andMe dataset so were generated using in house code at ALSPAC. These files were formatted for input to PennCNV. Gcmodel and pfb files wer generated for use in penncnv using inbuilt `cal_gc_snp.pl` and `compile_pfb.pl` from PennCNV. 

  CNVs were called using PennCNV, CNVs were detected using `detect_cnv.pl`, then multiple calls were merged using the `clean_cnv.pl` and filtered using `filter_cnv.pl` with defaults LRR SD 0.3, BAF drift 0.01, WF 0.05, all chromosomes included, minimum number of SNPs set as 3.

  A final list of ND CNV carriers were derived using custom R code. 

### Freeze Docs
```yaml
@include freezes/cnv_550_g1_2025-05-08_f7.yaml
```

# Imputed Data

## Genome-wide - HRC imputed - G0 mothers + G1 (gi_hrc_g0m_g1)

### Description
This dataset contains genotype data imputed to HRC for G0 mothers and G1.<br>
Reference genome build: `GRCh37`

### Methodology
ALSPAC children were genotyped using the Illumina HumanHap550 quad chip genotyping platforms by 23andme subcontracting the Wellcome Trust Sanger Institute, Cambridge, UK and the Laboratory Corporation of America, Burlington, NC, US. The resulting raw genome-wide data were subjected to standard quality control methods. Individuals were excluded on the basis of gender mismatches; minimal or excessive heterozygosity; disproportionate levels of individual missingness (>3%) and insufficient sample replication (IBD < 0.8). 

Population stratification was assessed by multidimensional scaling analysis and compared with Hapmap II (release 22) European descent (CEU), Han Chinese, Japanese and Yoruba reference populations; all individuals with non-European ancestry were removed. 

SNPs with a minor allele frequency of < 1%, a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 5E-7) were removed. 

Related subjects that passed all other quality control thresholds were retained during subsequent phasing and imputation. 9,115 subjects and 500,527 SNPs passed these quality control filters.

ALSPAC mothers were genotyped using the Illumina human660W-quad array at Centre National de Génotypage (CNG) and genotypes were called with Illumina GenomeStudio. PLINK (v1.07) was used to carry out quality control measures on an initial set of 10,015 subjects and 557,124 directly genotyped SNPs. SNPs were removed if they displayed more than 5% missingness or a Hardy-Weinberg equilibrium P value of less than 1.0e-06. Additionally SNPs with a minor allele frequency of less than 1% were removed. 

Samples were excluded if they displayed more than 5% missingness, had indeterminate X chromosome heterozygosity or extreme autosomal heterozygosity. Samples showing evidence of population stratification were identified by multidimensional scaling of genome-wide identity by state pairwise distances using the four HapMap populations as a reference, and then excluded. 

9,048 subjects and 526,688 SNPs passed these quality control filters.

We combined 477,482 SNP genotypes in common between the sample of mothers and sample of children. We removed SNPs with genotype missingness above 1% due to poor quality (11,396 SNPs removed) and removed a further 321 subjects due to potential ID mismatches. This resulted in a dataset of 17,842 subjects containing 6,305 duos and 465,740 SNPs (112 were removed during liftover and 234 were out of HWE after combination). We estimated haplotypes using ShapeIT (v2.r644) which utilises relatedness during phasing. The phased haplotypes were then imputed to the Haplotype Reference Consortium (HRCr1.1, 2016) panel of approximately 31,000 phased whole genomes. The HRC panel was phased using ShapeIt v2.r727, and the imputation was performed using the Michigan imputation server.

### Freeze Docs
```yaml
@include freezes/gi_hrc_g0m_g1_2017-05-04_f7.yaml
```

## Genome-wide - 1000G imputed - G0 partners (gi_1000g_g0p)

### Description
This dataset contains genome-wide array data imputed to the 1000 genomes reference panel for G0 partners, with some additional G0 mothers and G1 individuals. This data has been cleaned, flipped to the positive strand and in b37 coordinates and imputed to the 1000 genomes phase I version 3.<br>
Reference genome build: `GRCh37`

### Methodology 
3,453 ALSPAC mother and fathers and 535,478 SNPs were genotyped using the Illumina HumanCoreExome chip genotyping platforms by the ALSPAC lab and called using GenomeStudio. The resulting raw genome-wide data were subjected to standard quality control methods using PLINK (v1.07). Individuals were excluded on the basis of gender mismatches (n = 80); minimal or excessive heterozygosity (n = 64); disproportionate levels of individual missingness (>5%, n = 60) and possible contamination (n = 3). 

Population stratification was assessed by multidimensional scaling analysis and compared with 1000 Genomes phase 3 data and principal component analysis (n = 266); all individuals with non-European ancestry were removed. 

Cryptic relatedness was measured as SNP relatedness in GCTA (relatedness > 0.1, n = 69 removed). SNPs with a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 1E-7) and those which failed GenomeStudio quality control measures were removed (n = 21,298). 6,594 duplicate SNPs were also removed. 

This resulted in 2,911 unrelated mothers and father genotypes at 507,586 SNPs. We then identified 2217 samples where aln assigned historically by the lab matched genetically assigned aln. 

We phased data of 3074 samples that passed qc but contained related subjects in shapeit v2.r837. We then removed 155,336 monomorphic SNPs, 1033 markers not in 1000 genomes, 11,842 A/T or G/C SNPs and 10 duplicate sites to give 337,732 SNPs on chromosomes 1-23. Of the 329,363 markers on chromosomes 1-22, 298,742 overlapped the reference genome. We imputed to the 1000 genomes phase 1 version 3 using the Michigan Imputation Server. We then identified 2217 samples where aln assigned historically by the lab matched genetically assigned aln. We then removed 12 subjects who have withdrawn consent and 6 subjects genotyped in an earlier work package to give 2201 subjects.

1737 putative G0 partner-G1 pairs for whom both G0 partner and G1 have called genotype data available were identified based on ALN. Given the G0 partners were invited by the G0 mother to take part and only enrolled in the study in their own right several years later, it could not be assumed that all G0 partners were biologically related to G1. Called genotype data for the 1720 unique G0 partners and 1737 unique G1s were merged (i.e. there were 17 pairs of siblings/twins among the G1 offspring), using plink v1.90b7.2 64-bit (11 Dec 2023).

After aplication of the plink filters --geno 0.05, --maf 0.01, --snps-only just-acgt and --autosome. The --related command in KING version 2.3.2 was used to perform kinship analysis, which confirmed that all 1737 putative G0 partner-G1 pairs are genetically related. This would be expected for biological father-offspring pairs, using the inference criteria described in in Table 1 of "Manichaikul, Ani, et al. "Robust relationship inference in genome-wide association studies." Bioinformatics 26.22 (2010): 2867-2873."

### Freeze Docs
```yaml
@include freezes/gi_1000g_g0p_2016-11-22_f7.yaml
```

## Genome-wide - 1000G imputed - G0 mothers + G1 (gi_1000g_g0m_g1)

### Description
This dataset contains genome-wide 1000G imputed data for G0 mothers + G1. This data has been cleaned, flipped to the positive strand and in b37 coordinates and imputed to the 1000 genomes phase I version 3.<br>
Reference genome build: `GRCh37`

### Methodology 
ALSPAC children were genotyped using the Illumina HumanHap550 quad chip genotyping platforms by 23andme subcontracting the Wellcome Trust Sanger Institute, Cambridge, UK and the Laboratory Corporation of America, Burlington, NC, US. The resulting raw genome-wide data were subjected to standard quality control methods. Individuals were excluded on the basis of gender mismatches; minimal or excessive heterozygosity; disproportionate levels of individual  missingness (>3%) and insufficient sample replication (IBD < 0.8). 

Population stratification was assessed by multidimensional scaling analysis and compared with Hapmap II (release 22) European descent (CEU), Han Chinese, Japanese and Yoruba reference populations; all individuals with non-European ancestry were removed.  

SNPs with a minor allele frequency of < 1%, a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 5E-7) were removed. 9,115 subjects and 500,527 SNPs passed these quality control filters.

ALSPAC mothers were genotyped using the Illumina human660W-quad array at Centre National de Génotypage (CNG) and genotypes were called with Illumina GenomeStudio. PLINK (v1.07) was used to carry out quality control measures on an initial set of 10,015 subjects and 557,124 directly genotyped SNPs. SNPs were removed if they displayed more than 5% missingness or a Hardy-Weinberg equilibrium P value of less than 1.0e-06. Additionally SNPs with a minor allele frequency of less than 1% were removed. 

Samples were excluded if they displayed more than 5% missingness, had indeterminate X chromosome heterozygosity or extreme autosomal heterozygosity. Samples showing evidence of population stratification were identified by multidimensional scaling of genome-wide identity by state pairwise distances using the four HapMap populations as a reference, and then excluded. 

9,048 subjects and 526,688 SNPs passed these quality control filters.

We combined 477,482 SNP genotypes in common between the sample of mothers and sample of children. We removed SNPs with genotype missingness above 1% due to poor quality (11,396 SNPs removed) and removed a further 321 subjects due to potential ID mismatches. This resulted in a dataset of 17,842 subjects containing 6,305 duos and 465,740 SNPs (112 were removed during liftover and 234 were out of HWE after combination). We estimated haplotypes using ShapeIT(v2.r644) which utilises relatedness during phasing. We obtained a phased version of the 1000 genomes reference panel (Phase 1, Version3) from the Impute2 reference data repository (phased using ShapeItv2.r644, haplotype release date Dec 2013). Imputation of the target data was performed using Impute V2.2.2 against the reference panel(all polymorphic SNPs excluding singletons), using all 2186 reference haplotypes (including non-Europeans).

This gave 8,237 eligible children and 8,196 eligible mothers withavailable genotype data after exclusion of related subjects using cryptic relatedness measures described previously.

Known issues:
There is a known strand issue present within this imputation: The Dec 2013 haplotype release of 1000 genomes phase 1 version 3 have 199 reported SNPs with incorrect strand. For more information and the origins of this list please visit https://mathgen.stats.ox.ac.uk/impute/data_download_1000G_phase1_integrated_SHAPEIT2_16-06-14.html. It is very unlikely that they have systematic effects across the genome and most probably are just isolated to these 199 known problematic SNPs. The user is advised to discard them from their analysis.

Formatting of the bgen files within the gi_1000g_g0m_g1 dataset have NA in place of the chromosome column. Some tools may allow this, while others are less forgiving. This may mean users wish to re-format the dataset (using QCtool or equivalent) for their work.

Allele frequency concordance with other cohorts: When contributing to consortia you may find that the allele frequencies in ALSPAC for a few thousand SNPs are discordant from a reference panel used by the consortium. This is actually to be expected - when calculating allele frequencies, even from the same population, in two different samples for many millions of SNPs there will be a number of SNPs that appear to be highly discordant.

### Freeze Docs
```yaml
@include freezes/gi_1000g_g0m_g1_2015-10-30_f7.yaml
```

## Genome-wide - TOPMed round 3 imputed - G0 mothers + G1 (gi_topmed_g0m_g1)

### Description
This dataset contains genotype data imputed to TOPMed round 2 for G0 mothers and G1.<br>
Reference genome build: `GRCh38`

### Methodology
ALSPAC children were genotyped using the Illumina HumanHap550 quad chip genotyping platforms by 23andme subcontracting the Wellcome Trust Sanger Institute, Cambridge, UK and the Laboratory Corporation of America, Burlington, NC, US. The resulting raw genome-wide data were subjected to standard quality control methods. Individuals were excluded on the basis of gender mismatches; minimal or excessive heterozygosity; disproportionate levels of individual missingness (>3%) and insufficient sample replication (IBD < 0.8).
 
Population stratification was assessed by multidimensional scaling analysis and compared with Hapmap II (release 22) European descent (CEU), Han Chinese, Japanese and Yoruba reference populations; all individuals with non-European ancestry were removed.
 
SNPs with a minor allele frequency of < 1%, a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 5E-7) were removed. Cryptic relatedness was measured as proportion of identity by descent (IBD > 0.1).
 
Related subjects that passed all other quality control thresholds were retained during subsequent phasing and imputation. 9,115 subjects and 500,527 SNPs passed these quality control filters.
 
ALSPAC mothers were genotyped using the Illumina human660W-quad array at Centre National de Génotypage (CNG) and genotypes were called with Illumina GenomeStudio. PLINK (v1.07) was used to carry out quality control measures on an initial set of 10,015 subjects and 557,124 directly genotyped SNPs. SNPs were removed if they displayed more than 5% missingness or a Hardy-Weinberg equilibrium P value of less than 1.0e-06. Additionally SNPs with a minor allele frequency of less than 1% were removed.
 
Samples were excluded if they displayed more than 5% missingness, had indeterminate X chromosome heterozygosity or extreme autosomal heterozygosity. Samples showing evidence of population stratification were identified by multidimensional scaling of genome-wide identity by state pairwise distances using the four HapMap populations as a reference, and then excluded.
 
9,048 subjects and 526,688 SNPs passed these quality control filters.
 
We combined 477,482 SNP genotypes in common between the sample of mothers and sample of children. We removed SNPs with genotype missingness above 1% due to poor quality (11,396 SNPs removed) and removed a further 321 subjects due to potential ID mismatches. This resulted in a dataset of 17,842 subjects containing 6,305 duos and 465,740 SNPs (112 were removed during liftOver and 234 were out of HWE after combination).

Individuals within this dataset, but who have withdrawn from the project were removed from the dataset before proceeding with  imputation specific quality control. This left 17450 individuals. 
 
The combined mothers and children combined genotype panel was filtered to remove SNPs below MAF 0.01, missing call rates exceeding 0.01 using Plink 2.0. The joint set of SNPs was checked for palindromic SNPs but none were present. The combined call set was swapped from GRCh37 to GRCh38 using UCSC liftOver. 
 
The dataset was later filtered to SNPs above HWE of 1e-6 leaving 455150 SNPs. The combined autosomal call set was then converted to VCF files, before being uploaded to the TOPMed imputation server to flag variants requiring a strand fix. Any SNPs flagged with an issue were corrected, or filtered out using Plink2. 454248 SNPs remained within the autosomes.

Phasing and imputation was conducted on the Michigan TOPMed imputation server in December 2025. Phasing was done using Eagle. Imputation was done on minimac4 to TOPMed R3. An R squared filter of 0.3 was applied. 

### Freeze Docs
```yaml
@include freezes/gi_topmed_g0m_g1_2026-03-09_f7.yaml
```

## Genome-wide - TOPMed round 3 imputed - G0 partners (gi_topmed_g0p)

### Description
This dataset contains genotype data imputed to TOPMed round 2 for G0 mothers and G1.<br>
Reference genome build: `GRCh38`

### Methodology
3,453 ALSPAC mother and fathers and 535,478 SNPs were genotyped using the Illumina HumanCoreExome chip genotyping platforms by the ALSPAC lab and called using GenomeStudio. The resulting raw genome-wide data were subjected to standard quality control methods using PLINK (v1.07). Individuals were excluded on the basis of gender mismatches (n = 80); minimal or excessive heterozygosity (n = 64); disproportionate levels of individual missingness (>5%, n = 60) and possible contamination (n = 3). 

Population stratification was assessed by multidimensional scaling analysis and compared with 1000 Genomes phase 3 data and principal component analysis (n = 266); all individuals with non-European ancestry were removed. Cryptic relatedness was measured as SNP relatedness in GCTA (relatedness > 0.1, n = 69 removed). SNPs with a call rate of < 95% or evidence for violations of Hardy-Weinberg equilibrium (P < 1E-7) and those which failed GenomeStudio quality control measures were removed (n = 21,298). 6,594 duplicate SNPs were also removed. This resulted in 2,911 unrelated mothers and father genotypes at 507,586 SNPs. We then identified 2217 samples where aln assigned historically by the lab matched genetically assigned aln. 

1737 putative G0 partner-G1 pairs for whom both G0 partner and G1 have called genotype data available were identified based on ALN. Given the G0 partners were invited by the G0 mother to take part and only enrolled in the study in their own right several years later, it could not be assumed that all G0 partners were biologically related to G1. Called genotype data for the 1720 unique G0 partners and 1737 unique G1s were merged (i.e. there were 17 pairs of siblings/twins among the G1 offspring), using plink v1.90b7.2 64-bit (11 Dec 2023).

After application of the plink filters --geno 0.05, --maf 0.01, --snps-only just-acgt and --autosome, 113288 SNPs remained. The --related command in KING version 2.3.2 was used to perform kinship analysis, which confirmed that all 1737 putative G0 partner-G1 pairs are genetically related. This would be expected for biological father-offspring pairs, using the inference criteria described in in Table 1 of "Manichaikul, Ani, et al. "Robust relationship inference in genome-wide association studies." Bioinformatics 26.22 (2010): 2867-2873."

Of the 507586 SNPs which passed the original QC, filtering on --maf and --geno of 0.01, 256693 SNPs remained. 

Individuals within this dataset, but who have withdrawn from the project were removed from the dataset before proceeding with  imputation specific quality control. This left 2198 individuals. 
 
The genotype panel was filtered to remove SNPs below MAF 0.01, missing call rates exceeding 0.01 using Plink 2.0. The SNPs were checked for palindromic SNPs which were filtered out. The genotype data was swapped from GRCh37 to GRCh38 using UCSC liftOver. 

The dataset was later filtered to SNPs above HWE of 1e-6 leaving 246380 SNPs. The combined autosomal call set was then converted to VCF files, before being uploaded to the TOPMed imputation server to flag variants requiring a strand fix. Any SNPs flagged with an issue were corrected, or filtered out using Plink2. 246380 SNPs remained within the autosomes.

Phasing and imputation was conducted on the Michigan TOPMed imputation server in December 2025. Phasing was done using Eagle. Imputation was done on minimac4 to TOPMed R3. An R squared filter of 0.3 was applied. 

### Freeze Docs
```yaml
@include freezes/gi_topmed_g0p_2026-03-05_f7.yaml
```

# Sequence Data

## Whole genome sequencing - G1 (wgs_hiseq_g1)

### Description
This dataset contains whole genome sequencing for G1 individuals, part of the UK10K dataset.<br>
Reference genome build: `GRCh37`

### Methodology
ALSPAC and TwinsUK cohorts were sequenced at an average read depth of 6.7x through the UK10K program (http://www.UK10K.org) using the Illumina HiSeq platform, and aligned to the GRCh37 human reference using BWA. SNV calls were completed using samtools/bcftools and VQSR and GATK were used to recall these calls.

 Sites which passed filters were brought forward to genotype refinement. Samples were dropped after calling and before genotype refinement for reasons described below.

Sample exclusion:
  48 samples were removed:<br> 
    - 1 excessive het rate<br> 
    - 36 discordance > 3%<br> 
    - 11 coverage < 4x<br> 

Genotype refinement:<br> 
  The missing and low confidence genotypes were refined with BEAGLE 4, rev909 in chunks of 3,000 sites plus 1,000 sites in buffer regions. Multiallelic sites were included in the imputation.

Further Sample exclusion after genotype refinement:<br> 
  - 1 sample removed<br> 
  - 1 contamination<br> 
  - 1 NRD > 5%<br> 

  For downstream analysis a further 177 samples may be excluded due to non-European ancestry, or relatedness.

Annotations:
  The calls were annotated using vcf-annotate and include dbSNP 137 rsIDs. Sites where different alternate allele of the same type (SNP vs indel) were found in the UK10K data have dbSNPmismatch flag in the INFO column. The 1000Genomes frequencies are taken from the final 1000 Genomes Phase 1 integrated (v3) callset available here:<br> 
    - ftp://ftp.1000genomes.ebi.ac.uk//vol1/ftp/phase1/analysis_results/integrated_call_sets<br> 

  The files used for these annotations can be found on the above sftp site:<br> 
    - /uk10k/ref/annots-rsIDs-dbSNPv137.2012-09-13.tab.gz<br> 
    - /uk10k/ref/annots-rsIDs-AFs.2012-07-19.tab.gz<br> 

Functional Annotations:<br> 
  Variant consequence annotations are called using the Ensembl Variant Effect Predictor (http://www.ensembl.org/info/docs/variation/vep/index.html), v2.6 against Ensembl 68.  This provides coding consequence predictions and SIFT,PolyPhen and Condel annotations. Ensembl also provides GERP conservation scores. Grantham matrix values come from a simple lookup.

  The consequences are in the format:<br> 
    CSQ=ENSTid:Genename:consequence_string[:CDS_coord:Peptide_coord:AA>AA:Functional_annot,value]+ENSTid2:Genename:consequence_string2:...[+gerpScore]

  i.e. consequences are separated by '+', with each consequence containing ':' separated fields.  Functional annotations (PolyPhen, etc) are given as name,value.

  Based on non-European ancestry and relatedness 177 of the samples in this release should be excluded from certain downstream analysis.

Associated publication:<br> 
  - http://www.ncbi.nlm.nih.gov/pubmed/26367797

Please ensure you have permission to access this data (http://www.uk10k.org/data_access.html) before using it. 

### Freeze Docs
```yaml
@include freezes/wgs_hiseq_g1_2016-08-18_f7.yaml
```

## Whole exome sequencing - G0 & G1 (wes_novaseq_g0_g1)

### Description
This dataset contains whole exome sequencing for G0 and G1 individuals. It was generated at the Sanger Institute as part of an initiative sequencing multiple Birth cohorts: ALSPAC, MCS and BiB. As part of this initiative, the exome sequencing data will also be available via EGA but researchers will still gain access through ALSPACs project approval system.<br>
Reference genome build: `GRCh38`

### Methodology
Exome sequencing was conducted on DNA for 12,374 participants (8,605 children and 3,389 of their parents) at the Sanger Institute, using Illumina NovaSeq. Reads were aligned to GRCh38 with BWA-MEM. There was an average on-target depth of ~62X for ALSPAC.

QC was conducted on the dataset at the Sanger Institute, please find details within the associated publication (Koko et al., 2024). Sample QC was done before (base-calls after sequencing, alignment quality, CRAM file quality) and after variant calling (PCA analysis, comparison to array data, relatedness). Integrated variant QC removed potentially false positive variants using a trained random forest model. Genotype QC removed low quality individual genotype calls.

Single nucleotide variant (SNV) and small insertions/deletion (indels) calling was conducted with GATK HaplotypeCaller, GenomicsDBImport and GenotypeGVCFs (GATK version 4.2.4.0 for ALSPAC) following GATK best practices (Van der Auwera and O'Connor, 2020). 

There were 12 individuals identified to have sex mismatches within the dataset, withflagging as mismatches based on X F stat. When looking at the Y coverage of these individuals, 3 were clear cut-offs based from both X f stat and Y depth, while 9 were only mismatches based off the X F stat. The 3 individuals with clear mismatches on both statistics were removed from the dataset, while the other mismatches were retained.  

Associated publication:<br> 
- doi.org/10.12688/wellcomeopenres.22697.1

### Freeze Docs
```yaml
@include freezes/wes_novaseq_g0_g1_2024-09-20_f7.yaml
```

## Whole exome sequencing - G1 (wes_novaseq_g1)

### Description
This dataset contains whole exome sequencing for G1 individuals. It was generated at the Broad Institute for ~2900 G1 individuals.<br>
Reference genome build: `GRCh38`

### Methodology
The exomes returned from the Broad Insitute did not undergo PCA or relatedness filtering; instead provided as raw VCF data. The following thresholds were applied to the samples:

-	Chimera rate: Less than 0.05
-	Contamination rate: Less than 0.10
-	PF aligned rate: More than 0.60

87 individuals were removed from the dataset who were believed to have been a sample mismatch. These exomes had discordance rate of above 0.05 when compared to existing array data using bcftools gtcheck.

Associated publications:<br>
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9980234/ (conducted additional QC beyond dataset)

### Freeze Docs
```yaml
@include freezes/wes_novaseq_g1_2024-04-12_f7.yaml
```

# Epigenetic Data

## DNA methylation - EPIC & 450k - G0 + G1 (dnam_epic450_g0_g1)

### Description
This dataset contains methylation data collected from both G0 and G1 on two arrays at different timepoints. This dataset supersedes dnam_450_g0m_g1.

There is data from Illumina Infinium HumanMethylation450K BeadChip array on G0 mothers at two timepoints (pregnancy and middle age), G1 participants at 5 timepoints (across birth, childhood and adolescence) and G0 participants at one timepoint. This dataset also contains data from Infinium MethylationEPIC v1.0 data on 2721 G1 individuals at 2 timepoints.

This dataset was generated as part of the Accessible Resource for Integrated Epigenomics Studies (http://www.ariesepigenomics.org.uk/).

### Methodology
Preprocessing and quality control for this dataset was conducted using Meffil.

Associated publications:<br> 
- https://doi.org/10.1093/ije/dyv072 <br> 
- https://doi.org/10.1093/bioinformatics/bty476 <br> 

Associated R packages: <br>
- aries: https://github.com/MRCIEU/aries is associated with loading and using this dataset <br> 
- meffil: https://github.com/perishky/meffil/ was used for QC and normalisations within <br> 


Sample types
<details>
The sample type used for each sample can be identified using samplesheets provided within the standard dataset. The column samcode contains a 3 digit number which indicates the origin of the sample

SAMCODE|COHORT|TIME_POINT|SAMPLE_TYPE|ADDITIVE
-|-|-|-|-
100|mother|antenatal|whole blood|EDTA
109|mother|antenatal|white blood cells|heparin
211|child|Birth|white blood cells|heparin
212|child|Birth|blood spot|heparin
342|child|CIF clinic@43m|white blood cells|EDTA
343|child|CIF clinic@43m|whole blood|EDTA
357|child|CIF clinic@61m|white blood cells|EDTA
400|child|F@7|whole blood|EDTA
402|child|F@7|white blood cells|EDTA
427|child|F@9|PBL|CPDA
428|child|F@9|whole blood|CPDA
430|child|F@9|accuspin remains|CPDA
475|carer|2004-2008|PBL|CPDA
476|carer|2004-2008|whole blood|CPDA
492|child|TF3|whole blood|CPDA
497|child|TF3|white blood cells|
511|mother|FOM1|white blood cells|EDTA
526|child|F17|white blood cells|EDTA
942|child|YP24+|white blood cells|EDTA
</details>

### Freeze Docs
```yaml
@include freezes/dnam_epic450_g0_g1_2022-7-13_f7.yaml
```

# Gene Expression Data

## Gene expression - array - G1 (ge_ht12_g1)

### Description
There are two different types of QC'd data available in this version, one performed by David Evans for the Bryois et al 2014 paper, and one performed by Gibran Hemani for the molgenis eQTL mapping meta analysis. A version without QC is available as well. Details on the QC'd versions can be seen below. 

This data was generated from LCLs. The majority of samples used in their generation were collected at age 9 years. LCL's are a lymphoblastoid cell lines which were produced by transforming lymphocytes with Epstein Barr Virus and cultured before DNA was extracted. Gene expression patterns may not be the same as that from untransformed lymphocytes taken from a 9 year old. 

### Methodology 
Bryois:<br>
  - LCL's from unrelated individuals were grown under identical conditions and cells frozen in RNAlater. RNA was extracted using an RNeasy extraction kit (Qiagen) and was amplified using the Illumina TotalPrep-96 RNA Amplification kit (Ambion). Expression profiling of the samples, each with two technical replicates, were performed using the Illumina Human HT-12 V3 BeadChips (Illumina Inc) including 48,804 probes where 200 ng of total RNA was processed according to the protocol supplied by Illumina. Raw data was imported to the Illumina Beadstudio software and probes with less than three beads present were excluded. Log2 - transformed expression signals were then normalized with quantile normalization of the replicates of each individual followed by quantile normalization across all individuals. 

We restricted our analysis to 23'935 probes tagging genes annotated in Ensembl. Principal component analysis was performed on 931 individuals. 62 individuals with principal component 1 or 2 greater than one standard deviation of the population were excluded from further analysis. See http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1004461 for full details.

Molgenis:<br>
  - Genetic outliers were removed, any individuals that were clear outliers in the first 2 genetic principal components. Each probe was simply quantile normalised and then log2 transformed. Then adjusted for the first 4 genetic MDS, expression principal components (excluding those that had genetic associations), and scaled to have mean 0 and variance 1. See https://github.com/molgenis/systemsgenetics/wiki/eQTL-mapping-analysis-cookbook for full details.

### Freeze Docs
```yaml
@include freezes/ge_ht12_g1_2015-11-02_f7.yaml
```

# Other omics datasets 
Both metabolomics and proteomics data has been generated for ALSPAC. Due to data type, namedly flat text formats, these are incorporated into the standard phenotypic variables. If you wish to access these data, you should look at our data dictionary. You can also search for specific variables using the [variable search tool](https://variables.alspac.bris.ac.uk/?_gl=1*6o90gi*_ga*NzEwMTYwMTcuMTY2NzM4NTA3Nw..*_ga_6R8SPL3HLT*MTY5NDQ1MDE2MS4xODcuMS4xNjk0NDUwMjI1LjYwLjAuMA..&_ga=2.212905629.844854620.1694450161-71016017.1667385077), to see if metabolites of interest are available in the ALSPAC dataset. 

## Metabolomics
Metabolomics data has been generated at multiple timepoints using mupltiple technologies. Data has been generated at either Nightingale Health using nuclear magnetic resonance (NMR), or Metabolon using mass spectrometry (MS). 

NMR data that was derived has been released previously, but have all been recently updated according to updated marker labelling by Nightingale. 

### G0
Data source: Mother_samples_6c & Child_bloods_7a

|Timeponit                             | FOM1    | FOM2    | FOM3    | FOM4    |
|--------------------------------------|---------|---------|---------|---------|
| fasting status                       | fasting | fasting | fasting | fasting |
| Nightingale                          | 4368    | 2793    |         | 1681    |
| Olink (Target 96 inflammatory panel) | 2968    |         |         |         |

### G1
| Timepoint                                     | F7 (7yrs)   | BBS (~8yrs) | TF3 (15.5yrs) | TF4 (~17yrs) | F24 (24yrs)                | F30 (30yrs) | data source           |
|-----------------------------------------------|-------------|-------------|---------------|--------------|----------------------------|-------------|-----------------------|
| Fasting status                                | Non-fasting | fasting     | fasting       | fasting      | fasting                    | fasting     | Child_bloods_7a       |
| Longitudinal: Nightingale                     | 5525        | 640         | 3366          | 3167         | 3270                       | 2894        | Child_bloods_7a       |
| Longitudinal: Metabolon                       | 226         |             | 281           | 226          | 281                        | 226         | Child_bloods_7a       |
| Metabolon (B4132)                             |             |             |               |              |                            | 520         | G1_MS_metabolon_B4132 |

### G2
Data source

| Type        | Count |
|-------------|-------|
| Nightingale | 823   |

Substudy data is available, but may be non-standard and require additional access requests in the application. <br>
- B2714: https://pubmed.ncbi.nlm.nih.gov/32494907/<br>
- B3194: https://pubmed.ncbi.nlm.nih.gov/35598895/<br>
- B4132: https://wellcomeopenresearch.org/articles/10-632, <br>

Metadata:
- B4132: https://proposals.epi.bristol.ac.uk/G1_MS_metabolon_B4132-feature-metadata.xlsx 

Associated publications: <br>
- https://wellcomeopenresearch.org/articles/10-632 (@30 samples and updated version of earlier data)<br>

Associated packages: <br>
- https://github.com/MRCIEU/metaboprep (https://academic.oup.com/bioinformatics/article/38/7/1980/6522114)<br>

## Proteomics
Proteomics data has been collected within ALSPAC across multiple time points: 

Olink data was used to analyse 9000 samples across multiple timepoints and generations. Detailed informatino is available within the associated publication. 

| Cohort         | Timepoint    | N.   |
|----------------|--------------|------|
| G0 Mothers     | F0M1         | 2968 |
| G1 individuals | F9 (~9yrs)   | 3005 |
| G1 individuals | F24 (~24yrs) | 3027 |


Associated publications: <br>
- https://pubmed.ncbi.nlm.nih.gov/39268475/ <br>

Associated packages: <br>
- https://github.com/MRCIEU/metaboprep (https://academic.oup.com/bioinformatics/article/38/7/1980/6522114)<br>

# Omics tips

## Introduction
This section is a guide to using 'Omics datasets. It explains which software to use and describes common file formats. It's a good starting point for beginners and helpful for problem-solving.

## Disclaimer
Some information is copied or reworded from software documentation. Check the original documentation alongside this guide for up-to-date information. Note that some links may no longer work.

## Operating systems
You can use ALSPAC data with any operating system, but Unix-based systems like Macintosh, Linux, or BSD are more convenient due to the data's size and complexity. We recommend using the command line and programming scripts with languages like Bash, R, Python, or Perl. Many online resources are available to learn these tools. Use free/libre and open-source software where possible.

Links:

- Unix guide: [https://www.osc.edu/supercomputing/unix-cmds](https://www.osc.edu/supercomputing/unix-cmds)
- Beginning Python: [https://www.python.org/about/gettingstarted/](https://www.python.org/about/gettingstarted/)
- Beginning R: [https://www.statmethods.net/r-tutorial/index.html](https://www.statmethods.net/r-tutorial/index.html)
- Free/libre and open-source software: [https://www.fsf.org/about/](https://www.fsf.org/about/) 

## Key Omics software
### Plink
Plink is a tool for performing quality control and whole genome
association analysis of genetic data.
- Link: http://zzz.bwh.harvard.edu/plink/ 
### SNPTest
SNPTest is a tool for performing  whole genome
association analysis of genetic data.
- Link: https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html (Not open source)
### BoltLmm
BoltLmm is a tool for performing genome
association analysis of genetic data. It is recommended for analysis
of more than 5000 samples, its methods automatically take into
account population substructures.
- Link: https://data.broadinstitute.org/alkesgroup/BOLT-LMM/
### Qctools
A tool for quality control of genetic data.
It is also useful to inspect and modify .gen .bgen and vcf files etc (see section 4 below). 
- Link: https://www.well.ox.ac.uk/~gav/qctool_v2/
### SAMTOOLS
Samtools is a suite of tools which are used for genomic analysis.
- Link: http://www.htslib.org/
### VCFTOOLS
Part of samtools that allows you to work with vcf files.
- Link: https://vcftools.github.io/index.html
### BCFTOOLS
This is a part of samstools and allows users to manipulate .bcf files.
- Link: http://samtools.github.io/bcftools/bcftools.html

## File types
In a Unix environment the postfix of a file name does not explicitly mean anything to the operating system,  unlike in a Windows system which will look at the file types. In a Unix system it is just part of the name of the file and humans use it to distinguish file formats. The following is a non-exhaustive list of file types you may encounter whilst using ALSPAC Omics data.

### .gen
This is an 'oxford' data format for genetic data. The .gen file is a
plain text file, this means that standard Unix command line tools can
be used to inspect the data. For example, 'head' or 'less'.

The .gen (genotype) file stores data on a one-line-per-SNP format. The first 5 entries of each line are the SNP ID, RS ID of the SNP, base-pair position of the SNP, the allele coded A and the allele coded B. The SNP ID can be used to denote the chromosome number of each SNP. The next three numbers on the line are the probabilities of the three genotypes AA, AB and BB at the SNP for the first individual in the cohort. The next three numbers are the genotype probabilities for the second individual in the cohort. The next three numbers are for the third individual and so on. The order of individuals in the genotype file should match the order of the individuals in the sample file (see below). It should be noted that the probabilities need not sum to 1 to allow for the possibility of a NULL genotype call. This format allows for genotype uncertainty. This genotype file format is the same as that produced by the genotype calling algorithm CHIAMO. NOTE : We recommend that you arrange SNPs in base-pair order in the genotype files. This is required if you want to use the files with IMPUTE and will make viewing the output of SNPTEST somewhat easier. For example, Suppose you want to create a genotype for 2 individuals at 5 SNPs whose genotypes are

|       |    |    |
|-------|----|----|
| SNP 1 | AA | AA |
| SNP 2 | GG | GT |
| SNP 3 | CC | CT |
| SNP 4 | CT | CT |
| SNP 5 | AG | GG |

The correct genotype file would look like this:

|               |   |   |   |   |   |   |   |   |
|---------------|---|---|---|---|---|---|---|---|
| SNP1 rs1 1000 | A | C | 1 | 0 | 0 | 1 | 0 | 0 |
| SNP2 rs2 2000 | G | T | 1 | 0 | 0 | 0 | 1 | 0 |
| SNP3 rs3 3000 | C | T | 1 | 0 | 0 | 0 | 1 | 0 |
| SNP4 rs4 4000 | C | T | 0 | 1 | 0 | 0 | 1 | 0 |
| SNP5 rs5 5000 | A | G | 0 | 1 | 0 | 0 | 0 | 1 |

### .bgen
A binary version of a .gen file. This file can not be visually
inspected on the command line. .bgen files are used because they
greatly increase the speed and storage efficiency of software for
storing large amounts of Omics data. The full details of the file
format are discussed in : https://www.well.ox.ac.uk/~gav/bgen_format/ 
bgen files are normally used with tools such as qctools and snptest
There is also a library for reading .bgen files into R :
https://bitbucket.org/gavinband/bgen/wiki/rbgen 

### .sample
The .sample file is paired with either .gen or .bgen files. It
contains information on the samples that is not genetic. It is a plain
text file that can be inspected with standard Unix command line tools.

Please note that the sample file format changed with the release of SNPTEST v2. Specifically, the way in which covariates and phenotypes are coded on the second line of the header file has changed. 
The sample file has three parts (a) a header line detailing the names of the columns in the file, (b) a line detailing the types of variables stored in each column, and (c) a line for each individual detailing the information for that individual. Here is an example of the start of a sample file for reference


| ID_1 | ID_2 | missing | cov_1 | cov_2 | cov_3 | cov_4 | pheno1 | bin1           |
| -- | -- | -- | -- | -- | -- | -- | -- | -- |
|    0 |    0 |       0 |     D |     D |     C |     C |      P | B              |
|    1 |    1 |       0 |  .007 |     1 |     2 |     0 |  .0019 | -0.008 1.233 1 |
|    2 |    2 |       0 |  .009 |     1 |     2 |     0 |  .0022 | -0.001 6.234 0 |
|    3 |    3 |       0 |  .005 |     1 |     2 |     0 |  .0025 | 0.0028 6.121 1 |
|    4 |    4 |       0 |  .007 |     2 |     1 |     0 |  .0017 | -0.011 3.234 1 |
|    5 |    5 |       0 |  .004 |     3 |     2 |    -0 |   .012 | 0.0236 2.786 0 |


The header line:
This line needs a minimum of three entries. The first three entries should always be ID_1, ID_2 and missing. They denote that the first three columns contain the first ID, second ID and missing data proportion of each individual. Additional entries on this line should be the names of covariates or phenotypes that are included in the file. In the above example, there are 4 covariates named cov_1, cov_2, cov_3, cov_4, a continuous phenotype named pheno1 and a binary phenotype named bin1.
NOTE : All phenotypes should appear after the covariates in this file.
The second line of the file details the type of variables included in each column. The first three entries of this line should be set to 0. Subsequent entries in this line for covariates and phenotypes should be specified by the following rules

|||
|-|-|
| D | Discrete covariate (coded using positive integers) |
| C | Continuous covariates                              |
| P | Continuous Phenotype                               |
| B | Binary Phenotype (0 = Controls, 1 = Cases)         |


The remainder of the file should consist of a line for each individual containing the information specified by the entries of the header line (see example above).
Use spaces to separate the entries of the sample file and not TABS
because that is the expected character.

Missing values - Specifying missing values for covariates and
phenotypes is possible. It was recommended that you use -9 for missing
values. This was the default value assumed by SNPTEST v1, although the
-missing_code option in SNPTEST v1 meant that you could use other
numeric values for the missing code, In SNPTEST v2 the behavior of the
-missing_code option has changed so that it now takes a comma-separated
list of values, each of which is treated as missing when encountered
in the sample file(s). Default missing values are now denoted by the
two character string "NA".

### .ped
A plink format file that is in plain text and can be viewed with standard tools. It contains genetic variant data. https://www.cog-genomics.org/plink/1.9/formats#ped

### .map
A plink format file that is in plain text. It contains information
about variants.
https://www.cog-genomics.org/plink/1.9/formats#map

### .bed
A plink format file that isa binary equivalent of a .ped file. It is smaller and faster to process but is not easily viewable or editable. https://www.cog-genomics.org/plink/1.9/formats#bed

### .bim
A plink format, similar to a .map file but is used with binary .bed files.
https://www.cog-genomics.org/plink/1.9/formats#bin

### .fam
A plain text format that contains sample information for plink binary
files.
https://www.cog-genomics.org/plink/1.9/formats#fam

### .csv
A plain text format where different fields are separated by
commas. (Comma separated variables).

### .vcf
VCF files are a flexible file format for storing different types of
genetic variants. They are a plain text format that can be inspected
on the command line with standard Unix tools. However they are often
very large files, and specific tools such as 'vcftools' are useful for
working with this data. Commonly SNPs are stored in these files but other variants such as
Copy Number variations can also be stored.
The basic form for a vcf file is: 
https://en.wikipedia.org/wiki/Variant_Call_Format

### .bcf
This is a binary version of a vcf file. It cannot be inspected on the
command line, but can be used with the genomic tools mentioned in this document.

### .tar.gz
This is a standard Unix file format for bundling and compressing a set of files. It is similar to a .zip file. It is made by first bundling a set of files into a .tar file (sometimes called a tar ball). This is then compressed using 'gun zip'. https://en.wikipedia.org/wiki/Tar_(computing) https://en.wikipedia.org/wiki/Gzip

### .enc
This file extension is used as a convention to mean that the file is encrypted. You will need to have that  password that was used to encrypt the data in order to unencrypt the files. https://en.wikipedia.org/wiki/OpenSSL

## Variant/SNP ids

There are many types of genetic variation. A common type is a single
nucleotide polymorphism (SNP). Others include copy number variations.

Variants can be specified by a Chromosome and location in reference to
a specific build of the human genome. They can also be given a
reference SNP (rs) cluster identifier.

- chr:Location
- rs_ids

## Overview of Imputation reference panels

SNP array data frequently contain hundreds of thousands of
variants. However due to linkage disequilibrium it is possible to
estimate many more SNP values for an individual. This estimation
procedure is called imputation and it works by combining an
individuals SNP array data with a large reference population of
sequenced data. In this way it is possible to have accurate
estimations of millions of SNP values for an individual without the
cost of fully sequencing each person. ALSPAC has prerun the imputation
process using three different imputation panels.

### Panels
- TOPmed: The latest reference panel (to ALSPAC), which has the most snps
- HRC: This is the latest reference panel and our data contains circa 40 millions of SNPs.
- 1000 Genomes: This is the previous generation reference panel which is still widely used in ALSPAC studies. There are some SNPs that appear in this panel that are not in the HRC panel.
- Hapmap: This was the first widely used imputation panel.

## SNP data types from imputation.

SNPs that have been imputed can be stored and analysed in different
formats. These can be appropriate for different types of analysis, for
example an analysis could assume and additive effect for the minor
allele or it could assume a recessive/dominant effect. 

- Best guess. The data will be presented as either 0,1, or 2 to represent how many of the minor alleles at that position a person has. The best guess is derived from the probability of a variant calculated from the imputation process.
- Dosage. This is the probability that the person has 0, 1 or 2 of the minor allele. i.e. 0.1, 0.2,0.7. This will sum to one across the three possibilities (i.e for each SNP for each individual).

## SNP Statistics

You can generate statistics on your SNP data using the program
'QCtools'. This will give you the imputation information scores. For example:

qctool -g example.bgen -s example.sample -sample-stats -osample sample-stats.txt

## Best practice
### GWAS
We recommend you follow the steps outlined in the following paper when performing GWAS: 
Marees, Andries T., et al. "A tutorial on conducting genome‐wide
association studies: Quality control and statistical analysis."
International journal of methods in psychiatric research 27.2 (2018):
e1608. https://doi.org/10.1002/mpr.1608
### Phewas 
We recommend you follow the steps outlined in the following paper when performing Phewas: 
Millard, L., Davies, N., Timpson, N. et al. MR-PheWAS: hypothesis prioritization among potential causal effects of body mass index on many outcomes, using Mendelian randomization. Sci Rep 5, 16645 (2015). https://doi.org/10.1038/srep16645
### Methylation
The following paper describes the methylation data available in ALSPAC
Relton, Caroline L., et al. "Data resource profile: accessible resource for integrated epigenomic studies (ARIES)." International journal of epidemiology 44.4 (2015): 1181-1190.

## Population stratification
This is when an observed genetic association is due to the
population/geography. Not taking this into account can lead to biased
estimates of effects.
One common method to account for these is to calculate principal
components (PCs) of the genetic data and then to include these as covariables
in any models.

ALSPAC do not provide PCs as part of the standard omics datasets, as these would require being re-generated and tested alongside each freeze. PCs can be generated using plink, hail or a variety of other tools.

For more information about how to do this in plink see: https://www.cog-genomics.org/plink/1.9/strat

An common method used to account for population substructure is by using
linear mixed models. For example using the bolt LMM software tool.

https://data.broadinstitute.org/alkesgroup/BOLT-LMM/

## Polygenic risk scores (PRS)
These are scores which estimate the effect of variants in an individual genome on a given phenotypic trait or disease. 

Further explanations can be found online, such as: https://www.genome.gov/Health/Genomics-and-Medicine/Polygenic-risk-scores

Or example tutorials for calculating PRSs: https://www.nature.com/articles/s41596-020-0353-1 

Different collaborators often generate PRS for ALSPAC, but these are not shared as part of our standard omics datasets. Collaborators wishing for PRSs will need to generate these themselves. 

## Common tasks

Here we provide links to webpages that provide instructions or provide
brief details any code for completing common tasks using the various
software we have described above (section x):

- Extract some SNPs from a bgen data file and convert to plain text.

https://www.well.ox.ac.uk/~gav/qctool_v2/documentation/examples/filtering_variants.html

- Extract some SNPs from bed data:

http://zzz.bwh.harvard.edu/plink/dataman.shtml

`plink --bfile mydata --chr 2 --from-kb 5000 --to-kb 10000` 

- Reading .bgen and .sample oxford files in plink

Plink supports bgen files but it is fussy about the types of its
columns in the data.sample file. You may wish to remove or retype
columns to read a data.sample file into plink. For more info see:

https://www.cog-genomics.org/plink/2.0/input

To make a new sample file removing some columns you can use the Unix command: 'cut -f 1,2,3 -d " " data.sample > data2.sample'

## Courses
Working with 'Omics data can be complicated but there are many
excellent resources available to help you learn how to do this. There
are both paid in person courses and free online courses.

Details on paid courses offered by Bristol University can be found here: https://www.bristol.ac.uk/medical-school/study/short-courses/ 
In addition, a number of free online courses are summarised here: https://www.mooc-list.com/tags/bioinformatics

## Further sources of help
### Stack exchange 
Stack exchange is an online Q&A community which is divided into
different sub-communities. The first and most well-known is Stack overflow. This is one of the best place to ask
questions about programming on the Internet.
Other useful exchange sites include bioinformatics
https://bioinformatics.stackexchange.com/, maths
https://mathoverflow.net/ and statistics https://stats.stackexchange.com/.

### Bio-stars 

Biostars is bioinformatics community Q&A web-site: https://www.biostars.org/

### Mailing lists 

For individual product/projects there is often a mailing list. For example to get help using SNPTEST you can ask on the mailing list https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html#contact

### AI tools

AI tools such as chatGPT can be useful to understand how to work with omics data, but please do understand their limitations and look at documentation or research papers directly.

### Ask ALSPAC

If you can not find the answer to your question or you think there is
something wrong with your data then please contact the alspac-omics@bristol.ac.uk
mailbox and we will do our best to help you. 
