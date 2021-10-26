import 'package:facebook/modelos/modelos.dart';

class Story {
  Usuario usuario;
  String urlImagem;
  bool foiVisualizado;

  Story({
    required this.usuario,
    required this.urlImagem,
    this.foiVisualizado = false,
  });
}
