import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'q5_model.dart';
export 'q5_model.dart';

class Q5Widget extends StatefulWidget {
  const Q5Widget({
    Key? key,
    this.isDoneMoodTracker,
    this.journalEntry,
  }) : super(key: key);

  final MoodTrackerRecord? isDoneMoodTracker;
  final MoodTrackerRecord? journalEntry;

  @override
  _Q5WidgetState createState() => _Q5WidgetState();
}

class _Q5WidgetState extends State<Q5Widget> {
  late Q5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Q5Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 415.6,
                height: 78.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.72, -0.18),
                      child: Text(
                        'Mood Bud',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 34.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 356.3,
                height: 748.2,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(4.4, 0.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.77, -0.93),
                        child: Text(
                          'Question 5/5',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(97.06, -0.49),
                        child: Text(
                          'Were you able \nto stay calm and focused today?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 34.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.02, 0.84),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.sliderValue == 0.0) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Missing answer!'),
                                    content:
                                        Text('Slide it to your chosen answer'),
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
                            } else {
                              setState(() {
                                FFAppState().questionFive =
                                    functions.convertStringToInt(
                                        _model.sliderValue?.toString());
                              });
                              setState(() {
                                FFAppState().totalScore = functions.totalScore(
                                    FFAppState().questionOne,
                                    FFAppState().questionTwo,
                                    FFAppState().questionThree,
                                    FFAppState().questionFour,
                                    FFAppState().questionFive)!;
                                FFAppState().actionDate = getCurrentTimestamp;
                                FFAppState().entryNumber =
                                    FFAppState().entryNumber;
                              });

                              final moodTrackerCreateData =
                                  createMoodTrackerRecordData(
                                createdAt: FFAppState().actionDate,
                                questionOne: FFAppState().questionOne,
                                questionTwo: FFAppState().questionTwo,
                                questionThree: FFAppState().questionThree,
                                questionFour: FFAppState().questionFour,
                                questionFive: FFAppState().questionFive,
                                totalScore: FFAppState().totalScore,
                                createdBy: currentUserReference,
                                email: currentUserEmail,
                                displayName: currentUserDisplayName,
                                journalEntry: FFAppState().journalEntry,
                                journalTitle: FFAppState().journalTitle,
                                actionNumber: FFAppState().entryNumber,
                              );
                              await MoodTrackerRecord.collection
                                  .doc()
                                  .set(moodTrackerCreateData);
                              if (FFAppState().totalScore >= 13) {
                                context.pushNamed('PosEvalPage');
                              } else {
                                if (FFAppState().totalScore >= 9) {
                                  context.pushNamed('NeuEvalPage');
                                } else {
                                  context.pushNamed('NegaEvalPage');
                                }
                              }
                            }
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: 160.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF9EAF9E),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.84),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: LinearPercentIndicator(
                            percent: 1.0,
                            width: 336.0,
                            lineHeight: 24.0,
                            animation: true,
                            progressColor: Color(0xFF9EAF9E),
                            backgroundColor:
                                FlutterFlowTheme.of(context).lineColor,
                            barRadius: Radius.circular(20.0),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.7, -0.14),
                        child: Text(
                          'Do you have any little improvements\nwith yourself?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.03, 0.07),
                        child: Container(
                          width: 325.3,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Slider(
                            activeColor: Color(0xFFCBD4CB),
                            inactiveColor: Color(0xFFCBD4CB),
                            min: 0.0,
                            max: 3.0,
                            value: _model.sliderValue ??= 0.0,
                            label: _model.sliderValue.toString(),
                            divisions: 3,
                            onChanged: (newValue) {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(0));
                              setState(() => _model.sliderValue = newValue);
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.93, 0.31),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/i51w6_3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.05, 0.3),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/mmfwi_2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.87, 0.3),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/fqvhn_1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
