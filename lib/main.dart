import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Provider.of<Data>(context).text,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<Data>(context).text),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LeftChild1(),
            Rightchild1(),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LeftChild1 extends StatefulWidget {
  const LeftChild1({Key? key}) : super(key: key);

  @override
  State<LeftChild1> createState() => _LeftChild1State();
}

class _LeftChild1State extends State<LeftChild1> {
  @override
  Widget build(BuildContext context) {
    return LeftChild2();
  }
}

class LeftChild2 extends StatefulWidget {
  const LeftChild2({Key? key}) : super(key: key);

  @override
  State<LeftChild2> createState() => _LeftChild2State();
}

class _LeftChild2State extends State<LeftChild2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) {
          Provider.of<Data>(context, listen: false).changeData(value);
        },
      ),
    );
  }
}

class Rightchild1 extends StatefulWidget {
  Rightchild1({Key? key}) : super(key: key);

  @override
  State<Rightchild1> createState() => _Rightchild1State();
}

class _Rightchild1State extends State<Rightchild1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Rightchild2(),
        Rightchild3(),
      ],
    );
  }
}

class Rightchild2 extends StatefulWidget {
  Rightchild2({Key? key}) : super(key: key);

  @override
  State<Rightchild2> createState() => _Rightchild2State();
}

class _Rightchild2State extends State<Rightchild2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Rightchild3 extends StatefulWidget {
  Rightchild3({Key? key}) : super(key: key);

  @override
  State<Rightchild3> createState() => _Rightchild3State();
}

class _Rightchild3State extends State<Rightchild3> {
  @override
  Widget build(BuildContext context) {
    return Rightchild4();
  }
}

class Rightchild4 extends StatefulWidget {
  Rightchild4({Key? key}) : super(key: key);

  @override
  State<Rightchild4> createState() => _Rightchild4State();
}

class _Rightchild4State extends State<Rightchild4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("Right 4th colum"),
        Text(Provider.of<Data>(context).text),
      ]),
    );
  }
}

class Data extends ChangeNotifier {
  String text = "fuck me fuck me";
  void changeData(String newdata) {
    text = newdata;
    notifyListeners();
  }
}
