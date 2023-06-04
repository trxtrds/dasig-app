import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodTrackerRecord extends FirestoreRecord {
  MoodTrackerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "questionOne" field.
  int? _questionOne;
  int get questionOne => _questionOne ?? 0;
  bool hasQuestionOne() => _questionOne != null;

  // "questionTwo" field.
  int? _questionTwo;
  int get questionTwo => _questionTwo ?? 0;
  bool hasQuestionTwo() => _questionTwo != null;

  // "questionThree" field.
  int? _questionThree;
  int get questionThree => _questionThree ?? 0;
  bool hasQuestionThree() => _questionThree != null;

  // "questionFour" field.
  int? _questionFour;
  int get questionFour => _questionFour ?? 0;
  bool hasQuestionFour() => _questionFour != null;

  // "questionFive" field.
  int? _questionFive;
  int get questionFive => _questionFive ?? 0;
  bool hasQuestionFive() => _questionFive != null;

  // "totalScore" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "action_number" field.
  int? _actionNumber;
  int get actionNumber => _actionNumber ?? 0;
  bool hasActionNumber() => _actionNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "journalEntry" field.
  String? _journalEntry;
  String get journalEntry => _journalEntry ?? '';
  bool hasJournalEntry() => _journalEntry != null;

  // "journalTitle" field.
  String? _journalTitle;
  String get journalTitle => _journalTitle ?? '';
  bool hasJournalTitle() => _journalTitle != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _questionOne = snapshotData['questionOne'] as int?;
    _questionTwo = snapshotData['questionTwo'] as int?;
    _questionThree = snapshotData['questionThree'] as int?;
    _questionFour = snapshotData['questionFour'] as int?;
    _questionFive = snapshotData['questionFive'] as int?;
    _totalScore = snapshotData['totalScore'] as int?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _actionNumber = snapshotData['action_number'] as int?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _journalEntry = snapshotData['journalEntry'] as String?;
    _journalTitle = snapshotData['journalTitle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moodTracker');

  static Stream<MoodTrackerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodTrackerRecord.fromSnapshot(s));

  static Future<MoodTrackerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodTrackerRecord.fromSnapshot(s));

  static MoodTrackerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodTrackerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodTrackerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodTrackerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodTrackerRecord(reference: ${reference.path}, data: $snapshotData)';
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'questionOne': questionOne,
      'questionTwo': questionTwo,
      'questionThree': questionThree,
      'questionFour': questionFour,
      'questionFive': questionFive,
      'totalScore': totalScore,
      'created_by': createdBy,
      'action_number': actionNumber,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'journalEntry': journalEntry,
      'journalTitle': journalTitle,
    }.withoutNulls,
  );

  return firestoreData;
}
