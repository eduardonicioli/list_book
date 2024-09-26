import 'package:flutter/material.dart';
import 'my_app.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

void main() {
  // Verifica se a plataforma é desktop (Windows, macOS ou Linux)
  if (isDesktop()) {
    // Inicializa o FFI para a utilização do sqflite em ambientes desktop
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

// Função auxiliar para verificar se está rodando em desktop
bool isDesktop() {
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}
