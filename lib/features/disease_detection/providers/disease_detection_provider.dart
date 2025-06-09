import 'package:flutter/material.dart';
import '../models/disease_result_model.dart';
import '../services/disease_service.dart';

class DiseaseDetectionProvider with ChangeNotifier {
  bool _isLoading = false;
  DiseaseResult? _result;
  String? _error;

  bool get isLoading => _isLoading;
  DiseaseResult? get result => _result;
  String? get error => _error;

  final PlantIdService _service = PlantIdService();

  Future<void> detectDisease(String base64Image) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _result = await _service.identifyDisease(base64Image);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
