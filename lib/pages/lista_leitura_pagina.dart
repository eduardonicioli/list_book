import 'package:flutter/material.dart';
import '../database/banco_de_dados.dart';
import '../models/livro_modelo.dart';
import '../repositories/repositorio.dart';

class ListaLeituraPagina extends StatefulWidget {
  const ListaLeituraPagina({Key? key}) : super(key: key);

  @override
  _ListaLeituraPaginaState createState() => _ListaLeituraPaginaState();
}

class _ListaLeituraPaginaState extends State<ListaLeituraPagina> {
  final Repositorio _repositorio = Repositorio();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Leitura')),
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
              onPressed: () async {
                await BancoDeDados().deletarLivro(livro.id);
                setState(() {
                  _listaLeitura.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Livro removido da lista de leitura')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
