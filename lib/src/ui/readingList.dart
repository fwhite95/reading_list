
import 'package:flutter/material.dart';
import 'package:reading_list/src/ui/favoritesList.dart';
import '../models/book_model.dart';
import '../blocs/book_bloc.dart';



class ReadingList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReadingListState();
  }
}

class ReadingListState extends State<ReadingList>{

  final searchController = TextEditingController();
  List<ReadingListItems> readingList = [];

  @override
  void initState() {
    super.initState();
    bloc.fetchBooks(searchController.text);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  return FavoritesList(readingList);
                }));
              },
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Search",
              filled: true,
            ),
            controller: searchController,
            onChanged: (search){
              print(searchController.text);
              bloc.fetchBooks(searchController.text);
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.allBooks,
              builder: (context, AsyncSnapshot<BookModel> snapshot){
                if(searchController.text.isEmpty){
                  return Container(
                    child: Text("Blank"),
                  );
                }
                else if(snapshot.hasData){
                  return buildList(snapshot, readingList);
                } else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),
          ),

        ],
      ),


    );
}


Widget buildList(AsyncSnapshot<BookModel> snapshot, List<ReadingListItems> readingList){
    bool isPressed = false;
  return ListView.builder(
    itemCount: snapshot.data.items.length,
      itemBuilder: (BuildContext context, int index){
      return Card(
        child: ListTile(
          leading: Image.network('${snapshot.data.items[index].volumeInfo.imageLinks.smallThumbnail}',
            fit: BoxFit.fill,
          ),
          title: Text(snapshot.data.items[index].volumeInfo.title),
          subtitle: Text(snapshot.data.items[index].volumeInfo.authors[0]),
          trailing: IconButton(
            icon: Icon(Icons.add),
            color: (isPressed) ? Colors.blueAccent : Colors.white,
            onPressed: () {
              readingList.add(ReadingListItems(
                  snapshot.data.items[index].volumeInfo.imageLinks.smallThumbnail,
                  snapshot.data.items[index].volumeInfo.authors[0],
                  snapshot.data.items[index].volumeInfo.title));
              return showDialog<void>(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Added to Reading List"),
                  );
                }
              );
            },
          )
        )
      );
      });
  }
}

class ReadingListItems{
  String _image;
  String _author;
  String _title;

  ReadingListItems(image, author, title){
    _image = image;
    _author = author;
    _title = title;
  }

  String get image => _image;
  String get author => _author;
  String get title => _title;
}