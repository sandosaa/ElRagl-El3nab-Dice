import 'package:flutter/material.dart';
import 'dart:math';



  void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ElRagl El3nab",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 63, 0, 19),primary: const Color.fromARGB(255, 116, 0, 37)) 
      ),
      home: Home(),
    );
  }
}

Map<int,Icon> numbers = {
  1 : Icon(Icons.looks_one,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
  2 : Icon(Icons.looks_two,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
  3 : Icon(Icons.looks_3,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
  4 : Icon(Icons.looks_4,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
  5 : Icon(Icons.looks_5,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
  6 : Icon(Icons.looks_6,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
  0 : Icon(Icons.exposure_zero,size: 50,color: const Color.fromARGB(255, 168, 0, 56)),
};


class Home extends StatefulWidget{
  @override
  State<Home> createState() => HomeState();
}
class HomeState extends State<Home>{
  int num1 = 0;
  int num2 = 0;
  int total = 0;
  int win = 0;

  void reset(){
    setState(() {
      num1 = 0;
      num2 = 0;
      total = 0;
      win = 0;
    });
  }

  void roll(){
    setState(() {
      num1 = Random().nextInt(6)+1;
      num2 = Random().nextInt(6)+1;
      total+=1;
      if (num1 == num2){
        win+=1 ;
      }
    });
  }
//appBar: AppBar(title: Text('ElRagl El2baaaaaaaaab!',textAlign: TextAlign.center,)),
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary,title:
       Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center,children: 
          [Text('ElRagl El3naaaaaaaaab!',selectionColor: Color.fromARGB(0, 255, 255, 255),)],))),
      body: Center(
        child:
          Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (num1 == num2 ) Image(image: AssetImage('../assets/happy.jpg')) else Image(image: AssetImage('../assets/sad.jpeg')),
            SizedBox(height: 40,),
            if (num1 == num2 && win != 0) Text("Winnnnn",style:TextStyle(fontSize: 30,color: const Color.fromARGB(255, 163, 11, 0))) else if (total == 0) Text("Have a Try <3",style:TextStyle(fontSize: 30,color: const Color.fromARGB(255, 163, 11, 0)))  else Text("Yaa nhar Esowyyyd!",style:TextStyle(fontSize: 30,color: const Color.fromARGB(255, 163, 11, 0))),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numbers[num1]!,
                SizedBox(width: 10,),
                numbers[num2]!
              ],
            ),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: ElevatedButton(onPressed: roll, child: Text("roll"))) ,
                  SizedBox(width:20),
                  Expanded(child: ElevatedButton(onPressed: reset , child: Text("reset")))
                ]),
            SizedBox(height: 50,),
            Text("total tries $total with win $win times.",style:TextStyle(fontSize: 30) ),
            SizedBox(height: 50,),
          ],
          ),
      ),
    );
  }
}