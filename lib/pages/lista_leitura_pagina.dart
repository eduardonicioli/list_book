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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Minha lista de leitura',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ), // Remove a sombra da AppBar
      ),
      body: Container(
        color: Colors.white, // Fundo branco
        padding: const EdgeInsets.all(16.0),
        child: _listaLeitura.isEmpty
            ? const Center(
                child: Text(
                  'Nenhum livro adicionado à lista de leitura.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: _listaLeitura.length,
                itemBuilder: (context, index) {
                  final livro = _listaLeitura[index];
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
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removerLivro(livro.id);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
