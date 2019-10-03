import 'package:flutter/material.dart';
import 'package:jupiter/Components/securetext.dart';
import 'package:jupiter/Components/textinput.dart';
import 'package:jupiter/Services/jupiter_utlis.dart';
import 'package:jupiter/Components/flat_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
bool initialized;
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

class SignIn extends StatefulWidget {
  @override _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  @override void initState() {
    super.initState();
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        // print(token);
      });
    });
  }

  @override Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child:Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Expanded(
                flex: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                      // color:Colors.green
                      )
                    ),
                    Expanded(
                      flex: 4,
                      child:Container(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:Container(
                                        // color:Colors.grey
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset('assets/images/IOS Logo.png'),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child:Container(
                                        // color:Colors.lightGreen
                                      ),
                                    ),
                                    Expanded(
                                      flex:2,
                                      child:Container(
                                        child:  TextInput(
                                          text: 'USERNAME',
                                          textController: emailController
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child:Container(
                                        child:SecureText(
                                          text: 'PASSWORD',
                                          textController: passwordController
                                        )
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: new Button(route:'/forget',text:"FORGET PASSWORD?",textColor:Colors.black,size:queryData.size.width * devicePixelRatio * 0.015)
                                      )
                                    ),
                                  ],
                                )
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // color:Colors.red
                              ),
                              flex: 2,
                            )
                          ],
                        ),
                      )
                    ),
                    Expanded(
                      child:Container(
                        // color:Colors.blue
                      )
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: (queryData.size.width * devicePixelRatio),
                  child:Button(route:null,text: "SIGN IN",size:queryData.size.width * devicePixelRatio*0.015,textColor: Colors.white,todo:checkNull,buttonColor: Colors.green)
                ),
              )
            ]
          )
        )
      )
    );
  }
}