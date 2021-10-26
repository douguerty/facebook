import 'package:facebook/componentes/imagem_perfil.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:flutter/material.dart';

class BotaoImagemPerfil extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback onTap;

  const BotaoImagemPerfil({
    Key? key,
    required this.usuario,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagemPerfil(
            urlIimagem: usuario.urlImagem,
            foiVizualizado: true,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              usuario.nome,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
