import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DisplayJournalDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for titleField widget.
  TextEditingController? titleFieldController;
  String? Function(BuildContext, String?)? titleFieldControllerValidator;
  // State field(s) for bodyField widget.
  TextEditingController? bodyFieldController;
  String? Function(BuildContext, String?)? bodyFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    titleFieldController?.dispose();
    bodyFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
