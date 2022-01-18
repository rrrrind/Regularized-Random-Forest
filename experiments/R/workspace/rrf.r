# Regularized Random Forestのパッケージ
library(RRF)
# 乱数の固定
set.seed(1)

# pythonからもらうのは
# ntree, nodesize

# python(pandas)からデータをもらったと仮定する
# (200,10)のデータフレーム
x_train <- data.frame(
  "feature1" = seq(1,100000,length=200), "feature2" = seq(1,50000,length=200),
  "feature3" = seq(1,10000,length=200), "feature4" = seq(1,5000,length=200),
  "feature5" = seq(1,1000,length=200), "feature6" = seq(1,500,length=200),
  "feature7" = seq(1,100,length=200), "feature8" = seq(1,50,length=200),
  "feature9" = seq(1,10,length=200), "feature10" = seq(1,5,length=200)
)
# (20,10)のデータフレーム
x_test <- data.frame(
  "feature1" = seq(1,100000,length=20), "feature2" = seq(1,50000,length=20),
  "feature3" = seq(1,10000,length=20), "feature4" = seq(1,5000,length=20),
  "feature5" = seq(1,1000,length=20), "feature6" = seq(1,500,length=20),
  "feature7" = seq(1,100,length=20), "feature8" = seq(1,50,length=20),
  "feature9" = seq(1,10,length=20), "feature10" = seq(1,5,length=20)
)

y_train <- rnorm(200)
y_test <- rnorm(200)


# rrfの適用
rrf <- RRF(
  x=x_train, y=y_train,
  ntree= 500, nodesize=5, importance=TRUE, do.trace=TRUE, corr.bias=FALSE, flagReg = 1)


rrf$feaSet
importance(rrf)
varImpPlot(rrf)

predict(rrf, x_test)




rrf$mse
