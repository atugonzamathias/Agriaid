import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/disease_detection_provider.dart';
import '../widgets/disease_result_card.dart';
import '../utils/image_picker_helper.dart';

class DetectDiseaseScreen extends StatelessWidget {
  const DetectDiseaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DiseaseDetectionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Detect Crop Disease')),
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : provider.result != null
            ? ResultCard(result: provider.result!)
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final base64Image = await ImagePickerHelper.pickImageAsBase64();
                if (base64Image != null) {
                  await provider.detectDisease(base64Image);
                }
              },
              child: const Text("Capture & Detect"),
            ),
            if (provider.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(provider.error!, style: const TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
