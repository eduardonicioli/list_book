class Livro {
  final String id;
  final String titulo;
  final String autores;
  final String capa;
  final String descricao;

  Livro({
    required this.id,
    required this.titulo,
    required this.autores,
    required this.capa,
    required this.descricao,
  });

  // Atualizando o factory constructor para incluir a descrição
  factory Livro.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};

    return Livro(
      id: json['id'] ?? '',
      titulo: volumeInfo['title'] ?? 'Sem Título',
      autores: (volumeInfo['authors'] as List<dynamic>? ?? []).join(', '),
      capa: volumeInfo['imageLinks']?['thumbnail'] ?? '',
      descricao: volumeInfo['description'] ??
          'Descrição não disponível',
    );
  }

  // Método para converter o objeto Livro em um mapa (usado em banco de dados, por exemplo)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autores': autores,
      'capa': capa,
      'descricao': descricao, // Inclui a descrição no mapeamento
    };
  }
}
