import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title: Text(widget.title),
      ),
      body:  Column(children:  [
         Text("First Name"),
         SizedBox(height: 10,),
        Container(child: TextField(controller: nameController,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text(" Middle Name"),
        SizedBox(height: 10,),
        Container(child: TextField(controller: middlenameController,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text(" Last Name"),
        SizedBox(height: 10,),
        Container(child: TextField(controller: lastnameController,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text(" address"),
        SizedBox(height: 10,),
        Container(child: TextField(controller: addresscontroller,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text(" state "),
        SizedBox(height: 10,),
        Container(child: TextField(controller: stateController,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text(" CIty"),
        SizedBox(height: 10,),
        Container(child: TextField(controller: cityController,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text(" COde"),
        SizedBox(height: 10,),
        Container(child: TextField(controller: codeController,keyboardType: TextInputType.name,decoration: InputDecoration(),)),
        SizedBox(height: 10,),
        Text("select an Image"),
        SizedBox(height: 10,),
        Image.network("https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/128413/scorpio-exterior-right-front-three-quarter-46.jpeg?isig=0&q=75"),
        SizedBox(height: 10,),
        ElevatedButton(
                  onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.gallery); 
                      setState(() {
                        //update UI
                      });
                  }, 
                  child: Text("Pick Image")
                ),
 
                image == null?Container():
                Image.file(File(image!.path)),
        InkWell
        ( onTap: () async{
            Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        },
          child: Container(height:20,width: 40, decoration: BoxDecoration(color: Colors.blue),child:Text("submit"))),
      ],),   );
  }
}
