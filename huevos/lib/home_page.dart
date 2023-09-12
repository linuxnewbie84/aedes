import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:huevos/acciones/camara.dart';
import 'package:huevos/acciones/selec.dart';

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
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
         children: [
              Image.asset(
                'assets/images/logo.png',
                scale: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Ovitraapp',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sele_img != null
              ? Image.file(sele_img!)
              : Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  color: Color.fromARGB(179, 54, 54, 54),
                ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.yellow),
              onPressed: () async {
                final cama = await getImageC();
                if (cama != null) {
                  CroppedFile? croppedFile = await ImageCropper().cropImage(
                    sourcePath: cama.path,
                    aspectRatioPresets: [
                      CropAspectRatioPreset.square,
                      CropAspectRatioPreset.ratio3x2,
                      CropAspectRatioPreset.original,
                      CropAspectRatioPreset.ratio4x3,
                      CropAspectRatioPreset.ratio16x9
                    ],
                    uiSettings: [
                      AndroidUiSettings(
                          toolbarTitle: 'Dimensionando para Análisis',
                          toolbarColor: Colors.deepOrange,
                          toolbarWidgetColor: Colors.white,
                          initAspectRatio: CropAspectRatioPreset.original,
                          lockAspectRatio: false),
                      IOSUiSettings(
                        title: 'Dimensión de Imagen',
                      ),
                    ],
                  );
                  if (croppedFile != null) {
                    setState(() {
                      sele_img = File(croppedFile.path);
                    });
                  }
                }
              },
              child: const Text("Tomar Foto",)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.yellow),
              onPressed: () async {
                final simagen = await getImage();
                if (simagen != null) {
                  CroppedFile? croppedFile = await ImageCropper().cropImage(
                    sourcePath: simagen.path,
                    aspectRatioPresets: [
                      CropAspectRatioPreset.square,
                      CropAspectRatioPreset.ratio3x2,
                      CropAspectRatioPreset.original,
                      CropAspectRatioPreset.ratio4x3,
                      CropAspectRatioPreset.ratio16x9
                    ],
                    uiSettings: [
                      AndroidUiSettings(
                          toolbarTitle: 'Dimensionando para Análisis',
                          toolbarColor: Colors.deepOrange,
                          toolbarWidgetColor: Colors.white,
                          initAspectRatio: CropAspectRatioPreset.original,
                          lockAspectRatio: false),
                      IOSUiSettings(
                        title: 'Dimensión de Imagen',
                      ),
                    ],
                  );
                  if (croppedFile != null) {
                    setState(() {
                      sele_img = File(croppedFile.path);
                    });
                  }
                }
              },
              child: const Text("Seleccionar Imagen")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.yellow),
              onPressed: () {},
              child: const Text("Subir Imagen para su Análisis"))
        ],
      ),
    );
  }
}
