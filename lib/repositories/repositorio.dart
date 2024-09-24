import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/livro_modelo.dart';

class Repositorio {
  Future<List<Livro>> buscarLivros(String consulta) async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$consulta'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Livro> livros = (data['items'] as List)
          .map((item) => Livro.fromJson(item['volumeInfo']))
          .toList();
      return livros;
    } else {
      throw Exception('Falha ao carregar livros');
    }
  }
}
