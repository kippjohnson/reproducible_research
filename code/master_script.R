
## R Script for main analysis
## Name:
## Date:
## Email:

### Delete this and replace with your own code :-)

## Load required packages
library(lme4)

## Set working directory
setwd('/home/rstudio')

## Read in dataset
infile <- read.csv("data/penicillin.csv")

## Code
fit1 <- lmer(diameter ~ 1 + (1 | plate) + (1 | sample), data=infile)
print(summary(fit1))
