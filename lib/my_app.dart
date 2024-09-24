import 'package:flutter/material.dart';
import 'pages/pesquisa_livros_pagina.dart';
import 'pages/lista_leitura_pagina.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Livros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PesquisaLivrosPagina(),
        '/listaLeitura': (context) => const ListaLeituraPagina(),
      },
    );
  }
}
