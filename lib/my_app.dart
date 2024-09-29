import 'package:flutter/material.dart';
import 'pages/lista_leitura_pagina.dart';
import 'pages/pesquisa_livros_pagina.dart';
import 'pages/tela_inicial.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicial(),
        '/pesquisaLivros': (context) => PesquisaLivrosPagina(),
        '/listaLeitura': (context) => ListaLeituraPagina(),
      },
    );
  }
}
