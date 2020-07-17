import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('List Views')),
        ),
        body: BodyLayout(),
      ),
    );
  }
}


class BodyLayout extends StatefulWidget {
  @override
  BodyLayoutState createState() => BodyLayoutState();
}

class BodyLayoutState extends State<BodyLayout> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<String> titles = ['bike', 'boat', 'bus', 'car',
    'railway', 'run', 'subway', 'transit', 'walk'];

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }

  Widget _myListView() {

    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

    return Column(
      children: <Widget>[
        SizedBox(
          height: 300.0,
          child: AnimatedList(
            key: _listKey,
            initialItemCount: titles.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(titles[index], animation);
            },
          ),
        ),
        RaisedButton(
          child: Text('Insert Item', style: TextStyle(fontSize: 20.0),),
          onPressed: () {
            _insertSingleItem();
          },
        ),
        RaisedButton(
          child: Text('Remove Item', style: TextStyle(fontSize: 20.0),),
          onPressed: () {
            _removeSingleItem();
          },
        ),
      ],
    );
    }

    Widget _buildItem(String item, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  void _insertSingleItem() {
    String newItem = "Planet";
    int insertIndex = titles.length;
    titles.insert(insertIndex, newItem);
    _listKey.currentState.insertItem(insertIndex);
  }
  
  void _removeSingleItem() {
    int removedItemIndex = titles.length - 1;
    String removedItem = titles.removeLast();
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removedItem, animation);
    };
    _listKey.currentState.removeItem(removedItemIndex, builder);
  }
}