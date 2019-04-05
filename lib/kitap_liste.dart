import 'package:flutter/material.dart';
import 'package:kitaplik/model/kitaplik.dart';
import 'package:kitaplik/kitap_ekle.dart';


class KitaplikListe extends StatefulWidget {
  @override
  _KitaplikListeState createState() => _KitaplikListeState();
}

class _KitaplikListeState extends State<KitaplikListe> {
  List<Kitaplik> kitaplar;

  @override
  void initState() {
    kitaplar = Kitaplik.kitaplar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = "Kitaplarım";
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> KitapEkle()));
        }, child: Icon(Icons.add),),
        appBar: AppBar(
        title: Text(title),
        ),
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: List.generate(kitaplar.length, (index) {
              return Center(
                child: KitaplikCard(choice: kitaplar[index], item: kitaplar[index]),
              );
            }
            )
        )
    );
  }
}

class KitaplikCard extends StatelessWidget {
  const KitaplikCard(
      {Key key, this.choice, this.onTap, @required this.item, this.selected: false}
      ) : super(key: key);

  final Kitaplik choice;
  final VoidCallback onTap;
  final Kitaplik item;
  final bool selected;



  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Image.asset(choice.resim_path)),
            new Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(choice.baslik, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left, maxLines: 5,),
                      new Text(choice.yazar, style: TextStyle(fontStyle: FontStyle.italic), textAlign: TextAlign.left, maxLines: 5,),
                    ],
                  ),
                )
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
    );
  }
}

