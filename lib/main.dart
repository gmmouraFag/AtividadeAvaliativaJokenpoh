import 'dart:math';
import 'package:flutter/material.dart';
import 'segunda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
      ),
      routes: {
        '/': (context) => MyHomePage(title: "Pedra, Papel, Tesoura"),
        '/segundaTela': (context) => Segunda(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _mudarTela(String escolhaUsuario) {
    final random = Random();
    List<String> opcoes = ['pedra', 'papel', 'tesoura'];
    String escolhaMaquina = opcoes[random.nextInt(opcoes.length)];

    Navigator.pushNamed(
      context,
      '/segundaTela',
      arguments: {
        'usuario': escolhaUsuario,
        'maquina': escolhaMaquina,
      },
    );
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
            Image.asset("images/padrao.png", width: 150, height: 150),
            const Text(
              'Escolha do APP',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 200),
            const Text(
              'Escolha uma opção:',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _mudarTela('pedra'),
                  child: Image.asset("images/pedra.png", width: 100, height: 100),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _mudarTela('papel'),
                  child: Image.asset("images/papel.png", width: 100, height: 100),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _mudarTela('tesoura'),
                  child: Image.asset("images/tesoura.png", width: 100, height: 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
