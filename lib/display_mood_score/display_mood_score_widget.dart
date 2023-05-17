import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'display_mood_score_model.dart';
export 'display_mood_score_model.dart';

class DisplayMoodScoreWidget extends StatefulWidget {
  const DisplayMoodScoreWidget({
    Key? key,
    this.userName,
    this.lastEntryDate,
    this.totalScore,
  }) : super(key: key);

  final MoodTrackerRecord? userName;
  final MoodTrackerRecord? lastEntryDate;
  final MoodTrackerRecord? totalScore;

  @override
  _DisplayMoodScoreWidgetState createState() => _DisplayMoodScoreWidgetState();
}

class _DisplayMoodScoreWidgetState extends State<DisplayMoodScoreWidget> {
  late DisplayMoodScoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayMoodScoreModel());
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
              Align(
                alignment: AlignmentDirectional(-0.9, -0.95),
                child: Container(
                  width: 426.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFC1CAC1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x81101213),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.91, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('admin_dashboardPage');
                          },
                          child: Icon(
                            Icons.chevron_left_outlined,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 34.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 419.5,
                height: 830.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
