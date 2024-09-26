class Livro {
  final String id;
  final String titulo;
  final String autores;
  final String capa;

  Livro({
    required this.id,
    required this.titulo,
    required this.autores,
    required this.capa,
  });

  factory Livro.fromJson(Map<String, dynamic> json) {
    print(json);
    final volumeInfo = json['volumeInfo'] ?? {};

    return Livro(
      id: json['id'] ?? '',
      titulo: volumeInfo['title'] ?? 'Sem Título',
      autores: (volumeInfo['authors'] as List<dynamic>? ?? []).join(', '),
      capa: volumeInfo['imageLinks']?['thumbnail'] ?? '',
    );
  }


  // Adicione este método
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autores': autores,
      'capa': capa,
    };
  }
}
