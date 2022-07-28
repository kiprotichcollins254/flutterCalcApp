import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'EUNIC STORE'),
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
  double _result = 0.0;
  String symbol = '';
  double num1 = 0.0;
  double num2 = 0.0;
  void _setNumber1(){
    setState(() {
      num1 = 5;
    });
  }
  void _setNumber2(){
    setState(() {
      num2 = 10;
    });
  }
  void _setSymbol(){
    setState(() {
      symbol = '+';
    });
  }
  void _calculate(){
    double innerResult = 0.0;
    switch(symbol){
      case '+':{
        innerResult = num1 + num2;
      }
      break;
      case '-':{
        innerResult = num1 - num2;
      }
      break;
      case 'x':{
        innerResult = num1 * num2;
      }
      break;
      case '/':{
        innerResult = num1 / num2;
      }
      break;
      default:{
        innerResult = 0.0;
      }
      break;
    }
    setState(() {
      _result = innerResult;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromRGBO(174, 155, 229, 0.8),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 200),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          num1.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 59, 59, 1)
                          ),
                        ),
                        Text(symbol,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(64, 59, 59, 1)
                          ),
                        ),
                        Text(num2.toString(),
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(64, 59, 59, 1)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_result.toString(),
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 0, 0, 1)
                          ),
                        ),
                      ],

                    )
                  ],
                ),


              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),

                                ),
                              minimumSize: const Size(70, 70)
                            ),
                            onPressed: _setNumber1,
                            child: const Text('5'),

                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                minimumSize: const Size(70, 70)
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                          const SizedBox(width: 15),
                          TextButton(

                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                minimumSize: const Size(70, 70),
                                // padding: const EdgeInsets.all(10),

                            ),

                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: _setNumber1,
                            child: const Text('5'),

                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: _setNumber1,
                            child: const Text('5'),

                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber1,
                            child: const Text('5'),

                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber1,
                            child: const Text('5'),

                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: const Color.fromRGBO(109, 37, 166, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _setNumber2,
                            child: const Text('10'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            primary: Colors.white,
                            backgroundColor: const Color.fromRGBO(241, 23, 115, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          minimumSize: const Size(70,70),
                        ),
                        onPressed: _setSymbol,
                        child: const Text('%'),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            primary: Colors.white,
                            backgroundColor: const Color.fromRGBO(241, 23, 115, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          minimumSize: const Size(70,70),
                        ),
                        onPressed: _setSymbol,
                        child: const Text('x'),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            primary: Colors.white,
                            backgroundColor: const Color.fromRGBO(241, 23, 115, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          minimumSize: const Size(70,70),
                        ),
                        onPressed: _setSymbol,
                        child: const Text('-'),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            primary: Colors.white,
                            backgroundColor: const Color.fromRGBO(241, 23, 115, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          minimumSize: const Size(70,70),
                        ),
                        onPressed: _setSymbol,
                        child: const Text('+'),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            primary: Colors.white,
                            backgroundColor: const Color.fromRGBO(241, 23, 115, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          minimumSize: const Size(70,70),
                        ),
                        onPressed: _calculate,
                        child: const Text('='),
                      ),
                    ],
                  ),

                ],
              ),
            ),


         ],
        ),
      ),



       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
