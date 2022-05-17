import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foto App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraScreen(title: 'Foto'),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  var imagem;
  var imagem_temporaria;
  final ImagePicker _picker = ImagePicker();

  getImagemGaleria() async {
    final XFile? imagem_temporaria =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagem = imagem_temporaria;
    });
  }

  getImagemCamera() async {
    final XFile? imagem_temporaria =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imagem = imagem_temporaria;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: imagem != null
                ? Image.file(File(imagem!.path))
                : const Center(
                    child: Text("Selecione..."),
                  ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  getImagemCamera();
                },
                icon: const Icon(Icons.camera_alt),
                iconSize: 50,
                color: Colors.green,
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  getImagemGaleria();
                },
                icon: const Icon(Icons.image),
                iconSize: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
