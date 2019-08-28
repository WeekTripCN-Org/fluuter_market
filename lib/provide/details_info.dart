import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/details.dart';
import '../service/service_method.dart';

/**
 * 商品详细相关业务逻辑
 */
class DetailsInfoProvide with ChangeNotifier{
  DetailsModel goodsInfo = null;

  // 从后台获取商品信息
  getGoodsInfo(String id){
    var formData = {'goodId': id};
    request('getGoodDetailById', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);

      notifyListeners();
    });
  }
}