import 'package:flutter/material.dart';

import 'models/item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = <Item>[];

  HomePage() {
    items.add(Item(title: 'Banana', done: false));
    items.add(Item(title: 'Abacate', done: true));
    items.add(Item(title: 'Laranja', done: false));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Todo List")),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = widget.items[index];
            return CheckboxListTile(
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
              },
              title: Text(item.title),
              key: Key(item.title),
            );
          },
          itemCount: widget.items.length,
        ));
  }
}
