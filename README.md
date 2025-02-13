[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

# Data Carpentry for Social Sciences & Humanities  - Notes from R lesson
In this repository you will find scripts and documents created during the [Data Carpentry for Social Sciences & Humanities](https://ubvu.github.io/2023-02-20-ldev-online/) workshop organised by Leiden University, TU Delft, Erasmus University Rotterdam, VU Amsterdam on Feb 20, 21, 23, 24, 2023.

## Usage Learners 
The repository should mimic the project structure of the R project that has been created by the instructors during the Data Carpentry. 
- In the files list above, find a folder icon with the name of the project that the instructor has created. This folder will likely be called `data-carpentry`.
- Go to the file in which the instructor is now coding:
  - **Day 2:** 
     - [intro-r.R](https://github.com/4TUResearchData-Carpentries/2023-02-Data-Carpentry-Notes/blob/main/data-carpentry/scripts/intro-r.R)
     - [starting-data.R](https://github.com/4TUResearchData-Carpentries/2023-02-Data-Carpentry-Notes/blob/main/data-carpentry/scripts/starting-data.R)
  - **Day 3:** [data-wrangling.R](https://github.com/4TUResearchData-Carpentries/2023-02-Data-Carpentry-Notes/blob/main/data-carpentry/scripts/data-wrangling.R)
  - **Day 4:** [awesome-report.Rmd](https://github.com/4TUResearchData-Carpentries/2023-02-Data-Carpentry-Notes/blob/main/data-carpentry/documents/awesome-report.Rmd)
- You don't see the most recent lines of code? Refresh the page and see the new commands coming in!

> *Note*: you will only see non-empty folders. You still need to create folders to follow the workshop smoothly.

## Usage Instructors 
Instructors can automatically update repository using [gitautopush](https://pypi.org/project/gitautopush/). 

### Prerequisites for the solution

To work with the solution instructors need to have the following setup ready:
- Python and pip installed
- Git installed
- GitHub account added to the repository as a Contributor 

### Steps

- `pip install gitautopush`
- `git clone` this repository to your local directory
- if you have cloned the repository a while ago, `git pull` to avoid conflicts
- in terminal, start observing the folder by command: `gitautopush /path/to/my/repo/folder`
- you can also setup a delay between live coding and the notes in the repository by adding `--sleep <INT>` argument,  `INT` being the amount of time (in seconds) to wait in between attempts to synchronize.
- in the folder of the repository, create a new R script/ Rmarkdown and save the changes
- see if it automatically pushes to the repository
- save changes often with `Ctrl+S` in order for the changes to be pushed o the repository
- once you finish your lesson, make sure to close `gitautopush` with `Ctrl+C`  

### Troubleshooting
- git requires SSH authentication
    - Add [SSH agent](https://stackoverflow.com/questions/10032461/git-keeps-asking-me-for-my-ssh-key-passphrase): write `eval $(ssh-agent)` followed by `ssh-add` in your terminal
    - If you don't have SSH key set up yet, set it up without a passphrase (just hit enter when prompted for it)
    - You can try with `git clone` using  `https` (worked for me but normally not recommended)
- ValueError: A `git status` command didn't work, are you sure this is a git repository?
    - It might be occuring when there are already some changes to be staged once you launch `gitautopush`. First, run `gitautopush`, then start creating files or making changes to the existing ones. 
    - Another thing to try is to first commit and push one file manually to the repository, once you have done that and no changes are staged run `gitautopush`



This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

[![License: CC BY 4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/)

