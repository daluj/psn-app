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

import 'dart:io'; //

class LocalImageWidget extends StatefulWidget {
  const LocalImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.borderWidth = 0.0, // Default no border
    this.borderRadius = 0.0, // Default square edges
    this.borderColor = Colors.black, // Default black border
  });

  final String imagePath;
  final double? width;
  final double? height;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;

  @override
  _LocalImageWidgetState createState() => _LocalImageWidgetState();
}

class _LocalImageWidgetState extends State<LocalImageWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.imagePath.isNotEmpty && File(widget.imagePath).existsSync()
        ? Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.borderWidth > 0
                    ? widget.borderColor
                    : Colors.transparent,
                width: widget.borderWidth,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: Image.file(
                File(widget.imagePath),
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover, // Adjust as needed
              ),
            ),
          )
        : const Center(
            child: Text("No Image Available"),
          );
  }
}
