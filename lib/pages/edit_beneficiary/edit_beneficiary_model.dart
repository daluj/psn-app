import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'edit_beneficiary_widget.dart' show EditBeneficiaryWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBeneficiaryModel extends FlutterFlowModel<EditBeneficiaryWidget> {
  ///  State fields for stateful widgets in this page.

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
  // State field(s) for groups widget.
  int? groupsValue;
  FormFieldController<int>? groupsValueController;
  // State field(s) for pse_number widget.
  FocusNode? pseNumberFocusNode;
  TextEditingController? pseNumberTextController;
  String? Function(BuildContext, String?)? pseNumberTextControllerValidator;
  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode;
  TextEditingController? dobTextController;
  String? Function(BuildContext, String?)? dobTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for poo widget.
  FocusNode? pooFocusNode;
  TextEditingController? pooTextController;
  String? Function(BuildContext, String?)? pooTextControllerValidator;

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

    nameKhFocusNode?.dispose();
    nameKhTextController?.dispose();

    surnameKhFocusNode?.dispose();
    surnameKhTextController?.dispose();

    pseNumberFocusNode?.dispose();
    pseNumberTextController?.dispose();

    dobFocusNode?.dispose();
    dobTextController?.dispose();

    pooFocusNode?.dispose();
    pooTextController?.dispose();
  }
}
