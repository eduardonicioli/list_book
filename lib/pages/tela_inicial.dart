import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text('Page Turners', style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1), // Azul escuro
              Color(0xFF42A5F5), // Azul claro
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 400),
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
                  minimumSize: const Size(200, 60), // Largura e altura dos botões
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                  textStyle: const TextStyle(fontSize: 18), // Tamanho da fonte
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
