import 'package:flutter/material.dart';
import 'package:jupiter/Components/textinput.dart';


TextEditingController emailController = new TextEditingController();

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override

  Widget build(BuildContext context) {
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
                        child:
                        Row(
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
                                                        textController: emailController),
                                                  ),
                                                ),

                                                Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                        child: new FlatButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/signin');
                                                          },
                                                          textColor: Colors.black,
                                                          child: new Text(
                                                            "BACK TO SIGN IN ",
                                                            style: TextStyle(
                                                              fontSize:   (queryData.size.width * devicePixelRatio * 0.015),
                                                            ),
                                                          ),))
                                                ),
                                              ],
                                            )

                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          //  color:Colors.red
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
                        ),),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: (queryData.size.width * devicePixelRatio),
                          child: new FlatButton(
                            color: Colors.green,
                            onPressed: ()  {
                            },
                            textColor: Colors.white,
                            child: new Text("SUBMIT",
                              style: TextStyle(
                                  fontSize:  (queryData.size.width * devicePixelRatio*0.015)
                              ),),
                          ),

                        ),
                      )

                    ]
                )
            )
        )
    );
  }
}
