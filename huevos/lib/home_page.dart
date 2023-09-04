import 'dart:io';
import 'package:flutter/material.dart';
import 'package:huevos/acciones/camara.dart';
import 'package:huevos/acciones/selec.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? sele_img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ovitraap Menú'),
      ),
      body: Column(
        children: [
          sele_img != null
              ? Image.file(sele_img!)
              : Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  color: Colors.black,
                ),
          ElevatedButton(
              onPressed: () async {
                final cama = await getImageC();
                if (cama == null) return;
                setState(() {
                  sele_img = File(cama.path);
                });
              },
              child: const Text("Tomar Foto")),
          ElevatedButton(
              onPressed: () async {
                final simagen = await getImage();
                if (simagen == null) return;
                setState(() {
                  sele_img = File(simagen.path);
                });
              },
              child: const Text("Seleccionar Imagen")),
          ElevatedButton(
              onPressed: () {},
              child: const Text("Subir Imagen para su Análisis"))
        ],
      ),
    );
  }
}
