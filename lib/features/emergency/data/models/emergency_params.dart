class EmergencyParams {
  final String? note;
  final String? emergencyType;

  EmergencyParams({this.note, this.emergencyType});

  Map<String, dynamic> toJson() => {"emergency_type": "other", "note": note};
}
