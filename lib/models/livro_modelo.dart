class Livro {
  final String id;
  final String titulo;
  final String autores;
  final String descricao;
  final String capa;

  Livro({
    required this.id,
    required this.titulo,
    required this.autores,
    required this.descricao,
    required this.capa,
  });

  factory Livro.fromJson(Map<String, dynamic> json) {
    return Livro(
      id: json['id'],
      titulo: json['volumeInfo']['title'] ?? 'Sem Título',
      autores: (json['volumeInfo']['authors'] ?? []).join(', '),
      descricao: json['volumeInfo']['description'] ?? 'Sem Descrição',
      capa: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autores': autores,
      'descricao': descricao,
      'capa': capa,
    };
  }
}
