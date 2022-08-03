// import 'dart:ffi';

// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'advanced.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY ADVANCED CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'MY ADVANCED CALCULATOR'),
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        // '/' : (BuildContext context) => const MyHomePage(title: 'MY ADVANCED CALCULATOR'),
        '/advanced':(BuildContext context) => const MyAdvancedPage(title: 'ADVANCED CALCULATOR')
      },
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
  String _result = '0';
  String symbol = '';
  double num1 = 0.0;
  double num2 = 0.0;
  List <String> enteredNumber = [];
  String numbers = '0';
  Color bgThemeColor = const Color.fromRGBO(174, 155, 229, 0.8);
  Color themeNumberButtons = const Color.fromRGBO(109, 37, 166,1);
  Color themeTopSymbolButtons = const Color.fromRGBO(161, 93, 215, 1);
  Color themeSideSymbolButtons = const Color.fromRGBO(241, 23, 115, 1);
  Color themeValues = const Color.fromRGBO(64,59,59, 1);
  Color themeResult = Colors.black;

  void setLightBackgroundColor(){
    setState(() {
      bgThemeColor = const Color.fromRGBO(174, 155, 229, 0.8) ;
      themeNumberButtons = const Color.fromRGBO(109, 37, 166,1);
      themeTopSymbolButtons = const Color.fromRGBO(161, 93, 215, 1);
      themeSideSymbolButtons = const Color.fromRGBO(241, 23, 115, 1);
      themeValues = const Color.fromRGBO(64,59,59, 1);
      themeResult = Colors.black;
    });
  }

  void setDarkBackgroundColor(){
    setState(() {
      bgThemeColor = const Color.fromRGBO(9, 12, 16, 0.8) ;
      themeNumberButtons = const Color.fromRGBO(33,57,181, 0.8);
      themeTopSymbolButtons = const Color.fromRGBO(54, 56, 113, 1);
      themeSideSymbolButtons = const Color.fromRGBO(211, 114, 44, 1);
      themeValues = const Color.fromRGBO(136,117,130, 1);
      themeResult = Colors.white;
    });
  }

  void _setNumber(String value){
    setState(() {
      enteredNumber.add(value);
      processEnteredNumbers(enteredNumber);
    });
  }

  void _clearValues(){
    setState(() {
      enteredNumber.clear();
      processEnteredNumbers(enteredNumber);
    });
  }

  void processEnteredNumbers(List<String> myNumbers){
    if(myNumbers.isNotEmpty){
      setState(() {
        numbers = enteredNumber.join("");
        // _result = '0';
        // _calculate();
      });
    }
    else{
      setState(() {
        numbers = '0';
        _result = '0';
      });
    }
  }

  void _deleteValues(){
    setState(() {
      enteredNumber.removeLast();
      processEnteredNumbers(enteredNumber);
    });
  }

  void _setSymbol(sym){
    switch(sym){
      case '+':{
        setState(() {
          enteredNumber.add(sym);
          processEnteredNumbers(enteredNumber);
        });
      }
      break;
      case '-':{
        setState(() {
          enteredNumber.add(sym);
          processEnteredNumbers(enteredNumber);
        });
      }
      break;
      case 'x':{
        setState(() {
          enteredNumber.add('*');
          processEnteredNumbers(enteredNumber);
        });
      }
      break;
      case '/':{
        setState(() {
          enteredNumber.add(sym);
          processEnteredNumbers(enteredNumber);
        });
      }
      break;
      case '%':{
        setState(() {
          enteredNumber.add(sym);
          processEnteredNumbers(enteredNumber);
        });
      }
      break;
      case 'C':
        {
          _clearValues();
        }
        break;

    }

  }
  void updateTotalToEnteredNumbers(String evaluation){
    enteredNumber.clear();
    enteredNumber.add(evaluation);
    processEnteredNumbers(enteredNumber);
  }
  void _calculate(){
      if(enteredNumber.isNotEmpty){
        Parser p = Parser();
        Expression exp = p.parse(numbers);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL,cm);
        setState(() {
          _result  = eval.toStringAsFixed(3);
          updateTotalToEnteredNumbers(_result);
        });
      }
      else
        {
          setState(() {
            _result = '0';
          });
        }
  }

  void _navigateApplication(int index){
    if(index == 0){
      Navigator.pushReplacementNamed(context, '/');
    }
    if(index == 1){
      Navigator.pushReplacementNamed(context, '/advanced');
    }
    if(index == 2){
      Navigator.pushReplacementNamed(context, '/');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgThemeColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgThemeColor,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: _navigateApplication,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(

              child:  Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      children:[
                        IconButton(
                            onPressed: setLightBackgroundColor,
                            icon: const Icon(Icons.light_mode),
                            color: Colors.white,

                        ),
                        IconButton(
                            onPressed: setDarkBackgroundColor,
                            icon: const Icon(Icons.dark_mode),
                            color : Colors.white,
                        )
                      ]
                  )
                ],
              ),
            ),

            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          numbers,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: themeValues
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _result,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: themeResult
                          ),
                        ),
                      ],

                    )

              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeTopSymbolButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),

                                ),
                              minimumSize: const Size(70, 70)
                            ),
                            onPressed: () => _setSymbol("C"),
                            child: const Text('C'),

                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeTopSymbolButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                minimumSize: const Size(70, 70)
                            ),
                            onPressed: () => _setSymbol("+/-"),
                            child: const Text('+/-'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(

                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeTopSymbolButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                minimumSize: const Size(70, 70),
                                // padding: const EdgeInsets.all(10),

                            ),

                            onPressed: () => _setSymbol("%"),
                            child: const Text('%'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.white,
                              backgroundColor: themeSideSymbolButtons,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setSymbol("/"),
                            child: const Text('/'),
                          ),

                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),

                            onPressed: () => _setNumber('7'),
                            child: const Text('7'),

                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: () => _setNumber('7'),
                            child: const Text('8'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: () => _setNumber('9'),
                            child: const Text('9'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.white,
                              backgroundColor: themeSideSymbolButtons,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setSymbol("x"),
                            child: const Text('x'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70, 70),
                            ),
                            onPressed: () => _setNumber('4'),
                            child: const Text('4'),

                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed:() => _setNumber('5'),
                            child: const Text('5'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setNumber('6'),
                            child: const Text('6'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.white,
                              backgroundColor: themeSideSymbolButtons,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setSymbol("-"),
                            child: const Text('-'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setNumber('1'),
                            child: const Text('1'),

                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setNumber('2'),
                            child: const Text('2'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setNumber('3'),
                            child: const Text('3'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.white,
                              backgroundColor: themeSideSymbolButtons,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setSymbol("+"),
                            child: const Text('+'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: () => _setNumber('0'),
                            child: const Text('0'),

                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.white,
                                backgroundColor: themeNumberButtons,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed:() => _setNumber('.'),
                            child: const Text('.'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.white,
                              backgroundColor: themeSideSymbolButtons,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: const Size(70,70),
                            ),
                            onPressed: _deleteValues,
                            child: const Icon(
                              Icons.backspace,
                            ),

                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.white,
                              backgroundColor: themeSideSymbolButtons,
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
