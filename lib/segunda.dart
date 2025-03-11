import 'package:flutter/material.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});

  @override
  State<Segunda> createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Segunda Tela"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(r"images/logo.png",  alignment: Alignment.center,),
            const SizedBox(height:150,),
            const Text(r'A frase escrita aqui', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.00),),
            const SizedBox(height:150),

          ]
          ,
        ),
      ),

    );
  }
}
