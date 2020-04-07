import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenicate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //print(user);
    
    //return ether home or authenicate widget
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}