import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TherapyAppointmentRecord extends FirestoreRecord {
  TherapyAppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "selectedDate" field.
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  bool hasSelectedDate() => _selectedDate != null;

  // "selectedTime" field.
  String? _selectedTime;
  String get selectedTime => _selectedTime ?? '';
  bool hasSelectedTime() => _selectedTime != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _selectedDate = snapshotData['selectedDate'] as DateTime?;
    _selectedTime = snapshotData['selectedTime'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('therapy_appointment');

  static Stream<TherapyAppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TherapyAppointmentRecord.fromSnapshot(s));

  static Future<TherapyAppointmentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TherapyAppointmentRecord.fromSnapshot(s));

  static TherapyAppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TherapyAppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TherapyAppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TherapyAppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TherapyAppointmentRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTherapyAppointmentRecordData({
  String? email,
  DateTime? selectedDate,
  String? selectedTime,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}
