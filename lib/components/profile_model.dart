import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for project widget.
  int? projectValue;
  FormFieldController<int>? projectValueController;
  // Stores action output result for [Backend Call - SQLite (getProject)] action in project widget.
  List<GetProjectRow>? project;
  // State field(s) for group widget.
  int? groupValue;
  FormFieldController<int>? groupValueController;
  // Stores action output result for [Backend Call - SQLite (getGroup)] action in group widget.
  List<GetGroupRow>? group;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
