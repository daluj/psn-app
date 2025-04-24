import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'new_staff_widget.dart' show NewStaffWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewStaffModel extends FlutterFlowModel<NewStaffWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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

  // State field(s) for name_kh widget.
  FocusNode? nameKhFocusNode;
  TextEditingController? nameKhTextController;
  String? Function(BuildContext, String?)? nameKhTextControllerValidator;
  // State field(s) for surname_kh widget.
  FocusNode? surnameKhFocusNode;
  TextEditingController? surnameKhTextController;
  String? Function(BuildContext, String?)? surnameKhTextControllerValidator;
  // State field(s) for pse_number widget.
  FocusNode? pseNumberFocusNode;
  TextEditingController? pseNumberTextController;
  String? Function(BuildContext, String?)? pseNumberTextControllerValidator;
  // State field(s) for prefix widget.
  FocusNode? prefixFocusNode;
  TextEditingController? prefixTextController;
  String? Function(BuildContext, String?)? prefixTextControllerValidator;
  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone Number is required';
    }

    return null;
  }

  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for project widget.
  int? projectValue;
  FormFieldController<int>? projectValueController;
  // State field(s) for salary widget.
  FocusNode? salaryFocusNode;
  TextEditingController? salaryTextController;
  String? Function(BuildContext, String?)? salaryTextControllerValidator;
  // State field(s) for account_number widget.
  FocusNode? accountNumberFocusNode;
  TextEditingController? accountNumberTextController;
  String? Function(BuildContext, String?)? accountNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameEnTextControllerValidator = _nameEnTextControllerValidator;
    surnameEnTextControllerValidator = _surnameEnTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    nameEnFocusNode?.dispose();
    nameEnTextController?.dispose();

    surnameEnFocusNode?.dispose();
    surnameEnTextController?.dispose();

    nameKhFocusNode?.dispose();
    nameKhTextController?.dispose();

    surnameKhFocusNode?.dispose();
    surnameKhTextController?.dispose();

    pseNumberFocusNode?.dispose();
    pseNumberTextController?.dispose();

    prefixFocusNode?.dispose();
    prefixTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    salaryFocusNode?.dispose();
    salaryTextController?.dispose();

    accountNumberFocusNode?.dispose();
    accountNumberTextController?.dispose();
  }
}
