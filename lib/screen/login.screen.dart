
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_flutter/pages/home.page.dart';
import 'package:netflix_flutter/routes/app.routes.dart';
import 'package:netflix_flutter/service/notifier/authentication.notifier.dart';
import 'package:netflix_flutter/widgets/my.buttom.widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    emailConroller = TextEditingController();
    passwordcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 90),
            child:Column(
          children: [
            Image.asset(
              "assets/images/pngwing.com.png",
              height: 300,
            ), 
            SizedBox(
             height: 20,
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 5,end: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 TextFormField(
                    controller: emailConroller,
                    decoration:  InputDecoration(hintText: "Enter email",
                     fillColor: Colors.grey[100],
                     filled: true,
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                )),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    decoration:  InputDecoration(hintText: "Enter password",
                    fillColor: Colors.grey[100],
                    filled: true,
                    hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                     border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(
                      child: MyButtonWidget(
                        text: "Login",
                        color: Colors.blue,
                        onPress: () async{
                          String email = emailConroller.text;
                                String password = passwordcontroller.text;
                                if (email.isNotEmpty && password.isNotEmpty) {
                                  await authenticationNotifier.login(
                                      email: email, password: password);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(content: Text("Fill the credentials")));
                                }
                               if (email.isEmpty||password.isEmpty) {
                                 Navigator.of(context).pushNamed(AppRoutes.SingupRoute);
                               } else {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                               }
                      },
                    ),
                  ),
                ],
              ),
          )]),
            ),
          ])),
        ],
      ));
  }
}
 