import 'package:facebook/modelos/modelos.dart';

// Usuario logado
Usuario usuarioLogado = Usuario(
  nome: "Jorge Maciel",
  urlImagem: "https://source.unsplash.com/wys9Jty8wNQ/800x600",
);

// Lista de usuarios online
List<Usuario> usuariosOnline = [
  Usuario(
    nome: "João da Silva",
    urlImagem: "https://source.unsplash.com/tidSLv-UaNs/800x600",
  ),
  Usuario(
    nome: "Maria da Silva",
    urlImagem: "https://source.unsplash.com/uJ8LNVCBjFQ/800x600",
  ),
  Usuario(
    nome: "José Carlos",
    urlImagem: "https://source.unsplash.com/MTZTGvDsHFY/800x600",
  ),
  Usuario(
    nome: "Moacir Domingues",
    urlImagem: "https://source.unsplash.com/W0i1N6FdCWA/800x600",
  ),
  Usuario(
    nome: "Anastácia Silveira",
    urlImagem: "https://source.unsplash.com/bqnbKxiIGZI/800x600",
  ),
  Usuario(
    nome: "Gregório Xavier",
    urlImagem: "https://source.unsplash.com/mnEWC72eWDM/800x600",
  ),
];

// Lista de Stories
List<Story> stories = [
  Story(
    usuario: usuariosOnline[0],
    urlImagem: "https://source.unsplash.com/JO_S6ewBqAk/800x600",
    foiVisualizado: true,
  ),
  Story(
    usuario: usuariosOnline[1],
    urlImagem: "https://source.unsplash.com/MxVkWPiJALs/800x600",
    foiVisualizado: true,
  ),
  Story(
    usuario: usuariosOnline[2],
    urlImagem: "https://source.unsplash.com/FJFPuE1MAOM/800x600",
  ),
  Story(
    usuario: usuariosOnline[3],
    urlImagem: "https://source.unsplash.com/cssvEZacHvQ/800x600",
  ),
  Story(
    usuario: usuariosOnline[4],
    urlImagem: "https://source.unsplash.com/JMHVHptLC4g/800x600",
  ),
  Story(
    usuario: usuariosOnline[5],
    urlImagem: "https://source.unsplash.com/JUrolU3FLTA/800x600",
  ),
];

// Lista de postagens
List<Post> posts = [
  Post(
      usuario: usuariosOnline[0],
      descricao: "Passeio muito legal no final de semana",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/5O6c_pLziXs/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5),
  Post(
      usuario: usuariosOnline[1],
      descricao: "Foco...",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/JhU0w96iKoY/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5),
  Post(
      usuario: usuariosOnline[2],
      descricao: "Amo essa cidade!",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/enGr5YbjQKQ/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5),
  Post(
      usuario: usuariosOnline[3],
      descricao: "Jantar em família",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/yhn4okt6ci0/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5),
  Post(
      usuario: usuariosOnline[4],
      descricao: "Melhor vinho de todos",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/3etN9PY6iNw/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5),
  Post(
      usuario: usuariosOnline[5],
      descricao: "Aque fut de domingo",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/XZ5nXSWWDAk/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5),
];
