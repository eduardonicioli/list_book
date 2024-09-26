import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pesquisaLivros');
              },
              child: const Text('Pesquisar Livros'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listaLeitura');
              },
              child: const Text('Minha Lista de Leitura'),
            ),
          ],
        ),
      ),
    );
  }
}
