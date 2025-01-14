#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow
doc: |
    Example workflow, that calls dummy.sh script
    (copies a *.csv file changing extension, and
    echoes a description to stdout)

requirements:
  MultipleInputFeatureRequirement: {}

inputs:
  data_file: File
  results_folder:
    type: string
    default: "results"
outputs:
  results_dir:
    type: Directory
    outputSource: move_to_folder/dir

steps:
  process_data:
    run: tool.cwl
    in:
      data: data_file
    out: [results_file, log_file]
    
  move_to_folder:
    run: create_dir_from_filelist.cwl
    in:
      folder: results_folder
      files: 
        - process_data/results_file
        - process_data/log_file
    
    out: [dir]