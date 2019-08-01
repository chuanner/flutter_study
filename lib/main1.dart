import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <prefix0.WordPair>[];
  final _saved = Set<prefix0.WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((pair) {
        return new ListTile(
          title: new Text(pair.asPascalCase, style: _biggerFont),
        );
      });

      final divided =
          ListTile.divideTiles(context: context, tiles: titles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("saved"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(prefix0.generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(prefix0.WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("flutter"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "flutter",
        theme: new ThemeData(
          primaryColor: Colors.red,
        ),
        home: new RandomWords());
  }
}
