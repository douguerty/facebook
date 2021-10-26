import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/componentes/imagem_perfil.dart';
import 'package:facebook/dados/dados.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';

class AreaStory extends StatelessWidget {
  final Usuario usuario;
  final List<Story> stories;

  const AreaStory({
    Key? key,
    required this.usuario,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            Story storyUsuario = Story(
              usuario: usuarioLogado,
              urlImagem: usuarioLogado.urlImagem,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                addStory: true,
                story: storyUsuario,
              ),
            );
          }

          Story story = stories[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  final bool addStory;

  const StoryCard({
    Key? key,
    required this.story,
    this.addStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.storyFade,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: PaletaCores.azulFacebook,
                    onPressed: () {},
                  ),
                )
              : ImagemPerfil(
                  urlIimagem: story.usuario.urlImagem,
                  foiVizualizado: story.foiVisualizado,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            addStory ? "Criar Story" : story.usuario.nome,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
