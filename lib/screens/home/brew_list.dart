import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];
    //print(brews.documents);
    // for(var doc in brews.documents){
    //   print(doc.data);
    // }

    // brews.forEach((brews){
    //   print(brews.name);
    //   print(brews.sugars);
    //   print(brews.strength);
    // });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index){
        return BrewTile(brew:brews[index]);
      },
      
    );
  }
}