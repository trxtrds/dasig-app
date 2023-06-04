import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminLoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for enterPassword widget.
  TextEditingController? enterPasswordController;
  late bool enterPasswordVisibility;
  String? Function(BuildContext, String?)? enterPasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    enterPasswordVisibility = false;
  }

  void dispose() {
    emailController?.dispose();
    enterPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
