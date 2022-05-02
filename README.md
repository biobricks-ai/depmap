# The Dependency Map [(depmap)](https://depmap.org/portal/) Portal
> The mutations that cause cancer cells to grow also confer specific vulnerabilities that normal cells lack. Some of these acquired alterations represent compelling therapeutic targets. The challenge is that, for the overwhelming majority of cancers, we do not fully understand the relationship between the genetic alterations of cancer and the dependencies they cause. To solve this problem, we are creating a “cancer dependency map” by systematically identifying genetic dependencies and small molecule sensitivities and discovering the biomarkers that predict them.

> DepMap scientists are profiling hundreds of cancer cell line models for genomic information and sensitivity to genetic and small molecule perturbations. By triangulating information from these and other large-scale datasets, the hope is to define a landscape of genetic targets for therapeutic development, identify patients who respond to these therapies, and develop a better understanding of the vulnerabilities of cancer.

Biobricks.ai transforms the depmap portal into parquet files. 

# Data overview 
- This directory contains data obtained from the depmap portal.
- The data is stored in parquet format. Descriptions for each column of each file in GTEx can be found below.
- The [depmap R package](https://bioconductor.org/packages/release/data/experiment/html/depmap.html) was used to retrieve data from the portal and retrieve column descriptions. 

# Data Table List 
- `depmap_copyNumber.parquet`
- `depmap_crispr.parquet`
- `depmap_drug_sensitivity.parquet`
- `depmap_metadata.parquet`
- `depmap_mutationCalls.parquet`
- `depmap_proteomic.parquet`
- `depmap_rnai.parquet`
- `depmap_RPPA.parquet`
- `depmap_TPM.parquet`

# Description of Files 

### Data files

`depmap_copyNumber.parquet`

This dataset contains the WES copy number data for genes in cancer cell lines. 
- depmad_id. An ID corresponding to the cancer cell line.
- gene. This column contains the HUGO gene name followed by the Entrez ID in parentheses.
- log_copy_number. Numerical log fold change in copy number for a given gene and cell line. 
- entrez_id. This column contains the Entrez gene id.
- gene_name. This column contains the HUGO gene name.
- cell_line. This contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.

`depmap_crispr.parquet`

This dataset contains the genetic dependency data from CRISPR-Cas9 gene knockout of select genes in various cancer cell lines.
- depmad_id. An ID corresponding to the cancer cell line.
- gene. This column contains the HUGO gene name followed by the Entrez ID in parentheses.
- dependency. Numerical dependency score of a given gene and cell line.
- entrez_id. This column contains the Entrez gene id.
- gene_name. This column contains the HUGO gene name.
- cell_line. This column contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.

`depmap_drug_sensitivity.parquet`

This dataset contains the replicate collapsed logfold change values relative to DMSO, corrected for experimental confounders using ComBat.
- depmad_id. An ID corresponding to the cancer cell line.
- cell_line. This contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.
- compound. This column contains the drug compound name.
- dependency. This column contains the numerical dependency score values for each pair of genes and cell lines.

`depmap_metadata.parquet`

This dataset contains the metadata about cell lines in the depmap portal such as data that can be used for mapping between ‘depmap_id‘ and ‘cell_line‘ name for cancer cell lines.
- depmad_id. An ID corresponding to the cancer cell line.
- cell_line_name. Abbreviated name of the cancer cell line.
- stripped_cell_line_name. The name of the cell line name with punctuation removed.
- cell_line. This column contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.
- aliases. This column contains alises for the cancer cell line.
- cosmic_id. This column contains the Catalogue Of Somatic Mutations In Cancer (COSMIC) ID number.
- sex. Sex of sample.
- source. Source of sample.
- Achilles_n_replicates. Number of replicates.
- cell_line_NNMD. Null-normalized median difference (NNMD) for cell line.
- culture_type. The type of culture used for the sample. 
- culture_medium. The culture medium used for the sample. 
- cas9_activity. This column contains a numerical value for the cas9 activity.
- RRID. This column contains the Resource Identification Portal ID.
- WTSI_master_cell_ID. Wellcome Trust Sanger Institute ID. 
- sample_collection_site. Site of sample collection. 
- primary_or_metastasis. Primary cancer cell line or metastatic.
- primary_disease. Primary Disease (e.g. cancer type).
- subtype_disease. Subtype Disease (e.g. cancer subtype)
- age. Age of the individual from whom the sample derived.
- sanger_id. The Sanger ID.
- additional_info. Additional information about samples.
- lineage. Lineage of cancer cell line.
- lineage_subtype. Subtype of lineage of cancer cell line.
- lineage_sub_subtype. Subtype of subtype of Lineage of cancer cell line.
- lineage_molecular_subtype. Molecular type of Lineage of cancer cell line.

`depmap_mutationCalls.parquet`

This dataset contains the mutation calls from the depmap portal.
- depmad_id. An ID corresponding to the cancer cell line.
- gene_name. The HUGO gene name for the cancer cell line. 
- entrez_id. This column contains the Entrez gene id.
- ncbi_build. NCBI Build (i.e. reference genome).
- chromosome. The chromosome that the gene is found on.
- start_pos. The chromosomal start position.
- end_pos. The chromosomal end position.
- strand. The strand that the gene is located on.
- var_class. Variant Classification. 
- var_type. Variant Type.
- ref_allele. The reference allele.
- tumor_seq_allele1. Allele 1 in the sample.
- dbSNP_RS. Single Nucleotide Polymorphism Database (dbSNP) reference cluster. 
- dbSNP_val_status. dbSNP Validation Status. 
- genome_change. The change in teh genome. 
- annotation_trans. The ID of the transcript. 
- cDNA_change. The change in the cDNA. 
- codon_change. Change in the codon.
- protein_change. Change in the protein.
- is_deleterious. Status of gene knockout on cell lineage.
- is_tcga_hotspot. Whether or not this location is a TCGA hotspot. 
- tcga_hsCnt. Number of times this mutation is observed in TCGA. 
- is_cosmic_hotspot. Whether or not this location is a COSMIC hotspot. 
- cosmic_hsCnt. Number of times this mutation is observed in COSMIC.
- ExAC_AF. The allele frequency from the Exome Aggregation Consortium (ExAC). 
- var_annotation. Annotation for the variant. 
- CGA_WES_AC. The allelic ratio for this variant in Broad WES using a cell line adapted version of the CGA pipeline that includes germline filtering.
- HC_AC. Broad Hybrid capture data from the CCLE2 project. 
- RD_AC. Broad Raindance data from the CCLE project.
- RNAseq_AC. Broad RNAseq data from the CCLE2 project (
- sanger_WES_AC. Sanger WES (called by sanger)
- WGS_AC. 

`depmap_mutationCalls.parquet`

This dataset contains the quantitative profiling of proteins via mass spectrometry from the Gygi lab.
- depmad_id. An ID corresponding to the cancer cell line.
- gene_name. The HUGO gene name for the cancer cell line. 
- entrez_id. This column contains the Entrez gene id.
- protein. Protein name with TenPx. 
- protein_expression. Normalized protein expression.
- protein_id. The Protein ID. 
- desc. Desciption corresponding to protein ID. 
- group_id. The ID for the group that the protein belongs to.
- uniprot. Uniprot ID. 
- uniprot_acc. Uniprot accession ID.
- TenPx. TenPx number. 
- cell_line. This column contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.

`depmap_rnai.parquet`

This dataset contains the cancer dependency of select cancer cell lines for genes found by RNAi gene knockdown.
- gene. This column contains the HUGO gene name followed by the Entrez ID in parentheses.
- cell_line. This column contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.
- dependency. Numerical dependency score of a given gene and cell line.
- entrez_id. This column contains the Entrez gene id.
- gene_name. This column contains the HUGO gene name.
- depmad_id. An ID corresponding to the cancer cell line.

`depmap_RPPA.parquet`

This dataset contains the CCLE Reverse Phase Protein Array (RPPA) cellular model expression data. 
- cell_line. This column contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.
- antibody. Name of antibody targeting protein.
- expression. Observed expression via RPPA of protein coding genes.
- depmad_id. An ID corresponding to the cancer cell line.

`depmap_TPM.parquet`

This dataset contains the CCLE "Transcript Per Million" RNAseq gene expression data for protein coding genes.
- depmad_id. An ID corresponding to the cancer cell line.
- gene. This column contains the HUGO gene name followed by the Entrez ID in parentheses.
- rna_expression. Log fold (log2(TPM+1)) protein expression change
- entrez_id. This column contains the Entrez gene id.
- gene_name. This column contains the HUGO gene name.
- cell_line. This column contains the common Cancer Cell Line Encyclopedia (CCLE) name of the cancer cell line.

# Data can be downloaded using the following commands. To retrieve the data, make sure that dvc is downloaded

**Retrieving a single file**
```
dvc get git@github.com:insilica/oncindex-bricks.git bricks/GTEx/data/depmap_TPM.parquet -o data/depmap_TPM.parquet
```
**It is advised to import files into a project so that you will be able to track changes in the data set**
```
dvc import git@github.com:insilica/oncindex-bricks.git bricks/GTEx/data/ -o data
```
