import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mood_tracker_record.g.dart';

abstract class MoodTrackerRecord
    implements Built<MoodTrackerRecord, MoodTrackerRecordBuilder> {
  static Serializer<MoodTrackerRecord> get serializer =>
      _$moodTrackerRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  int? get questionOne;

  int? get questionTwo;

  int? get questionThree;

  int? get questionFour;

  int? get questionFive;

  int? get totalScore;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'action_number')
  int? get actionNumber;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get journalEntry;

  String? get journalTitle;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MoodTrackerRecordBuilder builder) => builder
    ..questionOne = 0
    ..questionTwo = 0
    ..questionThree = 0
    ..questionFour = 0
    ..questionFive = 0
    ..totalScore = 0
    ..actionNumber = 0
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..journalEntry = ''
    ..journalTitle = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moodTracker');

  static Stream<MoodTrackerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MoodTrackerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MoodTrackerRecord._();
  factory MoodTrackerRecord([void Function(MoodTrackerRecordBuilder) updates]) =
      _$MoodTrackerRecord;

  static MoodTrackerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMoodTrackerRecordData({
  DateTime? createdAt,
  int? questionOne,
  int? questionTwo,
  int? questionThree,
  int? questionFour,
  int? questionFive,
  int? totalScore,
  DocumentReference? createdBy,
  int? actionNumber,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? journalEntry,
  String? journalTitle,
}) {
  final firestoreData = serializers.toFirestore(
    MoodTrackerRecord.serializer,
    MoodTrackerRecord(
      (m) => m
        ..createdAt = createdAt
        ..questionOne = questionOne
        ..questionTwo = questionTwo
        ..questionThree = questionThree
        ..questionFour = questionFour
        ..questionFive = questionFive
        ..totalScore = totalScore
        ..createdBy = createdBy
        ..actionNumber = actionNumber
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..journalEntry = journalEntry
        ..journalTitle = journalTitle,
    ),
  );

  return firestoreData;
}
