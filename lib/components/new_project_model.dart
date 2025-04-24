import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'new_project_widget.dart' show NewProjectWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewProjectModel extends FlutterFlowModel<NewProjectWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameTextController;
  String? Function(BuildContext, String?)? projectNameTextControllerValidator;
  String? _projectNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for projectCode widget.
  FocusNode? projectCodeFocusNode;
  TextEditingController? projectCodeTextController;
  String? Function(BuildContext, String?)? projectCodeTextControllerValidator;
  String? _projectCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Code  is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for start_date widget.
  FocusNode? startDateFocusNode;
  TextEditingController? startDateTextController;
  String? Function(BuildContext, String?)? startDateTextControllerValidator;
  String? _startDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Start Date is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for end_date widget.
  FocusNode? endDateFocusNode;
  TextEditingController? endDateTextController;
  String? Function(BuildContext, String?)? endDateTextControllerValidator;
  String? _endDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'End Date is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    projectNameTextControllerValidator = _projectNameTextControllerValidator;
    projectCodeTextControllerValidator = _projectCodeTextControllerValidator;
    startDateTextControllerValidator = _startDateTextControllerValidator;
    endDateTextControllerValidator = _endDateTextControllerValidator;
  }

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameTextController?.dispose();

    projectCodeFocusNode?.dispose();
    projectCodeTextController?.dispose();

    startDateFocusNode?.dispose();
    startDateTextController?.dispose();

    endDateFocusNode?.dispose();
    endDateTextController?.dispose();
  }
}
