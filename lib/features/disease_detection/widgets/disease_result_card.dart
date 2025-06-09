import 'package:flutter/material.dart';
import '../models/disease_result_model.dart';

class ResultCard extends StatelessWidget {
  final DiseaseResult result;

  const ResultCard({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasDisease = result.diseases != null && result.diseases!.isNotEmpty;
    final disease = hasDisease ? result.diseases!.first : null;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Plant: ${result.plantName ?? 'Unknown'}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (disease != null) ...[
              Text("Disease: ${disease.name}"),
              const SizedBox(height: 4),
              Text("Description: ${disease.description}"),
              const SizedBox(height: 4),
              Text("Treatment: ${disease.treatment}"),
            ] else
              const Text("No disease detected."),
          ],
        ),
      ),
    );
  }
}
