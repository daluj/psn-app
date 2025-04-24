import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'set_attendance_widget.dart' show SetAttendanceWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetAttendanceModel extends FlutterFlowModel<SetAttendanceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  String? _dateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'End Date is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for attendance_text widget.
  FocusNode? attendanceTextFocusNode;
  TextEditingController? attendanceTextTextController;
  String? Function(BuildContext, String?)?
      attendanceTextTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    dateTextControllerValidator = _dateTextControllerValidator;
  }

  @override
  void dispose() {
    dateFocusNode?.dispose();
    dateTextController?.dispose();

    attendanceTextFocusNode?.dispose();
    attendanceTextTextController?.dispose();
  }
}
