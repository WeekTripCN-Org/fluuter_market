import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage({Key key, this.goodsId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('商品ID为：${goodsId}'),
    );
  }
}
