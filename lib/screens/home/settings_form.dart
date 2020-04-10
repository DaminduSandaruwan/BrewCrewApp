import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);  

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;

          return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your brew settings.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: userData.name,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName=val),            
              ),
              SizedBox(height: 20.0),
              //DropDown
              DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentSugars ?? userData.sugars,
                items: sugars.map((sugar){
                  return DropdownMenuItem(
                    child: Text('$sugar sugars'),
                    value: sugar,
                  );
                }).toList(), 
                onChanged: (val) => setState(()=> _currentSugars=val)
              ),
              //Slider
              Slider(
                value: (_currentStrength ?? userData.strength).toDouble(),
                activeColor: Colors.brown[_currentStrength ?? userData.strength],
                inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                min: 100.0,
                max: 900.0,
                divisions: 8,
                onChanged: (val)=> setState(()=> _currentStrength=val.round()),
              ),
              //Button
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
              )
            ],
          ),
        );

        }else{
          return Loading();
        }
        
      }
    );
  }
}