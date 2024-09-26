import 'package:flutter/material.dart';
import '../repositories/repositorio.dart';
import '../models/livro_modelo.dart';
import '../database/banco_de_dados.dart';

class PesquisaLivrosPagina extends StatefulWidget {
  @override
  _PesquisaLivrosPaginaState createState() => _PesquisaLivrosPaginaState();
}

class _PesquisaLivrosPaginaState extends State<PesquisaLivrosPagina> {
  final Repositorio _livroRepositorio = Repositorio();
  List<Livro> _livros = [];
  String _consulta = '';

  Future<void> _buscarLivros() async {
    if (_consulta.isNotEmpty) {
      final livros = await _livroRepositorio.buscarLivros(_consulta);
      setState(() {
        _livros = livros;
      });
    }
  }

  Future<void> _adicionarLivro(Livro livro) async {
    await BancoDeDados().inserirLivro(livro);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Livro "${livro.titulo}" adicionado à lista de leitura')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa de Livros'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _consulta = value;
            },
            decoration: const InputDecoration(
              labelText: 'Digite o título do livro',
            ),
          ),
          ElevatedButton(
            onPressed: _buscarLivros,
            child: const Text('Buscar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _livros.length,
              itemBuilder: (context, index) {
                final livro = _livros[index];
                return ListTile(
                  title: Text(livro.titulo),
                  subtitle: Text(livro.autores),
                  leading: livro.capa.isNotEmpty
                      ? Image.network(livro.capa)
                      : null,
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      _adicionarLivro(livro);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
