import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/imagens/logo.png',
          fit: BoxFit.contain,
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/imagens/book.jpeg',
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pesquisaLivros');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Pesquisar Livros'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listaLeitura');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Minha Lista de Leitura'),
              ),
            ],
          ),
        )
      ),
    );
  }
}
