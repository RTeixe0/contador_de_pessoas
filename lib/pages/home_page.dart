import 'package:flutter/material.dart' show AssetImage, BorderRadius, BoxDecoration, BoxFit, BuildContext, Colors, Column, Container, DecorationImage, ElevatedButton, MainAxisAlignment, Radius, RoundedRectangleBorder, Row, Scaffold, Size, SizedBox, State, StatefulWidget, Text, TextStyle, Widget;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  final lotacaoMaxima = 15;

  void incrementar() {
    if (contador < 15) {
      setState(() {
        contador++;
      });
    }
  }

  void decrementar() {
    if (contador > 0) {
      setState(() {
        contador--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fundo.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              contador != lotacaoMaxima ? "Pode entrar!" : "Lotado",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.yellow,
                  backgroundColor: Colors.white.withOpacity(0.5)),
            ),
            Text(
              "$contador",
              style: TextStyle(
                  fontSize: 70,
                  color: contador != 15 ? Colors.black : Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementar,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 120),
                      backgroundColor: contador < lotacaoMaxima
                          ? Colors.green
                          : Colors.deepOrange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: decrementar,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 120),
                      backgroundColor: Colors.deepOrange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
