import 'package:flutter/material.dart';
import 'package:kitaplik/kitap_liste.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
        home: KitaplikListe()
    );
  }
}