import numpy as np
import pandas as pd
import pyper

class regularized_random_forest:
    """docstring
    About：
        Rの『Regularized Random Forest』パッケージを
        Pythonで使えるようにした
        
    How to use:
        from embedded_methods import regularized_random_forest as RRF
        model = RRF(ntree=600, nodesize=10)
        result = model.fit_pred(x_train, y_train, x_val, x_test)
        
    Input:
        x_train, x_val, x_test(pd.DataFrame) : 学習/バリデーション/テストデータの説明変数
        y_train(np.array) : 学習データの目的変数
        ntree, nodesize : RRFのパラメータ
        
    Output:
        result[0] : 学習データにおける予測値
        result[1] : バリデーションデータにおける予測値
        result[2] : テストデータにおける予測値
        result[3] : 重要な特徴量
        result[4] : 特徴量重要度
    """
    def __init__(self, ntree, nodesize):
        self.ntree = ntree
        self.nodesize = nodesize
        
    def fit_pred(self, x_train, y_train, x_val, x_test):
        r = self._set_r_params(x_train, y_train, x_val, x_test)
        self._fit(r)
        result = self._predict(r)
        return result
        
    def _set_r_params(self, x_train, y_train, x_val, x_test):
        # Rのインスタンスの作成
        r = pyper.R(use_pandas='True')
        
        # 入力データ
        r.assign("X_TRAIN", x_train)
        r.assign("Y_TRAIN", y_train)
        r.assign("X_VAL", x_val)
        r.assign("X_TEST", x_test)
        
        # RRFのパラメータ
        r.assign("NTREE", self.ntree)
        r.assign("NODESIZE", self.nodesize)
        
        # Rモジュール(自作関数)の呼び出し
        r("source(file='regularized_random_forest.R')")
        
        return r
    
    def _fit(self,r):
        # Rのmain関数を呼び出し，結果をresultへ代入する
        return r("result <- main()")
    
    def _predict(self,r):
        # Rのresultから値を持ってくる
        return r.get("result")
        