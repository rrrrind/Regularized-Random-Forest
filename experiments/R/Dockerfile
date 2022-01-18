FROM rocker/verse:3.6.3

RUN apt update
RUN apt upgrade -y 

# Regularized Random Forestのパッケージ
RUN R -e "install.packages('RRF', dependencies = TRUE, repos='http://cran.rstudio.com/')"

# 美麗なグラフを描くためのパッケージ
RUN R -e "install.packages('ggplot2', dependencies = TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggfortify', dependencies = TRUE, repos='http://cran.rstudio.com/')"

WORKDIR /home/rstudio/workspace