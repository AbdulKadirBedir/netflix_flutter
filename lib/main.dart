import 'package:flutter/material.dart';
import 'package:netflix_flutter/routes/app.routes.dart';
import 'package:netflix_flutter/screen/login.screen.dart';
import 'package:provider/provider.dart';

import 'service/app/app.provider.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Core(),
      providers: AppProviders.providers);
  }
}
class Core extends StatelessWidget {
  Core({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.LoginRoute, 
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}



