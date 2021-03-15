import 'package:flutter/material.dart';
import 'mainWidgets/appBar.dart';
import 'mainWidgets/pageview.dart';
import 'mainWidgets/listview.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TheAppBarWidget(),
                ThePageViewWidget(),
                TheListViewWidget()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.fastfood_rounded),
        onPressed: () {
          debugPrint('Floating action is pressed');
        },
      ),
    );
  }
}
