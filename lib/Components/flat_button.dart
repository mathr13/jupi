import 'package:flutter/material.dart';
 class Button extends StatefulWidget {
  final String route;
  final String text;
   final double size;
  final Color textColor;
  final Function todo;
  final Color buttonColor;

   Button({this.route,this.text,this.textColor,this.size,this.todo,this.buttonColor});
   @override
   _ButtonState createState() => _ButtonState();
 }

 class _ButtonState extends State<Button> {
   @override
   Widget build(BuildContext context) {
     return Container(
       child:FlatButton(onPressed:(){
         if(widget.route==null){
           widget.todo(context);
         }

         else {
           Navigator.of(context).pushNamed(widget.route);
         }
       },color:widget.buttonColor ,
           textColor: widget.textColor,
           child: new Text(widget.text,
         style: TextStyle(
           fontSize: widget.size,
         ),
       )
       )
     );
   }
 }
