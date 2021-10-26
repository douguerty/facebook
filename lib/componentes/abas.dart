import 'package:facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class Abas extends StatelessWidget {
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool indicadorEmbaixo;

  const Abas({
    Key? key,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
    this.indicadorEmbaixo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
        border: indicadorEmbaixo
            ? const Border(
                bottom: BorderSide(
                  color: PaletaCores.azulFacebook,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: PaletaCores.azulFacebook,
                ),
        )
      ),
      tabs: icones
          .asMap()
          .map((index, icone) {
            return MapEntry(
              index,
              Tab(
                icon: Icon(
                  icone,
                  color: indiceAbaSelecionada == index
                      ? PaletaCores.azulFacebook
                      : Colors.black54,
                  size: 30,
                ),
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
