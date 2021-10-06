
import 'package:netflix_flutter/screen/login.screen.dart';
import 'package:netflix_flutter/signup/signup.screen.dart';

class AppRoutes{
    static const String LoginRoute = "/login";
    static const String SingupRoute = "/Singup";

    static final routes = {
     LoginRoute : (context)=> LoginScreen(),
     SingupRoute : (context)=> SignupScreen()
    };

    
}
