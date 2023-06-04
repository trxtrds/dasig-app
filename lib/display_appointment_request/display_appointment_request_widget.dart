import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'display_appointment_request_model.dart';
export 'display_appointment_request_model.dart';

class DisplayAppointmentRequestWidget extends StatefulWidget {
  const DisplayAppointmentRequestWidget({
    Key? key,
    required this.date,
    required this.time,
    required this.userName,
  }) : super(key: key);

  final TherapyAppointmentRecord? date;
  final TherapyAppointmentRecord? time;
  final TherapyAppointmentRecord? userName;

  @override
  _DisplayAppointmentRequestWidgetState createState() =>
      _DisplayAppointmentRequestWidgetState();
}

class _DisplayAppointmentRequestWidgetState
    extends State<DisplayAppointmentRequestWidget> {
  late DisplayAppointmentRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayAppointmentRequestModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Appointment Details',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'quicksand',
                              fontSize: 24.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.9, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: Text(
                    'E-mail',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      widget.date!.email,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'quicksand',
                            color: Color(0x80768976),
                            fontSize: 24.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-0.9, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Date',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      dateTimeFormat('MMMMEEEEd', widget.date!.selectedDate!),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'quicksand',
                            color: Color(0x80768976),
                            fontSize: 24.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-0.9, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Time',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      widget.date!.selectedTime,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'quicksand',
                            color: Color(0x80768976),
                            fontSize: 24.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
