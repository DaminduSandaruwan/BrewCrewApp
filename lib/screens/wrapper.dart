import 'package:brew_crew/screens/authenicate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //return ether home or authenicate widget
    return Authenticate();
  }
}