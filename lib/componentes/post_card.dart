import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/componentes/imagem_perfil.dart';
import 'package:facebook/modelos/post.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: isDesktop ? 5 : 8
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
          : null,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            // Cabeçalho
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(post: post),
                  Text(post.descricao),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                imageUrl: post.urlImagem,
              ),
            ),
            // Estatísticas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PostEstatic(
                post: post,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostEstatic extends StatelessWidget {
  final Post post;
  const PostEstatic({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                "${post.curtidas}",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Text(
              "${post.comentarios} comentários",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 8),
            Text(
              "${post.compartilhamentos} compartilhamentos",
              style: TextStyle(color: Colors.grey[700]),
            )
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            PostButtons(
              icone: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              texto: "Curtir",
              onTap: () {},
            ),
            PostButtons(
              icone: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              texto: "Comentar",
              onTap: () {},
            ),
            PostButtons(
              icone: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              texto: "Compartilhar",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class PostButtons extends StatelessWidget {
  final Icon icone;
  final String texto;
  final VoidCallback onTap;
  const PostButtons({
    Key? key,
    required this.icone,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Row(
              children: [
                icone,
                const SizedBox(width: 4),
                Text(
                  texto,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlIimagem: post.usuario.urlImagem,
          foiVizualizado: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text("${post.tempoAtras} - "),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
