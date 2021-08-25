import 'package:catalog/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog/core/store.dart';
import 'package:catalog/pages/cart_page.dart';
import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/themes.dart';

import 'pages/home_page.dart';

void main() {
  runApp(VxState(store: MyStore(),child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(), 
      routerDelegate: VxNavigator(routes: {
        "/": (_,__) => MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute:(_,__)=> MaterialPage(child: HomePage()), 
        MyRoutes.homeDetailsRoute:(_,params)=> MaterialPage(child: HomeDetailpage(catalog: params,)),
        MyRoutes.homeRoute:(_,__)=> MaterialPage(child: HomePage()),
        MyRoutes.loginRoute: (_,__)=> MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_,__)=> MaterialPage(child: Cartpage()),
        

      }),
      

      // initialRoute: MyRoutes.homeRoute,
      // routes: {
      //   "/": (context) => LoginPage(),
      //   MyRoutes.homeRoute:(context)=> HomePage(),
      //   MyRoutes.loginRoute: (context)=> LoginPage(),
      //   MyRoutes.cartRoute: (context)=> Cartpage(),
      // },
       
    );
  }
}