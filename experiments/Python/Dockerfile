FROM  python:3.8

RUN apt update && apt -y upgrade

#　Rのインストール
RUN apt -y install --no-install-recommends r-base
# Regularized Random Forestのインストールに必要
RUN apt -y install gfortran
# Regularized Random Forestパッケージのインストール
RUN R -e "install.packages('RRF', dependencies = TRUE, repos='http://cran.rstudio.com/')"

# pythonのライブラリ
WORKDIR /home
COPY requirements.txt ${PWD}
RUN python3.8 -m pip install -r requirements.txt

# 作業ディレクトリ
WORKDIR /home/workspace
