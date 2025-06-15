import 'dart:convert';
import 'dart:typed_data';

class DetectionModel {
  String? imagePath; // Stores the path of the uploaded image
  Uint8List? annotatedImage; // Stores the annotated image data
  List<String>? detectedClasses; // Stores the detected classes

  DetectionModel({
    this.imagePath,
    this.annotatedImage,
    this.detectedClasses,
  });

  // Factory method to create a DetectionModel from a JSON response
  factory DetectionModel.fromJson(Map<String, dynamic> json) {
    return DetectionModel(
      annotatedImage: json['annotated_image'] != null
          ? base64Decode(json['annotated_image'])
          : null,
      detectedClasses: json['detected_classes'] != null
          ? List<String>.from(json['detected_classes'])
          : null,
    );
  }

  // Method to clear the model data
  void clear() {
    imagePath = null;
    annotatedImage = null;
    detectedClasses = null;
  }
}