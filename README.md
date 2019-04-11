# Git Tool R

This package builds on the git2r package and allows the user to make automatic commits.

Making automatic commits is important for data archiving and versioning.

## Use Case

The main usage of this package is to connected versioned data and output to the code used to create the data and output.

## Installation

`devtools::install_github("holmesjoli/gitToolR")`

## Workflow

1. Create directory structure in project root
`gitToolR::make_dirs("path_to_project_root")`

2. Develop code and version code on git

3. Write out data to the `Data/Processed/Current` folder

4. Write out output to the `Deliverables/Current` folder

5. C:/Users/jh111/Projects/test folder/file_to_zip

