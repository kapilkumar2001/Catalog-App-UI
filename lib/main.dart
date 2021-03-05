import 'package:catalog_app2/pages/catalog_header.dart';
import 'package:catalog_app2/pages/catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/utils/routes.dart';
import 'package:catalog_app2/widgets/drawer.dart';
import 'package:catalog_app2/widgets/item_widget.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'dart:convert';
import 'pages/loginpage.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/" : (context) => loginpage(),
        MyRoutes.listRoute : (context) => ListPage(),
        MyRoutes.loginRoute : (context) => loginpage(),
        MyRoutes.gridRoute : (context) => GridPage(),
      },
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async
  {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    final decodecData = jsonDecode(catalogjson);
    var productData = decodecData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      )
    );
  }
}










