import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recommendation_record.g.dart';

abstract class RecommendationRecord
    implements Built<RecommendationRecord, RecommendationRecordBuilder> {
  static Serializer<RecommendationRecord> get serializer =>
      _$recommendationRecordSerializer;

  String? get positive;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecommendationRecordBuilder builder) =>
      builder..positive = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommendation');

  static Stream<RecommendationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecommendationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecommendationRecord._();
  factory RecommendationRecord(
          [void Function(RecommendationRecordBuilder) updates]) =
      _$RecommendationRecord;

  static RecommendationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecommendationRecordData({
  String? positive,
}) {
  final firestoreData = serializers.toFirestore(
    RecommendationRecord.serializer,
    RecommendationRecord(
      (r) => r..positive = positive,
    ),
  );

  return firestoreData;
}
