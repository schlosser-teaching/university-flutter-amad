import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

class CatDogClassifierScreen extends StatefulWidget {
  const CatDogClassifierScreen({super.key});

  @override
  State<CatDogClassifierScreen> createState() => _CatDogClassifierScreenState();
}

class _CatDogClassifierScreenState extends State<CatDogClassifierScreen> {
  static const labels = ['Katze', 'Hund'];

  // late Interpreter _interpreter;
  File? _currentImage;
  String? prediction;
  List<double>? outputScores;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    // _interpreter = await Interpreter.fromAsset('assets/cat-dog-model-new.tflite');
  }

  @override
  void dispose() {
    // _interpreter.close();
    super.dispose();
  }

  Future<void> pickAndClassifyImage(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    if (file == null) return;

    setState(() => _currentImage = File(file.path));

    final inputImage = await _processImage(File(file.path));

    // final inputShape = _interpreter.getInputTensor(0).shape;
    // final outputShape = _interpreter.getOutputTensor(0).shape;
    //
    // final inputBuffer = Float32List(inputShape[1] * inputShape[2] * inputShape[3]);
    // inputBuffer.setAll(0, inputImage);
    //
    // final outputBuffer = List.filled(outputShape[1], 0.0);
    //
    // _interpreter.run(inputBuffer, outputBuffer);
    //
    // outputScores = outputBuffer;
    // final maxScoreIndex = outputScores!
    //     .indexWhere((score) => score == outputScores!.reduce((a, b) => a > b ? a : b));
    // final classifiedLabel = labels[maxScoreIndex];
    //
    // setState(() => prediction = classifiedLabel);
  }

  Future<List<double>> _processImage(File image) async {
    final imageBytes = await image.readAsBytes();
    final imageTensor = await _imageToTensor(imageBytes);

    return imageTensor;
  }

  Future<List<double>> _imageToTensor(Uint8List imageBytes) async {
    final tensor = List<double>.filled(299 * 299 * 3, 0.0);
    // (This is a simplified version — you may want to resize and normalize using an image processing package)
    return tensor;
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
