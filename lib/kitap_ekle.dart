import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kitaplik/model/kitaplik.dart';
import 'package:image_picker/image_picker.dart';


import 'dart:async';
import 'dart:io' as Io;
import 'package:image/image.dart' as Im;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class KitapEkle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Kitap Ekle"),
      ),
      body: SingleChildScrollView(child: KitapEkleForm()),
    );
  }
}

class KitapEkleForm extends StatefulWidget {
  @override
  _KitapEkleFormState createState() => _KitapEkleFormState();
}

class _KitapEkleFormState extends State<KitapEkleForm> {
  final _formKey = GlobalKey<FormState>();
  File _file;

  @override
  Widget build(BuildContext context) {
    String baslik;
    String yazar;

    return Column(
      children: <Widget>[
        Stack(children: [
          Image.asset(
            "assets/img/change.jpg",
            fit: BoxFit.cover,
            width: 250,
            height: 250,
          ),
          Positioned(
              bottom: -10,
              right:-10,
              child: IconButton(
                onPressed: getFile,
                icon: Icon(Icons.camera_alt),
                color: Colors.grey,
              ))
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Kitap Adı"),
                    validator: (value){
                      if(value.isEmpty){
                        return "Kitap adı zorunludur";
                      }
                    },
                    onSaved: (value){
                      baslik=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Yazar Adı"),
                    validator: (value){
                      if(value.isEmpty){
                        return "Yazar adı zorunludur";
                      }
                    },
                    onSaved: (value){
                      yazar=value;
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Kaydet"),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _formKey.currentState.save();

                      Kitaplik.kitaplar.add(Kitaplik(baslik: baslik, yazar: yazar, resim_path: "assets/img/$baslik"),);

                      // load the receipt jpeg
                      /*String mImagePath = 'assets/img/67.jpeg';
                      Im.Image _receiptImage = Im.decodeImage(new File(mImagePath).readAsBytesSync());
                      Im.drawString(_receiptImage, Im.arial_48, 440, 30, 'Customer Name', color: 0xFF000000);


                      // Write it to disk as a different jpeg
                      var new_jpeg = Im.encodeJpg(_receiptImage);
                      new File('assets/img/img.jpeg').writeAsBytesSync(new_jpeg);*/



                      var snackBar = Scaffold.of(context).showSnackBar(
                        SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("$baslik kitabı kaydedildi")
                        ),
                      );

                      snackBar.closed.then((onValue){
                        Navigator.pop(context);
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void getFile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _file = image;
    });
  }
}

class SaveFile {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<Io.File> getImageFromNetwork(String url) async {

    var cacheManager = await CacheManager.getInstance();
    Io.File file = await cacheManager.getFile(url);
    return file;
  }

  Future<Io.File> saveImage(String url) async {

    final file = await getImageFromNetwork(url);
    //retrieve local path for device
    var path = await _localPath;
    Im.Image image = Im.decodeImage(file.readAsBytesSync());

    Im.Image thumbnail = Im.copyResize(image, 120);

    // Save the thumbnail as a PNG.
    return new Io.File('$path/${DateTime.now().toUtc().toIso8601String()}.png')
      ..writeAsBytesSync(Im.encodePng(thumbnail));
  }
}

