// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Component app",
    home: DemoList(),
  ));
}

class HelloFLutter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Flutter'),
        backgroundColor: Colors.red[200],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: 10,
              height: 50,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              width: 10,
              height: 50,
              color: Colors.green,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () => {print('Yow')},
        backgroundColor: Colors.red[200],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
            width: 200,
            height: 200,
            child: Column(
              children: [
                Image.asset('assets/flutter-logo.png', width: 100, height: 100,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Flutter App', style: TextStyle(fontFamily: 'Auckland', fontSize: 30),),
                )
              ]),
          ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  const Input({ Key? key }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String title = '';
  String inputText = '';
  bool hideInput = false;
  TextEditingController controller = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    title = 'wedew';
    inputText = '';
    hideInput = false;
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void changeText(String text){
    setState(() {
      inputText = text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Component'),
      ),
      body: Column(
        children: [
          TextField(
            obscureText: hideInput,
            controller: controller,
          ),
          Switch(
            value: hideInput,
            onChanged: (val){
              setState(() {
                hideInput = val;
              });
            },
          ),
          Text(hideInput?'Hide Activayed':'Unhide Activated'),
          Text(inputText),
          RaisedButton(onPressed: ()=>{
            showDialog(context: context, builder: (BuildContext context)=>
              AlertDialog(
                title: Text('wew'),
                content: Text(controller.text),
              ))
          })
        ],
      ),
    );
  }
}

class GestureHandling extends StatelessWidget {
  const GestureHandling({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Handling'),
      ),
      body: Column(
        children: [
          Text('wew'),
          GestureDetector(
            onTap: ()=>print('yuhu'),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          InkWell(
            onTap: ()=>print('yuhu'),
            child: Container(
              margin: EdgeInsets.only(top:10),
              height: 100,
              width: 100,
              color: Colors.red[200],
            ),
          )
        ],
      )
    );
  }
}

class DemoList extends StatelessWidget {
  String sore = 'demo';
  int dame = 1;
  List<String> names = ['Afdol', 'Jason', 'Merry', 'Augustus', 'Georgie'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wew'),
      ),
      body: ListView(
        children: [
          ...names.asMap().entries.map((val){
            return Row(
              children: [
                Text((val.key + 1).toString(), style: TextStyle(fontSize: 20),),
                Text(val.value, style: TextStyle(fontSize: 20),),
              ],
            );
          })
        ]
      ),
    );
  }
}
