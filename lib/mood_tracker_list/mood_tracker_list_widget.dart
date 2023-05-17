import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_tracker_list_model.dart';
export 'mood_tracker_list_model.dart';

class MoodTrackerListWidget extends StatefulWidget {
  const MoodTrackerListWidget({Key? key}) : super(key: key);

  @override
  _MoodTrackerListWidgetState createState() => _MoodTrackerListWidgetState();
}

class _MoodTrackerListWidgetState extends State<MoodTrackerListWidget> {
  late MoodTrackerListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodTrackerListModel());
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 427.2,
                height: 102.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Your list',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Container(
                width: 403.0,
                height: 319.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: StreamBuilder<List<MoodTrackerRecord>>(
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
                    List<MoodTrackerRecord> listViewMoodTrackerRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMoodTrackerRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewMoodTrackerRecord =
                            listViewMoodTrackerRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'displayMoodTracker',
                              queryParams: {
                                'q1': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                                'q2': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                                'q3': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                                'q4': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                                'q5': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                                'totalScore': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                                'date': serializeParam(
                                  listViewMoodTrackerRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'q1': listViewMoodTrackerRecord,
                                'q2': listViewMoodTrackerRecord,
                                'q3': listViewMoodTrackerRecord,
                                'q4': listViewMoodTrackerRecord,
                                'q5': listViewMoodTrackerRecord,
                                'totalScore': listViewMoodTrackerRecord,
                                'date': listViewMoodTrackerRecord,
                              },
                            );
                          },
                          child: ListTile(
                            title: Text(
                              dateTimeFormat('MMMEd',
                                  listViewMoodTrackerRecord.createdTime!),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            subtitle: Text(
                              listViewMoodTrackerRecord.totalScore!.toString(),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
