<!---- Provide an overview of what is being achieved in this repo ---->
# ESA NASA Foundation Model Workshop 2025

This repository contains materials for hands on sessions in ESA NASA Foundation Model Workshop 2025. There are three tracks: [Using Geospatial AI FM](/Track%201%20(EO)/), [LLMs in Use for EO](/Track%202%20(LLMs%20for%20EO)/), and [Benchmark FM4EO](/Track%201%20(EO)/).

Each track have notebooks that can be ran in the provided environment and are self contained. If desired, these notebooks can be ran in any jupyterlab environment (See [Environment Setup](#environment-setup)).

# Slides:

# Prerequisites
1. Basic understanding of git
2. Python and jupyter environment knowledge
3. Basic understanding of docker
4. Basic understanding of cloud services
5. Machine Learning knowledge
6. Some understanding of Geo-spatial datasets.

# Getting started
1. Navigate to [Login URL](https://workshop-domain-wfs0nk4u.auth.us-west-2.amazoncognito.com/login?client_id=809mbkpbfj5mddgb7dismf3g0&response_type=code&scope=aws.cognito.signin.user.admin+openid+profile&redirect_uri=https://ngsa42o8k5.execute-api.us-west-2.amazonaws.com/invoke)
2. Log in using the credential provided
![Login with username and password](images/login.png)
3. Once the Studio starts, Click on JupyterLab
![Sagemaker studio](images/sagemaker-studio.png)
![JupyterLab spaces](images/jupyterlab-spaces.png)
4. <code style="color : red">A JupyterLab space should already be availble for you. If not, please follow along the next steps. Skip to Step 9 if the environment is already available.</code>
5. Click `Create JupyterLab Space`
![JupyterLab spaces](images/create-jupyterlab-env.png)
6. Give it a name. Eg: `Workshop`
7. Once initialized, change Instance type to `ml.p3.2xlarge` and storage to `150`
8. Click on `Run Space`. If it throws an error, you might have to pick an Image. The top setting called `Latest` works.
9. If a space is already running, click on "open". This should open a new tab with the jupyterlab environment.
![Open](/images/workshop-jypyterlab-app-list.png)
![Jupyterlab Environment](/images/jupyter-lab-home-page.png)


# Environment setup
The following steps are to be followed if the `ESA-NASA-workshop-2025` folder is not available in your jupyterlab environment. If it is already available skip to 2.

1. Clone this repository `git clone https://github.com/nasa-impact/ESA-NASA-workshop-2025.git`
```
a. Click `git`
b. Click on `Git Clone Repo`
![Git clone](images/git-clone-1.png)
c. Paste `https://github.com/nasa-impact/ESA-NASA-workshop-2025.git` and Click on `Clone`.
![Cloned repository](images/smd-hls-git-clone.png)
![Cloned repository](images/smd-hls-cloned-content.png)
```

2. Check conda environments

a. Open a terminal
![Home page](/images/jupyter-lab-home-page.png)

b. Activate conda environment using `source /opt/conda/bin/activate`

c. List conda environments `conda env list`

d. Activate `indus_eve` environment: `conda activate indus_eve`

e. Open python terminal: `python`

f. Import torch: `import torch`

![A](/images/check_environment.png)



<code style="color : red">Run the following only if there are issues with the conda environments</code>

If there are any issues with the environments, conda environments might need to be removed and reinstalled via the terminal:
```
conda activate base
conda remove -n indus_eve --all -y
conda remove -n prithvi_eo --all -y
conda remove -n prithvi_wx --all -y

source /home/sagemaker/ESA-NASA-workshop-2025/setup/setup.sh
```
[Please check the environment once the environments are set.](#environment-setup)

**Notebooks are available for each track which can be ran in the jupyterlab environment.**

**Note: Track 1 and Track 3 make heavy usage of `terratorch`. If help is required regarding terratorch in Track 1 and Track 3, help will be available in person or in [terratorch slack](https://join.slack.com/t/terratorch/shared_invite/zt-34uzp28xx-xz1VHvu9vCN1ffx7fd~dGw).**
