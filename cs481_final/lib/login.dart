import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'package:final_app/authentication_service.dart';
import 'signup.dart';


class MyLogin extends StatefulWidget{
  @override
  _MyLoginPage createState() => new _MyLoginPage();
}

class _MyLoginPage extends State<MyLogin>{
  final _formKey = GlobalKey<FormState>();
  
  String _email;
  String _password;
  TextEditingController emailController = new TextEditingController();


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      // backgroundColor: Colors.cyan,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(45.0, 55.0, 0.0, 0.0),
                        child: Text(
                            'Pawsibilities',
                            style: TextStyle(fontSize: 60.0,fontFamily: "Smile", fontWeight: FontWeight.bold)
                        )
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(140.0, 150.0, 130.0, 0.0),
                        child: Image.asset('assets/download.png')
                    ),
                  ]
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      onSaved: (value) => _email = value,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Username needed!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                        ),
                      onSaved: (value) => _password = value,
                      validator: (value)
                        {
                          if(value.isEmpty){
                            return 'Password Needed!';
                        }
                          return null;
                        },
                      obscureText: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0,0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => new CupertinoAlertDialog(
                              title: Text("Enter Email"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Send"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context.read<AuthenticationService>().sendPasswordResetEmail(emailController.text);
                                  }
                                )
                              ],
                              content: CupertinoTextField(
                                placeholder: "Email",
                                controller: emailController,
                              )
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.cyanAccent,
                        color: Colors.cyan,
                        elevation: 7.0,
                        child: InkWell(
                          onTap: () {
                            final form = _formKey.currentState;
                            form.save();
                            if(form.validate()){
                            context.read<AuthenticationService>().signIn(
                              email: _email,
                              password: _password,
                            );
                          }
                            },
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CupertinoAlertDialog(
                              title: Text("Please fur-give me! Coming Soon :)"),
                              actions:[
                                CupertinoDialogAction(
                                    child: Text("Close"),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    }
                                )
                              ]
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(AssetImage('assets/facebook.png')),
                              ),
                              SizedBox(width: 10.0),
                              Center(
                                child: Text('Login with Facebook', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))
                              )
                            ]
                          )
                        ),
                      )
                    )
                  ]
                )
              ),
              SizedBox(height:15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Looking for Pawsibilites?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MySignUp()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )
                    )
                  )
                ],
              )
            ]
          ),
        ),
      ),


    );


  }

}