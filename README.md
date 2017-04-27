# reproducible_research
Integrating Git, Docker, and Continuous Integration for reproducible research.

This repository may be cloned to set up a minimal working environment with Docker and Travis-CI.

# Introduction

## Goals

There are two goals for this repository:

1. To provide brief but comprehensive instructions for how to setup a reproducible workflow using Git, Docker, and Continuous Integration [as suggested by Brett Beaulieu-Jones and Casey Greene in Nature Biotechnology](http://www.nature.com/nbt/journal/v35/n4/abs/nbt.3780.html "Reproducibility of computational workflows is automated using continuous analysis").

2. To actually be a working Git-Docker-Travis CI environment which can easily be cloned and put to other uses.

The end product will be a Docker container that contains all of the code and data necessary to ensure computational reproducibility of your work or model. Docker allows a third party to run the exact same code by simplying downloading your Docker container. We will use Git for version control coupled with Continuous Analysis. There are a number of continuous analysis tools; I found that I prefer [travis-ci](https://travis-ci.com) because it is relatively straightforward. It also gives you unlimited free open-source projects. Students also get unlimited private projects for free.

 I use R in this repository, as it is the language I do most of my work in. It should be possible to relatively easily switch to other languages. At the end, ideally, you should be able to clone this repository and then have a repository which is ready to substitute with your own code.

# Setup

## Github

### Cloning this repository

This repository is set up as an example repository which is almost ready to be used in the git-docker-travis_ci workflow. After you have installed Docker and Travis-CI, you can just substitute your own code here and be on your way.

To clone this repository:

```shell
git clone https://github.com/kippjohnson/reproducible_research.git
```

## Docker

Download and install docker for Mac OS here: [https://www.docker.com/docker-mac](https://www.docker.com/docker-mac)

Also make sure to create a Docker ID and Password. These give you access to Docker Hub, which allows you to easily share your Docker Containers with other researchers.

Note: I do not recommend adding a special characters in your password, as you will have to escape these for compatibility with Travis-CI and bash. If this doesn't bother you, then use all of the $#~ you wish!

## Travis-CI

### Signing up

If you are a student, sign up for the Github Student Developer Pack with your Github ID [here](https://education.github.com/pack). Then/otherwise go to the [Travis-CI website for private repositories](https://travis-ci.com) (URL ends with .com) or the [Travis-CI repository for public repositories](https://travis-ci.org) (URL ends with .org) and link your Github account. You should see something like the following picture:

![alt text](https://github.com/kippjohnson/reproducible_research/blob/master/img/Travis_CI_private_repos.png?raw=true "Travis CI Screenshot")

### Adding your Docker login information

Check the box for your desired repository and make sure it's on! Then, go into the settings for your specifed repository. You will need to set the following two environmental variables in order to push from Travis-CI servers to the Docker Hub:

* DOCKER_USERNAME
* DOCKER_PASSWORD

It should look something like the following:

![alt text](https://github.com/kippjohnson/reproducible_research/blob/master/img/travis_ci_docker_info.png?raw=true "Travis CI Docker Info")

# Repository Personalization

Now that you have all of the tools set up, you will need to change the code so that it works with your Github, Docker, and Travis-CI accounts instead of mine!

1. *Edit .travis.yml*

You will need to change two lines in the Travis-CI setup file:

* First, change the lines ```  - docker build -t kippjohnson/reproducible_research:latest . ``` by substituting your Docker username for "kippjohnson". Choose whatever you would like to name your project and replace "reproducible_research" with that.

* Second, change ```- docker push kippjohnson/reproducible_research``` to the same values that you stored above.

2. *Edit Dockerfile*

Change the MAINTAINER line in Dockerfile to your own name and email address.

3. *Edit Github repository name*

You probably don't want your Github repository to be named "reproducible_research". You can change the name on Github using the instructions [here](https://help.github.com/articles/renaming-a-repository/).


# Running Code

## How this environment works

The file "Dockerfile" contains a minimal set of instructions to Docker which tells it how to build a particular Docker container. After building the Docker container, it will copy data and code stored in this repository (in the /data and /code directories, respectively) into the Docker. Finally, it will run code from the code/ directory using the Rscript command.

## lme4 mixed model example

This environment currently has two R scripts:

* install_packages.R

This script installs the "lme4" R package on the Docker container. It must be run before any scripts which call it.

* master_script.R

This script runs a linear mixed model analysis on the dataset "penicillin.csv" which is already saved in the data directory of the repository.

## Final Steps

Travis-CI runs every time that you commit your code to Github. So, change the code in install_packages.R or master_script.R, then run the following commands:

```
git add -A
git commit -m "Commit with customized code"
git push origin master
```

If all goes well, your push to Github should be working. Go to [Travis-CI.com](https://travis-ci.com) or [Travis-CI.org](https://travis-ci.org), where you should see the build of your project commencing. Congratulations!
