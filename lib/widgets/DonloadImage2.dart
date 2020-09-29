import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyStatefulTest extends StatefulWidget {
  MyStatefulTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyStatefulTestState createState() => new MyStatefulTestState();
}

class MyStatefulTestState extends State<MyStatefulTest> {
  ui.Image _image;

  @override
  void initState() {
    loadImage();
  }

  loadImage() async {
    ByteData bd = await rootBundle.load('assets/images/bonfire.jpg');

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final ui.Codec codec = await ui.instantiateImageCodec(bytes);

    final ui.Image image = (await codec.getNextFrame()).image;

    setState(() => _image = image);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Title!')),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          //child: Image.asset('assets/images/bonfire.jpg'),
          child: CustomPaint(
            painter: ImageEditor(_image),
          ),
        ),
      ),
    );
  }
}

class ImageEditor extends CustomPainter {
  ui.Image image;

  ImageEditor(this.image) : super();

  @override
  Future paint(Canvas canvas, Size size) async {
    if (image != null) {
      canvas.drawImage(image, Offset(0.0, 0.0), Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return image != (oldDelegate as ImageEditor).image;
  }
}
