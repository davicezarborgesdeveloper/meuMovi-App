import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/ui/styles/colors_app.dart';

class ImageWidget extends StatelessWidget {
  final void Function(Uint8List value) setImage;
  final String? urlImage;
  // final Uint8List? image;
  const ImageWidget(this.setImage, this.urlImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> getFromWeb(Function(Uint8List) onImageSelected) async {
      final FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      final Uint8List? file = result?.files.single.bytes;
      if (file != null) {
        onImageSelected(file);
      }
    }

    void selecionarImagem() async {
      if (kIsWeb) {
        getFromWeb((Uint8List image) {
          setImage(image);
        });
      } else if (Platform.isAndroid) {
        showModalBottomSheet(
          context: context,
          builder: (_) => ImageSourceModal((Uint8List image) {
            setImage(image);
            Navigator.of(context).pop();
          }),
        );
      } else {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => ImageSourceModal((Uint8List image) {
            setImage(image);
            Navigator.of(context).pop();
          }),
        );
      }
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipOval(
            child: urlImage == null
                ? Image.asset(
                    'assets/images/perfil.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    urlImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 0,
          child: GestureDetector(
            onTap: selecionarImagem,
            child: CircleAvatar(
              backgroundColor: ColorsApp.i.primary,
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

enum TypeSource {
  camera,
  gallery,
}

class ImageSourceModal extends StatelessWidget {
  final Function(Uint8List) onImageSelected;
  const ImageSourceModal(this.onImageSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              child: const Text('Câmera'),
              onPressed: () => getFromSource(TypeSource.camera),
            ),
            TextButton(
              child: const Text('Galeria'),
              onPressed: () => getFromSource(TypeSource.gallery),
            )
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            onPressed: () => getFromSource(TypeSource.camera),
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: () => getFromSource(TypeSource.gallery),
          )
        ],
      );
    }
  }

  Future<void> getFromSource(TypeSource typeSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: typeSource == TypeSource.camera
          ? ImageSource.camera
          : ImageSource.gallery,
    );
    if (file == null) return;
    onImageSelected(File(file.path).readAsBytesSync());
  }
}
