import 'package:facebook/componentes/abas.dart';
import 'package:facebook/componentes/botao_circulo.dart';
import 'package:facebook/componentes/botao_imagem_perfil.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AbasDesktop extends StatelessWidget {
  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;

  const AbasDesktop({
    Key? key,
    required this.usuario,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Expanded(
            child: Abas(
              indiceAbaSelecionada: indiceAbaSelecionada,
              onTap: onTap,
              icones: icones,
              indicadorEmbaixo: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: () {},
                ),
                BotaoCirculo(
                  icone: Icons.search,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
                BotaoCirculo(
                  icone: LineIcons.facebookMessenger,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
