import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationRecord extends FirestoreRecord {
  RecommendationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "positive" field.
  String? _positive;
  String get positive => _positive ?? '';
  bool hasPositive() => _positive != null;

  void _initializeFields() {
    _positive = snapshotData['positive'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommendation');

  static Stream<RecommendationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommendationRecord.fromSnapshot(s));

  static Future<RecommendationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecommendationRecord.fromSnapshot(s));

  static RecommendationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecommendationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommendationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommendationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommendationRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createRecommendationRecordData({
  String? positive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'positive': positive,
    }.withoutNulls,
  );

  return firestoreData;
}
