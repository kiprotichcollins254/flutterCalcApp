import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class AdvancedPage extends StatelessWidget{
//   const AdvancedPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return  const MaterialApp(
//       title: 'Advanced Calculator Page',
//       home: MyAdvancedPage(title:'Advanced Calculator Page'),
//     );
//   }
// }
class MyAdvancedPage extends StatefulWidget{
  const MyAdvancedPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyAdvancedPage> createState() => _MyAdvancedPageState();
}

class _MyAdvancedPageState extends State<MyAdvancedPage>{

  void _navigateApplication(int index){
    if(index == 0){
      Navigator.pushNamed(context, '/');
    }
    if(index == 1){
      Navigator.pushNamed(context, '/advanced');
    }
    if(index == 2){
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context){
    return
         Scaffold(
           bottomNavigationBar: CurvedNavigationBar(
             backgroundColor: Colors.blueAccent,
             items: const <Widget>[
               Icon(Icons.add, size: 30),
               Icon(Icons.list, size: 30),
               Icon(Icons.person, size: 30),
             ],
             onTap: _navigateApplication,
           ),
           body: Container(
             padding: const EdgeInsets.all(20),
             margin : const EdgeInsets.only(top: 100),
             child: Column(

               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Card(

                       child: InkWell(
                         splashColor: Colors.blue.withAlpha(30),
                         onTap: () {
                           Fluttertoast.showToast(
                             msg: "Navigate to logs,Sin,Cos",
                             gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                           );
                         },
                         child: const SizedBox(
                           height: 130,
                           width: 130,
                           child: Text(
                             'logs,Sin,Cos',
                             style: TextStyle(
                               fontSize: 24,
                               fontWeight: FontWeight.bold,

                             ),
                           ),
                         ),


                       ),
                     ),
                     Card(

                       child: InkWell(
                         splashColor: Colors.blue.withAlpha(30),
                         onTap: () {
                           Fluttertoast.showToast(
                             msg: "Navigate to Algebra",
                             gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                           );
                         },
                         child: const SizedBox(
                           height: 130,
                           width: 130,
                           child: Text(
                             'Algebra',
                             style: TextStyle(
                               fontSize: 24,
                               fontWeight: FontWeight.bold,

                             ),
                           ),
                         ),


                       ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Card(

                       child: InkWell(
                         splashColor: Colors.blue.withAlpha(30),
                         onTap: () {
                           Fluttertoast.showToast(
                             msg: "Navigate to logs,Sin,Cos",
                             gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                           );
                         },
                         child: const SizedBox(
                           height: 130,
                           width: 130,
                           child: Text(
                             'logs,Sin,Cos',
                             style: TextStyle(
                               fontSize: 24,
                               fontWeight: FontWeight.bold,

                             ),
                           ),
                         ),


                       ),
                     ),
                     Card(

                       child: InkWell(
                         splashColor: Colors.blue.withAlpha(30),
                         onTap: () {
                           Fluttertoast.showToast(
                             msg: "Navigate to Algebra",
                             gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                           );
                         },
                         child: const SizedBox(
                           height: 130,
                           width: 130,
                           child: Text(
                             'Algebra',
                             style: TextStyle(
                               fontSize: 24,
                               fontWeight: FontWeight.bold,

                             ),
                           ),
                         ),


                       ),
                     )
                   ],
                 ),
               ],
             ),
           ),
         );
  }
}

