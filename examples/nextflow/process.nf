
// run with: nextflow run nextflow/process.nf

params.data = "$launchDir/data/monkeys.csv"
params.results = "$launchDir/results"

process process_data {

    publishDir params.results

    input:
    path data

    output:
    path "${data.baseName}.txt" 
    path "${data.baseName}.log"

    script:
    // requires dummy.sh to be in $projectDir/bin
    """
    dummy.sh ${data} ${data.baseName}.txt > ${data.baseName}.log
    """ 
}

workflow {
    process_data(params.data)
}