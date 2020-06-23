# Github Data Research
Research on GitHub collaboration patterns.

## Environment
In the repo directory, run
```
conda env create -f binder/environment.yml 
conda activate githubdata
jupyter labextension install @jupyter-widgets/jupyterlab-manager
conda install ipykernel
python3 -m ipykernel install --user --name=githubdata
conda deactivate
```
Package environment:
```
conda-pack
```

To remove kernel in jupyter
```
jupyter kernelspec list
jupyter kernelspec uninstall unwanted-kernel
```
## Data Collection

Folder "data_collection" stores queries that collects data in the sample. 

- Start from PyPI repositories (based on 
[Valiev, Vasilescu, Herbsleb (2018)](https://zenodo.org/record/1297925#.XrsPQBP0kWo)),
track commit history of all authors including contributions to those that are not in PyPI.

- Complementary data:
	unreleased Python data, also need to track all author's contribution history

## Exploratory Data Analysis

Folder for notebooks and results for exploratory data analysis (reduced-form).

## Model Estimation

Folder for structural model and related estimation codes.

## Counterfactual Analysis

Folder for codes of counterfactual Analysis
