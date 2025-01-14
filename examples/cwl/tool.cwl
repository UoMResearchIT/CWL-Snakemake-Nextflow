cwlVersion: v1.2
class: CommandLineTool
label: dummy.sh tool wrapper
doc: |
    Example tool wrapper, for dummy.sh script
    (copies a <data>.csv file to <data>.txt
    and echoes a message to <data>.log)

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entryname: dummy.sh
        entry: { $include: ../dummy.sh }

baseCommand: [bash, dummy.sh]
arguments: 
  - valueFrom: "out.txt"
    position: 2

inputs:
  data:
    label: CSV file to process
    type: File
    inputBinding: {position: 1}

stdout: $(inputs.data.nameroot + ".log")

outputs:
  results_file:
    type: File
    outputBinding:
        glob: "out.txt"
        outputEval: ${self[0].basename = inputs.data.nameroot + ".txt"; return self;}
  log_file:
      type: stdout