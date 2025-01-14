# run with: snakemake -c1 -s process.smk

rule all:
    input: "results/monkeys.txt"

rule process_data:
    input:
        "data/{data}.csv"
    output:
        "results/{data}.txt"
    log:
        "results/{data}.log"
    shell:
        "dummy.sh {input} {output} > {log}"

