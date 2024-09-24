import 'package:flutter/material.dart';
import '../repositories/repositorio.dart';
import '../models/livro_modelo.dart';

class PesquisaLivrosPagina extends StatefulWidget {
  @override
  _PesquisaLivrosPaginaState createState() => _PesquisaLivrosPaginaState();
}

class _PesquisaLivrosPaginaState extends State<PesquisaLivrosPagina> {
  final Repositorio _livroRepositorio = Repositorio(); // Defina aqui a instância
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa de Livros'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _consulta = value;
            },
            decoration: InputDecoration(
              labelText: 'Digite o título do livro',
            ),
          ),
          ElevatedButton(
            onPressed: _buscarLivros,
            child: Text('Buscar'),
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
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
