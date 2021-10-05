import 'package:final_app/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'package:final_app/authentication_service.dart';




class MySignUp extends StatefulWidget{
  @override
  _MySignUp createState() => new _MySignUp();
}

class _MySignUp extends State<MySignUp> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 60.0, fontFamily: "Smile", fontWeight: FontWeight.bold)
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      onSaved: (value) => _email = value,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Email Needed!';
                        }
                        if(!validateEmail(_email)){
                          return 'Valid Email Needed!';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                     decoration: InputDecoration(
                       labelText: 'Password',
                       hintText: 'Must be 6 characters long',
                       labelStyle: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.grey,
                       ),
                     ),
                      onSaved: (value) => _password = value,
                      validator: (value){
                       if(value.isEmpty){
                         return 'Password Empty!';
                       }
                       if(value.length < 6){
                         return '6 or more characters needed!';
                       }
                       return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.cyanAccent,
                        color: Colors.cyan,
                        elevation: 7.0,
                        child: InkWell(
                          onTap: (){
                            final form = _formKey.currentState;
                            form.save();

                            if(form.validate()){
                              context.read<AuthenticationService>().signUp(
                                email: _email,
                                password: _password,
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => CupertinoAlertDialog(
                                  title: Text("Success!"),
                                  actions:[
                                    CupertinoDialogAction(
                                      child: Text("Close"),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyLogin()));
                                      }
                                    )
                                  ]
                                )
                              );
                            }
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                            )
                          ),
                        )
                      )
                    )
                  ]
                )
              )
            ]
          ),
        )
      )
    );
  }

}