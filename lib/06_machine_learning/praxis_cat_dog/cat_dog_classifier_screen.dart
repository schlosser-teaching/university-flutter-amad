import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
import 'package:tflite_flutter_plus/src/bindings/types.dart' as tfplus;

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

    final inputImage = TensorImage.fromFile(File(file.path));

    // Tipp: https://netron.app/
    final imageProcessor = ImageProcessorBuilder()
        .add(ResizeOp(299, 299, ResizeMethod.bilinear))
        .add(NormalizeOp(0, 255.0))
        .build();
    final processedImage = imageProcessor.process(inputImage);

    final inputShape = _interpreter.getInputTensor(0).shape;
    final outputShape = _interpreter.getOutputTensor(0).shape;

    final inputBuffer = TensorBuffer.createFixedSize(inputShape, tfplus.TfLiteType.float32);
    final inputFloatList = processedImage.tensorBuffer.getDoubleList();
    inputBuffer.loadList(inputFloatList, shape: inputShape);

    final outputBuffer = TensorBuffer.createFixedSize(outputShape, tfplus.TfLiteType.float32);

    _interpreter.run(inputBuffer.buffer, outputBuffer.buffer);

    outputScores = outputBuffer.getDoubleList();
    final maxScoreIndex = outputScores!
        .indexWhere((score) => score == outputScores!.reduce((a, b) => a > b ? a : b));
    final classifiedLabel = labels[maxScoreIndex];

    setState(() => prediction = classifiedLabel);
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
