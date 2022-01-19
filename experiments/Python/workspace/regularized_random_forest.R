# Regularized Random Forestのパッケージ
library(RRF)
# 乱数の固定
set.seed(1)

# --------------------------------------------------------------------------
# Python側から
# X_TRAIN, Y_TRAIN, X_VAL, Y_VAL, X_TEST, NTREE, NODESIZEを入力してもらう
# R側からはReturnとして
# X_TRAINの予測値, X_VALの予測値, X_TESTの予測値, 重要な特徴量, 特徴量重要度
# を返す
# --------------------------------------------------------------------------

main <- function(){
  rrf <- build_rrf(X_TRAIN, Y_TRAIN, NTREE, NODESIZE)
  rrf_res <- get_rrf_res(rrf, X_VAL, X_TEST)
  return(rrf_res)
}

running <- function(x_train, y_train, ntree, nodesize){
  # rrfの構築と学習
  # パラメータについては次を参照
  # https://www.rdocumentation.org/packages/RRF/versions/1.9.1/topics/RRF
  rrf <- RRF(
    x= x_train, y= y_train, 
    ntree= ntree, nodesize= nodesize, importance= TRUE,
    do.trace= TRUE, keep.forest= TRUE, corr.bias= FALSE, flagReg= 1)
  
  # 学習済みモデルを返す
  return(rrf)
}

get_rrf_res <- function(rrf, x_val, x_test){
  # 学習データにおける予測値
  pred_train <- rrf$predicted
  # バリデーションデータにおける予測値
  pred_val <- predict(rrf, x_val)
  # テストデータにおける予測値
  pred_test <- predict(rrf, x_test)
  # 重要な特徴量
  imp_feat = rrf$feaSet - 1 # pythonとindex番号が違う
  # 特徴量重要度
  imp_feat_val = importance(rrf)
  
  return(list(pred_train, pred_val, pred_test, imp_feat, imp_feat_val))
}

# main関数
main()
