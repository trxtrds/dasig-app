import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_journal_model.dart';
export 'mood_journal_model.dart';

class MoodJournalWidget extends StatefulWidget {
  const MoodJournalWidget({
    Key? key,
    this.displayJournalEntriesDaily,
  }) : super(key: key);

  final DocumentReference? displayJournalEntriesDaily;

  @override
  _MoodJournalWidgetState createState() => _MoodJournalWidgetState();
}

class _MoodJournalWidgetState extends State<MoodJournalWidget> {
  late MoodJournalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodJournalModel());
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
                width: 447.7,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.82, 0.03),
                      child: Text(
                        'Mood Journal',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 34.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.88, -0.02),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('dashboardPage');
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.black,
                          size: 34.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<MoodTrackerRecord>>(
                stream: queryMoodTrackerRecord(),
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
                  List<MoodTrackerRecord> journalListViewMoodTrackerRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: journalListViewMoodTrackerRecordList.length,
                    itemBuilder: (context, journalListViewIndex) {
                      final journalListViewMoodTrackerRecord =
                          journalListViewMoodTrackerRecordList[
                              journalListViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'displayJournalDetails',
                            queryParams: {
                              'displayDate': serializeParam(
                                journalListViewMoodTrackerRecord,
                                ParamType.Document,
                              ),
                              'displayTitle': serializeParam(
                                journalListViewMoodTrackerRecord,
                                ParamType.Document,
                              ),
                              'displayDescription': serializeParam(
                                journalListViewMoodTrackerRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'displayDate': journalListViewMoodTrackerRecord,
                              'displayTitle': journalListViewMoodTrackerRecord,
                              'displayDescription':
                                  journalListViewMoodTrackerRecord,
                            },
                          );
                        },
                        child: ListTile(
                          title: Text(
                            dateTimeFormat('MMMEd',
                                journalListViewMoodTrackerRecord.createdAt!),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          subtitle: Text(
                            journalListViewMoodTrackerRecord.journalTitle!,
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
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                          dense: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
