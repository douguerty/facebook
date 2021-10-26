// import 'package:facebook/telas/home.dart';
import 'package:facebook/telas/principal.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "facebook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: PaletaCores.scaffold,
      ),
      // home: const Home(),
      home: const Principal(),
    ),
  );
}
