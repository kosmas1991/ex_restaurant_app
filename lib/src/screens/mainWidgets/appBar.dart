import 'package:flutter/material.dart';

class TheAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.redAccent,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {
            debugPrint('menu button pressed');
          },),
          Text('Foodies', style: TextStyle(fontSize: 20,fontFamily: "Pacifico"),),
          IconButton(icon: Icon(Icons.person), onPressed: () {
            debugPrint('profile button pressed');
          },)
        ],
      ),
    );
  }
}
