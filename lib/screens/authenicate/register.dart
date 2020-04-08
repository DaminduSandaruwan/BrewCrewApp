import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  //Text field state
  String email = '';
  String password = '';
  String error = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: (){
               widget.toggleView();
            },
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email'), //import decoration from constant dart file
                validator: (val)=> val.isEmpty ? 'Enter an Email': null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                validator: (val)=> val.length<6 ? 'Enter a Password 6+ chars long': null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    //print(email);
                    //print(password);

                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      setState(() {
                        error='Please supply a valid email';
                      });
                    }
                  }
                  
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              )
              
            ],
          ),
        ),
      ) ,
    );  
  }
}