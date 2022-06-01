import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// MyApp StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter Application',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Flutter Application'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

// RandomWords StatefulWidget
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // List Of WordPairs.
  final _biggerFont = const TextStyle(fontSize: 20); // Text Style.

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Padding
      padding: const EdgeInsets.all(16.0),
      // i => order or number of items
      itemBuilder: (context, i) {
        // Add a one-pixel-high divider before each row.
        if (i.isOdd) return const Divider(thickness: 2);

        final index = i ~/ 2;
        // if you 've reached the end of the available word
        if (index >= _suggestions.length) {
          // then generated 10 more and add them to the suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
