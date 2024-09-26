import 'package:flutter/material.dart';
import '../database/banco_de_dados.dart';
import '../models/livro_modelo.dart';

class ListaLeituraPagina extends StatefulWidget {
  const ListaLeituraPagina({Key? key}) : super(key: key);

  @override
  _ListaLeituraPaginaState createState() => _ListaLeituraPaginaState();
}

class _ListaLeituraPaginaState extends State<ListaLeituraPagina> {
  List<Livro> _listaLeitura = [];

  Future<void> _carregarListaLeitura() async {
    final livros = await BancoDeDados().buscarLivros();
    setState(() {
      _listaLeitura = livros;
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarListaLeitura();
  }

  Future<void> _removerLivro(String id) async {
    await BancoDeDados().deletarLivro(id);
    _carregarListaLeitura();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha Lista de Leitura')),
      body: ListView.builder(
        itemCount: _listaLeitura.length,
        itemBuilder: (context, index) {
          final livro = _listaLeitura[index];
          return ListTile(
            leading: livro.capa.isNotEmpty
                ? Image.network(livro.capa)
                : null,
            title: Text(livro.titulo),
            subtitle: Text(livro.autores),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _removerLivro(livro.id);
              },
            ),
          );
        },
      ),
    );
  }
}
