import 'dart:convert';
import 'package:flutter/material.dart';

class TheListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Widget>> createList() async {
      List<Widget> items = <Widget>[];
      String dataString =
          await DefaultAssetBundle.of(context).loadString('assets/data.json');
      debugPrint('i got here');
      List<dynamic> dataJSON = jsonDecode(dataString);
      dataJSON.forEach((element) {
        //      loop
        String finalString = "";
        List<dynamic> dataList = element['placeItems'];
        dataList.forEach((element) {
          finalString = finalString + element + '|';
        });
        items.add(Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1.0,
                            blurRadius: 5.0)
                      ]),
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      child: Image.asset(
                        element["placeImage"],
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(element['placeName'],style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              finalString,
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:4.0),
                            child: Text(
                              'Min Order: ${element['minOrder']}',
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
      });
      return items;
    }

    return Container(
      child: FutureBuilder(
        initialData: <Widget>[Text('Nothing')],
        future: createList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('has data');
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: snapshot.data,
                primary: false,
                shrinkWrap: true,
              ),
            );
          } else {
            debugPrint('does not have data');
            return CircularProgressIndicator();
          }
        },
      ),
    ); ////(where Widget starts)
  }
}
