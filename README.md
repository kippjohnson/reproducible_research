# reproducible_research
Integrating Git, Docker, and Continuous Integration for continuous research

# Introduction

The goal of this document is to provide brief but comprehensive instructions for how to setup a reproducible workflow using Git, Docker, and Continuous Analysis [as suggested by Brett Beaulieu-Jones and Casey Greene in Nature Biotechnology](http://www.nature.com/nbt/journal/v35/n4/abs/nbt.3780.html "Reproducibility of computational workflows is automated using continuous analysis").

The end product will be a Docker container that contains all of the code and data necessary to ensure computational reproducibility of your work or model. Docker is great because it allows a third party to run the exact same code by simplying downloading your Docker container. We will use Git for version control coupled with Continuous Analysis. There are a number of continuous analysis tools; I found that I prefer [travis-ci](https://travis-ci.com) because it is relatively straightforward. It also gives you unlimited free open-source projects and, for students, unlimited private projects.

 I will use R throughout this document, as it is what I do most of the work in. It should be possible to relatively easily switch to other languages.

 At the end, ideally, you should be able to clone this respository and then have a repository which is ready to substitute with your own code!

# Setup

## Github

### Option 1: Clone this repository and be on your way

This repository is set up as an example repository which is almost ready to be used in the git-docker-travis_ci workflow. After you have installed Docker and Travis-CI, you can just substitute your own code here and be on your way.

To clone this repository:

```shell
git clone https://github.com/kippjohnson/reproducible_research.git
```


### Option 2: Create an empty repository and fill it with required files
* Make an account at [Github](https://www.github.com/) if you do not already have one.
* Every project should have its own repository. The easiest way to create a new repository is to create one through the online web portal, and then using the following shell command to clone it to your hard drive:

```shell
git clone https://github.com/your_username/your_repository_name.git
```

This will copy the empty repository to your hard drive. The only files should be a LICENSE file (which you chose online), a README.md file, and a .git directory. You will also need to create your own Dockerfile and .travis.yml file, at a minimum

## Docker

Download and install docker for Mac OS here: [https://www.docker.com/docker-mac](https://www.docker.com/docker-mac)

Also make sure to create a Docker ID and Password. These give you access to Docker Hub, which allows you to easily share your Docker Containers with other researchers.

Note: I do not recommend adding a special characters in your password, as you will have to escape these for compatibility with Travis-CI and bash. If this doesn't bother you, then use all of the $#~ you with!

## Travis-CI

If you are a student, sign up for the Github Student Developer Pack with your Github ID [here](https://education.github.com/pack). Then/otherwise go to the [Travis-CI website for private repositories](https://travis-ci.com) or the [Travis-CI repository for public repositories]((https://travis-ci.com)) and link your Github account. You should see something like the following picture:

![alt text](https://github.com/kippjohnson/reproducible_research/img/Travis_CI_private_repos.png "Travis CI Screenshot")
