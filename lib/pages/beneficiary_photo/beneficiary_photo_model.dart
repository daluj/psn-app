import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'beneficiary_photo_widget.dart' show BeneficiaryPhotoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BeneficiaryPhotoModel extends FlutterFlowModel<BeneficiaryPhotoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name_en widget.
  FocusNode? nameEnFocusNode;
  TextEditingController? nameEnTextController;
  String? Function(BuildContext, String?)? nameEnTextControllerValidator;
  String? _nameEnTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'English Name is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for surname_en widget.
  FocusNode? surnameEnFocusNode;
  TextEditingController? surnameEnTextController;
  String? Function(BuildContext, String?)? surnameEnTextControllerValidator;
  String? _surnameEnTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'English Surname is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameEnTextControllerValidator = _nameEnTextControllerValidator;
    surnameEnTextControllerValidator = _surnameEnTextControllerValidator;
  }

  @override
  void dispose() {
    nameEnFocusNode?.dispose();
    nameEnTextController?.dispose();

    surnameEnFocusNode?.dispose();
    surnameEnTextController?.dispose();
  }
}
