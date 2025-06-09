class DiseaseResult {
  final String? plantName;
  final List<Disease>? diseases;

  DiseaseResult({this.plantName, this.diseases});

  factory DiseaseResult.fromJson(Map<String, dynamic> json) {
    final suggestions = json['suggestions'] as List<dynamic>?;
    final firstSuggestion = suggestions != null && suggestions.isNotEmpty ? suggestions.first : null;
    final diseases = (firstSuggestion != null ? firstSuggestion['diseases'] as List<dynamic>? : []) ?? [];

    return DiseaseResult(
      plantName: firstSuggestion != null ? firstSuggestion['plant_name'] : null,
      diseases: diseases.map((d) => Disease.fromJson(d)).toList(),
    );
  }
}

class Disease {
  final String name;
  final String description;
  final String treatment;

  Disease({required this.name, required this.description, required this.treatment});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      name: json['name'] ?? 'Unknown Disease',
      description: json['description'] ?? 'No description available.',
      treatment: (json['treatment']?['biological'] ?? []).join(', '),
    );
  }
}
