
# This container has base R packages and R Studio already installed
FROM rocker/rstudio

# Replace with your own information
MAINTAINER "Kipp Johnson" kipp.william.johnson@gmail.com

# Copy required data files and code into the docker
COPY /data /home/rstudio/data/
COPY /code /home/rstudio/code/

# Install any required R packages
RUN Rscript /home/rstudio/code/install_packages.R

# Note: Installing R packages takes a long time.
#
# One possible workaround is to install the R packages
# on a docker container, and then save that docker container.
#
# Finally, you then use that saved docker container as the 
# starting container, instead of the rocker/rstudio container
# above.

# Run the actual analyis script
RUN Rscript /home/rstudio/code/master_script.R

# Of course, you can/should run additional scripts using the
# same syntax as above
