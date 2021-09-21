import 'package:deviceselllingapp/pages/cart_page.dart';
import 'package:deviceselllingapp/pages/homepage.dart';
import 'package:deviceselllingapp/pages/login_page.dart';
import 'package:deviceselllingapp/utils/routes.dart';
import 'package:deviceselllingapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';


//Todo VxState is a state management library built for Flutter apps with focus on simplicity
void main() {
  runApp(
      VxState(
          store: MyStore(),
          child: MyApp()
      ));
}

class MyApp extends StatelessWidget {

  int days = 30;
  String name = "Shakeeb";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      // What are routes
      // Routes basically are paths. Like we can say this is a green train path or we can say this is a path for
      // metro bus only
      // initialRoute: "/HomePage",
      routes: {
        "/": (context)=> LoginPage(),
        MyRoutes.homeRoute: (context)=> HomePage(),
        MyRoutes.loginRoute: (context)=> LoginPage(),
        MyRoutes.cartRoute:  (context)=> CartPage(),
      },
    );
  }
}


