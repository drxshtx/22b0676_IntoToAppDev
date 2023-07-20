import 'dart:html';

import 'object.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: budget(),
  ));
}
class budget extends StatefulWidget {
  const budget({super.key});

  @override
  State<budget> createState() => _budgetState();
}

class _budgetState extends State<budget> {
  int expense=26700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Tracker',
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      )
          ,body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.person_3_rounded, size:50),
                ),
                SizedBox(height:30),
                Text(
                  'Welcome Back !!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height:20),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => page2()));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Expense  :',
                              style: TextStyle(
                                fontSize:20,
                              ),
                        ),
                        SizedBox(width:10),
                        Text(
                          '$expense',
                          style: TextStyle(
                            fontSize: 20,
                          )
                        ),
                        Icon(Icons.arrow_drop_down,size:30),

                      ],
                    )
                  ),
                ),
              ],
            ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  String category='';
  late TextEditingController controller1;
  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

    @override
  Future openDialog() => showDialog(
     context: context,
      builder: (context)=>AlertDialog(
        title: Text( ' New Entry'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Category'),
              controller: controller1,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pop(controller1);
                controller1.clear();
              },
              icon: Icon(Icons.add))
        ],
      ));
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Budget Tracker',
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[400],
        ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.map((item)=>Text('${item.category} :  ${item.amount}')).toList(),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: ()async{
          final category = await openDialog();
          setState(() {
            this.category = category as String;
          }
          );
        },
      ),   );
  }
}
