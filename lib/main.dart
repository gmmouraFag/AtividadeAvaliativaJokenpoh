import 'package:aulaum/segunda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
routes: {
        '/':(context) => MyHomePage(title: "Primeira Tela"),
        '/segundaTela': (context) => Segunda()},    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.pushNamed(context, '/segundaTela');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(r"images/logo.png",  alignment: Alignment.center,),
            const SizedBox(height:150,),
            const Text(r'A frase escrita aqui', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.00),),
            const SizedBox(height:150),
                ElevatedButton(onPressed: _incrementCounter, child: Text(r"gerar frase"),)
          
          ]
          ,
        ),
      ),
      
    );
  }
}
