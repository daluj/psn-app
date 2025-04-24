import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'switch_project_widget.dart' show SwitchProjectWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SwitchProjectModel extends FlutterFlowModel<SwitchProjectWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for end_date widget.
  FocusNode? endDateFocusNode;
  TextEditingController? endDateTextController;
  String? Function(BuildContext, String?)? endDateTextControllerValidator;
  String? _endDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Old Project End Date is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for start_date widget.
  FocusNode? startDateFocusNode;
  TextEditingController? startDateTextController;
  String? Function(BuildContext, String?)? startDateTextControllerValidator;
  String? _startDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'New Project Start Date is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for from_proyect widget.
  FocusNode? fromProyectFocusNode;
  TextEditingController? fromProyectTextController;
  String? Function(BuildContext, String?)? fromProyectTextControllerValidator;
  // State field(s) for to_project widget.
  int? toProjectValue;
  FormFieldController<int>? toProjectValueController;

  @override
  void initState(BuildContext context) {
    endDateTextControllerValidator = _endDateTextControllerValidator;
    startDateTextControllerValidator = _startDateTextControllerValidator;
  }

  @override
  void dispose() {
    endDateFocusNode?.dispose();
    endDateTextController?.dispose();

    startDateFocusNode?.dispose();
    startDateTextController?.dispose();

    fromProyectFocusNode?.dispose();
    fromProyectTextController?.dispose();
  }
}
