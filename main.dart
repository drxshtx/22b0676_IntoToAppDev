import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   double width = MediaQuery.of(context).size.width;
  //   double height= MediaQuery.of(context).size.height;
  // }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body:SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child:Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                   'Counter Value:',
                    style: TextStyle(fontSize: 20),
                   ),
                  Text(
                   '$_counter',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
              ], ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                        // backgroundColor: Colors.teal[200],

                      ),
                      SizedBox(width: 10),
                      FloatingActionButton(
                        onPressed: _incrementCounter,
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      )
                    ],
                  )
                ),
          ],
        ),
      ),
    );
  }
}
