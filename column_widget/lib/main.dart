import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: LColumn(),
      ),
    );
  }
}

class LColumn extends StatefulWidget {
  const LColumn({Key? key}) : super(key: key);

  @override
  _LColumnState createState() => _LColumnState();
}

enum ALIGN { spaceEvenly, start, center }

class _LColumnState extends State<LColumn> {
  ALIGN _character = ALIGN.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blue.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Column Widget - İtem1",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const Text(
                    "Column Widget - İtem2",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxcfjBsQocfYPPqIDtO-TvrHYb6m6KX7tDg&usqp=CAU',
                    fit: BoxFit.fitHeight,
                  ),

                  const Text(
                    "Column Widget - İtem4",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),

                  //new Container()
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              children: <Widget>[
                Radio(
                  value: ALIGN.spaceEvenly,
                  groupValue: _character,
                  onChanged: (ALIGN? value) {
                    setState(() {
                      _character = value!;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                const Text("Evently"),
                Radio(
                  value: ALIGN.start,
                  groupValue: _character,
                  onChanged: (ALIGN? value) {
                    setState(() {
                      _character = value!;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                const Text("Start"),
                Radio(
                  value: ALIGN.center,
                  groupValue: _character,
                  onChanged: (ALIGN? value) {
                    setState(() {
                      _character = value!;
                      _mainAxisAlignment = MainAxisAlignment.center;
                    });
                  },
                ),
                const Text("Center"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
