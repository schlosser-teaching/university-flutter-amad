import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_vision/flutter_vision.dart';

class YoloCameraScreen extends StatefulWidget {
  const YoloCameraScreen({super.key});

  @override
  State<YoloCameraScreen> createState() => _YoloCameraScreenState();
}

class _YoloCameraScreenState extends State<YoloCameraScreen> {
  // final FlutterVision _flutterVision = FlutterVision();
  CameraController? _cameraController;
  CameraImage? _cameraImage;
  List<Map<String, dynamic>> _yoloResults = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);

    await _cameraController!.initialize();
    await _loadYoloModel();

    _cameraController!.startImageStream(_processCameraImage);
  }

  Future<void> _loadYoloModel() async {
    // await _flutterVision.loadYoloModel(
    //     labels: 'assets/yolo-labels.txt',
    //     modelPath: 'assets/yolo-model.tflite',
    //     modelVersion: 'yolov8',
    //     numThreads: 2,
    //     useGpu: true);
  }

  Future<void> _processCameraImage(CameraImage cameraImage) async {
    _cameraImage = cameraImage;
    // final results = await _flutterVision.yoloOnFrame(
    //   bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
    //   imageHeight: cameraImage.height,
    //   imageWidth: cameraImage.width,
    //   iouThreshold: 0.4,
    //   confThreshold: 0.4,
    //   classThreshold: 0.5,
    // );

    // if (results.isNotEmpty) {
    //   setState(() => _yoloResults = results);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_cameraController != null) Stack(
            children: [
              CameraPreview(_cameraController!),
              ..._yoloResults.map((result) => _drawBoundingBox(
                MediaQuery.of(context).size,
                List.of(result['box']).sublist(0, 4).cast(),
                result['box'][4],
                result['tag'],
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawBoundingBox(Size screen, List<double> coordinates, double confidence, String tag) {
    final factorX = screen.width / (_cameraImage?.height ?? 1);
    final factorY = screen.height / (_cameraImage?.width ?? 1);

    return Positioned(
      left: coordinates[0] * factorX,
      top: coordinates[1] * factorY,
      width: (coordinates[2] - coordinates[0]) * factorX,
      height: (coordinates[3] - coordinates[1]) * factorY,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.pink, width: 2.0),
        ),
        child: Text(
          '$tag ${(confidence * 100).toStringAsFixed(0)}%',
          style: TextStyle(
            background: Paint()..color = Colors.black54,
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
