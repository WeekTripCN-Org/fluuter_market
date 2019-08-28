import 'package:flutter/material.dart';
import 'pages/index_page.dart';

import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';

// 注册路由
import 'package:fluro/fluro.dart';
import './routers/application.dart';
import './routers/routes.dart';

void main(){
  var counter = Counter();
  var childCategory = ChildCategory();
  var providers = Providers();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 路由
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child:  MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,  // 去除右上角 Debug 标签

        onGenerateRoute: Application.router.generator,  // 路由

        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}