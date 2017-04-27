
# This container has base R packages and R Studio already installed
FROM rocker/r-studio

# Replace with your own information
MAINTAINER "Kipp Johnson" kipp.william.johnson@gmail.com

# Copy required data files into the docker
COPY /data /home/rstudio/data/
COPY /code /home/rstudio/code/

# Packages are already installed
RUN Rscript /home/rstudio/code/install_packages.R

# Run the actual predictive models script!
RUN Rscript /home/rstudio/code/master_script.R
