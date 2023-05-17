import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'users_mood_scores_model.dart';
export 'users_mood_scores_model.dart';

class UsersMoodScoresWidget extends StatefulWidget {
  const UsersMoodScoresWidget({Key? key}) : super(key: key);

  @override
  _UsersMoodScoresWidgetState createState() => _UsersMoodScoresWidgetState();
}

class _UsersMoodScoresWidgetState extends State<UsersMoodScoresWidget> {
  late UsersMoodScoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersMoodScoresModel());
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
                        alignment: AlignmentDirectional(-0.01, 0.0),
                        child: Text(
                          'This week entries',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
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
                height: 779.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FutureBuilder<List<MoodTrackerRecord>>(
                        future: (_model.firestoreRequestCompleter ??=
                                Completer<List<MoodTrackerRecord>>()
                                  ..complete(queryMoodTrackerRecordOnce()))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<MoodTrackerRecord>
                              journalListViewMoodTrackerRecordList =
                              snapshot.data!;
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() =>
                                  _model.firestoreRequestCompleter = null);
                              await _model.waitForFirestoreRequestCompleted();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  journalListViewMoodTrackerRecordList.length,
                              itemBuilder: (context, journalListViewIndex) {
                                final journalListViewMoodTrackerRecord =
                                    journalListViewMoodTrackerRecordList[
                                        journalListViewIndex];
                                return ListTile(
                                  title: Text(
                                    dateTimeFormat(
                                        'MMMEd',
                                        journalListViewMoodTrackerRecord
                                            .createdAt!),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  subtitle: Text(
                                    journalListViewMoodTrackerRecord.email!,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFA5B7B3),
                                        ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20.0,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  dense: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
