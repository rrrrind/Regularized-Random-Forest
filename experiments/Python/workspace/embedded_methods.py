import numpy as np
import pandas as pd
import pyper

class regularized_random_forest:
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
        