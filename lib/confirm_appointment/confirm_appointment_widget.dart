import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'confirm_appointment_model.dart';
export 'confirm_appointment_model.dart';

class ConfirmAppointmentWidget extends StatefulWidget {
  const ConfirmAppointmentWidget({Key? key}) : super(key: key);

  @override
  _ConfirmAppointmentWidgetState createState() =>
      _ConfirmAppointmentWidgetState();
}

class _ConfirmAppointmentWidgetState extends State<ConfirmAppointmentWidget> {
  late ConfirmAppointmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmAppointmentModel());
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
              Container(
                width: 413.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.9, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('selectTime');
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: Color(0x804F5C4F),
                          size: 34.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Text(
                    'Confirm your appointment',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          fontSize: 24.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: Text(
                    'Selected Date',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    dateTimeFormat('MMMMEEEEd', FFAppState().selectedDate),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          color: Color(0xFF768976),
                          fontSize: 24.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Selected Time',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    FFAppState().selectedTime,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'quicksand',
                          color: Color(0xFF768976),
                          fontSize: 24.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (FFAppState().dateToday == getCurrentTimestamp) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Appointment limit!'),
                                  content: Text(
                                      'You have already made an appointment request. Come back tomorrow!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          } else {
                            setState(() {
                              FFAppState().selectedDate =
                                  FFAppState().selectedDate;
                              FFAppState().selectedTime =
                                  FFAppState().selectedTime;
                            });

                            final therapyAppointmentCreateData =
                                createTherapyAppointmentRecordData(
                              email: currentUserEmail,
                              selectedDate: FFAppState().selectedDate,
                              selectedTime: FFAppState().selectedTime,
                            );
                            await TherapyAppointmentRecord.collection
                                .doc()
                                .set(therapyAppointmentCreateData);
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Request sent!'),
                                      content: Text(
                                          'Your appointment request has been sent to office of SWC. Kindly wait for their response via your e-mail. Thank you!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirm'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            await launchUrl(Uri(
                                scheme: 'mailto',
                                path: 'rixcka0113@gmail.com',
                                query: {
                                  'subject': 'APPOINTMENT REQUEST',
                                  'body': functions.sMSText(
                                      currentUserEmail,
                                      FFAppState().selectedDate,
                                      FFAppState().selectedTime)!,
                                }
                                    .entries
                                    .map((MapEntry<String, String> e) =>
                                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&')));

                            context.pushNamed('dashboardPage');
                          }

                          setState(() {
                            FFAppState().dateToday = getCurrentTimestamp;
                          });
                        },
                        text: 'Confirm',
                        options: FFButtonOptions(
                          width: 153.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x80768976),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'quicksand',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                useGoogleFonts: false,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor: Color(0x80768976),
                          hoverTextColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
