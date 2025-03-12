import 'package:flutter/material.dart';

class Segunda extends StatelessWidget {
  const Segunda({super.key});

  String _determinarResultado(String usuario, String maquina) {
    if (usuario == maquina) {
      return "Empate!";
    }
    if ((usuario == "pedra" && maquina == "tesoura") ||
        (usuario == "papel" && maquina == "pedra") ||
        (usuario == "tesoura" && maquina == "papel")) {
      return "Você ganhou!";
    }
    return "Você perdeu!";
  }

  @override
  Widget build(BuildContext context) {
    final escolhas = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {};
    final String usuarioEscolha = escolhas['usuario'] ?? "pedra";
    final String maquinaEscolha = escolhas['maquina'] ?? "pedra";
    final String resultado = _determinarResultado(usuarioEscolha, maquinaEscolha);
    final String imagemResultado = (resultado == "Você ganhou!")
        ? "images/vitoria.png"
        : (resultado == "Você perdeu!")
        ? "images/derrota.png"
        : "images/apertoMao.png";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pedra, Papel, Tesoura"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset('images/$maquinaEscolha.png', width: 150, height: 150),
            const SizedBox(height: 10),
            const Text(
              'Escolha do APP:',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            // Escolha do usuário
            Image.asset('images/$usuarioEscolha.png', width: 150, height: 150),
            const SizedBox(height: 10),
            const Text(
              'Sua escolha:',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            Text(
              resultado,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            if (imagemResultado.isNotEmpty)
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    imagemResultado,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Botão para jogar novamente
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                "Jogar Novamente",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
