import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminLoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAdmin widget.
  TextEditingController? emailAdminController;
  String? Function(BuildContext, String?)? emailAdminControllerValidator;
  // State field(s) for passwordAdmin widget.
  TextEditingController? passwordAdminController;
  late bool passwordAdminVisibility;
  String? Function(BuildContext, String?)? passwordAdminControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordAdminVisibility = false;
  }

  void dispose() {
    emailAdminController?.dispose();
    passwordAdminController?.dispose();
  }

  /// Additional helper methods are added here.

}
