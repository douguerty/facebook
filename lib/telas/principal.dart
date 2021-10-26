import 'package:facebook/componentes/abas.dart';
import 'package:facebook/componentes/abas_desktop.dart';
import 'package:facebook/dados/dados.dart';
import 'package:facebook/telas/home.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    const Home(),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    const Scaffold(
      backgroundColor: Colors.red,
    ),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
    const Scaffold(
      backgroundColor: Colors.purple,
    ),
  ];

  int _indiceAbaSelecionada = 0;

  final List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storage_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
          ? PreferredSize(
              child: AbasDesktop(
                usuario: usuarioLogado,
                indiceAbaSelecionada: _indiceAbaSelecionada,
                onTap: (index) {
                  setState(() {
                    _indiceAbaSelecionada = index;
                  });
                },
                icones: _icones,
              ),
              preferredSize: Size(tamanho.width, 65)
            )
          : null,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            :  Abas(
              indiceAbaSelecionada: _indiceAbaSelecionada,
              onTap: (index) {
                setState(() {
                  _indiceAbaSelecionada = index;
                });
              },
              icones: _icones,
            ),
      ),
    );
  }
}
