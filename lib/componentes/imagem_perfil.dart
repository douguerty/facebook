import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class ImagemPerfil extends StatelessWidget {
  final String urlIimagem;
  final bool foiVizualizado;
  const ImagemPerfil({
    Key? key,
    required this.urlIimagem,
    this.foiVizualizado = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: PaletaCores.azulFacebook,
      child: CircleAvatar(
        radius: foiVizualizado ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(urlIimagem),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
