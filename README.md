# CWL / Snakemake / Nextflow

14/01/25 Show & Tell presentation on the differences between CWL, Snakemake, and Nextflow.

<https://uomresearchit.github.io/CWL-Snakemake-Nextflow>

You can play with the examples using the Dockerfile provided in this repository:

```bash
docker buildx build -t workflow-comparison ./
docker run -it workflow-comparison

cwltool cwl/process.cwl cwl/inputs.yml
snakemake -c1 -s snakemake/process.smk
nextflow run nextflow/process.nf
```
