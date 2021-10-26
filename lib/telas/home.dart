import 'package:facebook/componentes/area_criar_postagem.dart';
import 'package:facebook/componentes/area_storie.dart';
import 'package:facebook/componentes/botao_circulo.dart';
import 'package:facebook/componentes/lista_contatos.dart';
import 'package:facebook/componentes/lista_opcoes.dart';
import 'package:facebook/componentes/post_card.dart';
import 'package:facebook/dados/dados.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile(scrollController: _scrollController),
          desktop: HomeDesktop(scrollController: _scrollController),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text(
            "facebook",
            style: TextStyle(
              color: PaletaCores.azulFacebook,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
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
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioLogado,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStory(
              usuario: usuarioLogado,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              Post post = posts[index];
              return PostCard(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaOpcoes(
              usuario: usuarioLogado,
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: AreaStory(
                    usuario: usuarioLogado,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AreaCriarPostagem(
                  usuario: usuarioLogado,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    Post post = posts[index];
                    return PostCard(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaContatos(
              usuarios: usuariosOnline,
            ),
          ),
        ),
      ],
    );
  }
}
