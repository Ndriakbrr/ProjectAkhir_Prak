import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);

    try {
      await _cameraController.initialize();
    } catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Camera Activation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isCameraInitialized
                  ? CameraPreview(_cameraController)
                  : CircularProgressIndicator(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add logic to capture image or perform other actions
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, foregroundColor: Colors.white),
                child: const Text('Activate Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const Converter());
}