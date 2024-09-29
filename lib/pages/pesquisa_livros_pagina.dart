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
      SnackBar(
          content:
              Text('Livro "${livro.titulo}" adicionado à lista de leitura')),
    );
  }

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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white, // Fundo branco
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _consulta = value;
              },
              decoration: const InputDecoration(
                labelText: 'Digite o título do livro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _buscarLivros,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _livros.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum livro encontrado.',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _livros.length,
                      itemBuilder: (context, index) {
                        final livro = _livros[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ExpansionTile(
                            leading: livro.capa.isNotEmpty
                                ? Image.network(
                                    livro.capa,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            title: Text(livro.titulo),
                            subtitle: Text(livro.autores),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(livro.descricao),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      _adicionarLivro(livro);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
