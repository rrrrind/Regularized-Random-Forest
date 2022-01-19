# Feature Selection with Regularized Random Forest for Python
## About
[Regularized Random Forest](https://www.rdocumentation.org/packages/RRF/versions/1.9.1/topics/RRF)がRでしか用意されていないので，Pythonでも使えるようにした．  
ソースコードはmoduleにあります．  
[rrf_arguments_ja.txt](https://github.com/rrrrind/Regularized-Random-Forest/blob/main/rrf_arguments_ja.txt)には，RRFの詳細パラメータが記載してあります．  
[rrf_value_ja.txt](https://github.com/rrrrind/Regularized-Random-Forest/blob/main/rrf_value_ja.txt)には，RRFの詳細関数が記載してあります．  

## How to Use  
from embedded_methods import regularized_random_forest as RRF  
model = RRF(ntree=600, nodesize=5, coefReg=0.8)  
results = model.fit_pred(x_train, y_train, x_val, x_test)  

### Input  
- x_train, x_val, x_test(pd.DataFrame) : 学習/バリデーション/テストデータの説明変数   
- y_train(np.array) : 学習データの目的変数  
- ntree, nodesize, coefReg : RRFのパラメータ，詳細は"[rrf_arguments_ja.txt](https://github.com/rrrrind/Regularized-Random-Forest/blob/main/rrf_arguments_ja.txt)"  

### Output  
- results[0] : 学習データにおける予測値  
- results[1] : バリデーションデータにおける予測値  
- results[2] : テストデータにおける予測値  
- results[3] : 重要な特徴量  
- results[4] : 特徴量重要度  

## Require  
### Python  
- numpy  
- pyper  
- pandas  

### R  
- apt -y install --no-install-recommends r-base  
- apt -y install gfortran  
- R -e "install.packages('RRF', dependencies = TRUE, repos='http://cran.rstudio.com/')"  
