import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'readingList.dart';


class FavoritesList extends StatelessWidget{
  List<ReadingListItems> list = [];

  FavoritesList(readingList){
    list = readingList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Reading List"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Search"),
            ),
            ListTile(
              title: Text("Reading List"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return ReadingList();
                    }));
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: ListTile(
                  leading: Image.network('${list[index].image}'),
                  title: Text(list[index].title),
                  subtitle: Text(list[index].author),
                ),
              );
            })
    );


  }
}