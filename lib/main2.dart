import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

//实现一个 stateful widget 至少需要两个类:
// 一个 StatefulWidget类。
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

// 一个 State类。 StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在.
class RandomWordsState extends State<RandomWords> {
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
            title: new Text("saved suggestions"),
          ),
          body: new ListView(children: divided));
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
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
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
        title: new Text("startup name generator"),
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
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "startup name generator", 
        theme: new ThemeData(
          primaryColor: Colors.red,
        ),
        home: new RandomWords()
        );
  }
}
