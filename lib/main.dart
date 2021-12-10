import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_name_generator/splashscreen.dart';

void main() => runApp(MainSplashScreen());

class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
  // #enddocregion build
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  //-----------------------------------\\
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  //---------------------------------------\\
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from saved ' : 'Save',
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

  //-----------------------------\\
  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(
              tiles: tiles,
              context: context,
            ).toList()
          : <Widget>[];
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'StartUp Name Generator',
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.checklist_rtl_rounded),
              onPressed: _pushSaved,
              tooltip: 'Saved Suggestions'),
        ],
      ),
      body: _buildSuggestions(),
      drawer: Drawer(
        child: ListView(
           children: [
UserAccountsDrawerHeader(accountName: Text("Sofiane Maaradji"),
accountEmail: Text("maaradji.sofiane@gmail.com"),
decoration:BoxDecoration(
color: Color(0xFFFF5757),

) ,



),


             ListTile(
               title: Text('''Project made with                                  The help of google Lab              Contact us for more applications'''),
               trailing: Icon(Icons.info),
             ), 
            
           ],
          ),
      ),
      
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
