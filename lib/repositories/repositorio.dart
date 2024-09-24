import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/livro_modelo.dart';

class Repositorio {
  Future<List<Livro>> buscarLivros(String consulta) async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$consulta'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'] ?? [];

      return items.map((item) => Livro.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar livros');
    }
  }
}
