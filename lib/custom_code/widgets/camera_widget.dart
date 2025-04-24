// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    super.key,
    this.width,
    this.height,
    required this.onPhotoCaptured,
  });

  final double? width;
  final double? height;
  final Future Function(String filePath) onPhotoCaptured;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  Future<CaptureRequest> _buildPhotoPath(Sensor sensor) async {
    final directory = await getApplicationDocumentsDirectory();
    final String fileName =
        'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final String filePath = '${directory.path}/$fileName';

    return SingleCaptureRequest(filePath, sensor);
  }

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(
        pathBuilder: (sensors) async {
          // Ensure we're passing a single Sensor, not a List<Sensor>
          if (sensors.isNotEmpty) {
            return await _buildPhotoPath(
                sensors.first); // Use the first available sensor
          } else {
            throw Exception("No sensors available");
          }
        },
      ),
      onMediaCaptureEvent: (event) async {
        if (event.status == MediaCaptureStatus.success && event.isPicture) {
          event.captureRequest.when(
            single: (single) async {
              final filePath = single.file?.path;
              if (filePath != null) {
                // Save the photo to the gallery
                // final success = await GallerySaver.saveImage(filePath);
                //if (success == true) {
                //  print('Photo saved to gallery successfully');
                // } else {
                //   print('Failed to save photo to gallery');
                // }
                // Notify the callback function with the file path
                await widget.onPhotoCaptured(filePath);
              }
            },
            multiple: (multiple) {
              // Handle multiple captures if needed
            },
          );
        } else if (event.status == MediaCaptureStatus.failure) {
          print('Failed to capture photo: ${event.exception}');
        }
      },
    );
  }
}
