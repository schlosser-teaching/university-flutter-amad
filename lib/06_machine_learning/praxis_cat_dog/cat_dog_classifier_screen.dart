import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class CatDogClassifierScreen extends StatefulWidget {
  const CatDogClassifierScreen({super.key});

  @override
  State<CatDogClassifierScreen> createState() => _CatDogClassifierScreenState();
}

class _CatDogClassifierScreenState extends State<CatDogClassifierScreen> {
  static const labels = ['Katze', 'Hund'];

  late Interpreter _interpreter;
  File? _currentImage;
  String? prediction;
  List<double>? outputScores;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/cat-dog-model-new.tflite');
  }

  @override
  void dispose() {
    _interpreter.close();
    super.dispose();
  }

  Future<void> pickAndClassifyImage(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    if (file == null) return;

    setState(() => _currentImage = File(file.path));

    final inputTensor = _interpreter.getInputTensor(0);
    final outputTensor = _interpreter.getOutputTensor(0);

    final h = inputTensor.shape[1];
    final w = inputTensor.shape[2];
    final c = inputTensor.shape[3];

    final input = await _processImage(File(file.path), height: h, width: w, channels: c);

    final output = [List.filled(outputTensor.shape[1], 0.0)];
    _interpreter.run(input, output);

    outputScores = output.first.cast<double>();
    final maxIdx = outputScores!
        .indexWhere((s) => s == outputScores!.reduce((a, b) => a > b ? a : b));
    final classifiedLabel = labels[maxIdx];

    setState(() => prediction = classifiedLabel);
  }


  Future<List<List<List<List<double>>>>> _processImage(
      File image, {
        required int height,
        required int width,
        required int channels,
      }) async {
    final bytes = await image.readAsBytes();
    final decoded = img.decodeImage(bytes)!;
    final resized = img.copyResize(decoded, width: width, height: height);

    return [
      List.generate(
        height,
            (y) => List.generate(
          width,
              (x) {
            final p = resized.getPixel(x, y);
            final r = p.r / 255.0;
            final g = p.g / 255.0;
            final b = p.b / 255.0;
            return channels == 3 ? <double>[r, g, b] : <double>[r];
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Katze oder Hund?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.file(_currentImage!, height: 150.0),
              ),
            if (prediction != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Klasse: $prediction\nConfidence: ${outputScores?.map((e) => e.toStringAsFixed(2)).join(', ')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => pickAndClassifyImage(ImageSource.camera),
                  child: const Text('Kamera'),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () => pickAndClassifyImage(ImageSource.gallery),
                  child: const Text('Galerie'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
