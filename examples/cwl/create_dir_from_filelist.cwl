cwlVersion: v1.2
class: ExpressionTool
label: create_dir_from_filelist.cwl
doc: |
  From: https://github.com/UoMResearchIT/atmos-tools-library/

requirements:
  InlineJavascriptRequirement: {}
inputs:
  files: File[]
  folder: string
outputs:
  dir: Directory
expression: |
  ${
  return {"dir": {"class": "Directory", "basename": inputs.folder, "listing": inputs.files}};
  }