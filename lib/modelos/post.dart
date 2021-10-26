import 'package:facebook/modelos/modelos.dart';

class Post {
  Usuario usuario;
  String descricao;
  String tempoAtras;
  String urlImagem;
  int curtidas;
  int comentarios;
  int compartilhamentos;

  Post({
    required this.usuario,
    required this.descricao,
    required this.tempoAtras,
    required this.urlImagem,
    this.curtidas = 0,
    this.comentarios = 0,
    this.compartilhamentos = 0,
  });
}
