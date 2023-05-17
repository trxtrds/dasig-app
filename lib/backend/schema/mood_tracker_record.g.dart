// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_tracker_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoodTrackerRecord> _$moodTrackerRecordSerializer =
    new _$MoodTrackerRecordSerializer();

class _$MoodTrackerRecordSerializer
    implements StructuredSerializer<MoodTrackerRecord> {
  @override
  final Iterable<Type> types = const [MoodTrackerRecord, _$MoodTrackerRecord];
  @override
  final String wireName = 'MoodTrackerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoodTrackerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.questionOne;
    if (value != null) {
      result
        ..add('questionOne')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.questionTwo;
    if (value != null) {
      result
        ..add('questionTwo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.questionThree;
    if (value != null) {
      result
        ..add('questionThree')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.questionFour;
    if (value != null) {
      result
        ..add('questionFour')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.questionFive;
    if (value != null) {
      result
        ..add('questionFive')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalScore;
    if (value != null) {
      result
        ..add('totalScore')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.actionNumber;
    if (value != null) {
      result
        ..add('action_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.journalEntry;
    if (value != null) {
      result
        ..add('journalEntry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.journalTitle;
    if (value != null) {
      result
        ..add('journalTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MoodTrackerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoodTrackerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'questionOne':
          result.questionOne = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'questionTwo':
          result.questionTwo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'questionThree':
          result.questionThree = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'questionFour':
          result.questionFour = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'questionFive':
          result.questionFive = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'totalScore':
          result.totalScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'action_number':
          result.actionNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'journalEntry':
          result.journalEntry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'journalTitle':
          result.journalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MoodTrackerRecord extends MoodTrackerRecord {
  @override
  final DateTime? createdAt;
  @override
  final int? questionOne;
  @override
  final int? questionTwo;
  @override
  final int? questionThree;
  @override
  final int? questionFour;
  @override
  final int? questionFive;
  @override
  final int? totalScore;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final int? actionNumber;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? journalEntry;
  @override
  final String? journalTitle;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MoodTrackerRecord(
          [void Function(MoodTrackerRecordBuilder)? updates]) =>
      (new MoodTrackerRecordBuilder()..update(updates))._build();

  _$MoodTrackerRecord._(
      {this.createdAt,
      this.questionOne,
      this.questionTwo,
      this.questionThree,
      this.questionFour,
      this.questionFive,
      this.totalScore,
      this.createdBy,
      this.actionNumber,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.journalEntry,
      this.journalTitle,
      this.ffRef})
      : super._();

  @override
  MoodTrackerRecord rebuild(void Function(MoodTrackerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoodTrackerRecordBuilder toBuilder() =>
      new MoodTrackerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoodTrackerRecord &&
        createdAt == other.createdAt &&
        questionOne == other.questionOne &&
        questionTwo == other.questionTwo &&
        questionThree == other.questionThree &&
        questionFour == other.questionFour &&
        questionFive == other.questionFive &&
        totalScore == other.totalScore &&
        createdBy == other.createdBy &&
        actionNumber == other.actionNumber &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        journalEntry == other.journalEntry &&
        journalTitle == other.journalTitle &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, questionOne.hashCode);
    _$hash = $jc(_$hash, questionTwo.hashCode);
    _$hash = $jc(_$hash, questionThree.hashCode);
    _$hash = $jc(_$hash, questionFour.hashCode);
    _$hash = $jc(_$hash, questionFive.hashCode);
    _$hash = $jc(_$hash, totalScore.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, actionNumber.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, journalEntry.hashCode);
    _$hash = $jc(_$hash, journalTitle.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoodTrackerRecord')
          ..add('createdAt', createdAt)
          ..add('questionOne', questionOne)
          ..add('questionTwo', questionTwo)
          ..add('questionThree', questionThree)
          ..add('questionFour', questionFour)
          ..add('questionFive', questionFive)
          ..add('totalScore', totalScore)
          ..add('createdBy', createdBy)
          ..add('actionNumber', actionNumber)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('journalEntry', journalEntry)
          ..add('journalTitle', journalTitle)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MoodTrackerRecordBuilder
    implements Builder<MoodTrackerRecord, MoodTrackerRecordBuilder> {
  _$MoodTrackerRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _questionOne;
  int? get questionOne => _$this._questionOne;
  set questionOne(int? questionOne) => _$this._questionOne = questionOne;

  int? _questionTwo;
  int? get questionTwo => _$this._questionTwo;
  set questionTwo(int? questionTwo) => _$this._questionTwo = questionTwo;

  int? _questionThree;
  int? get questionThree => _$this._questionThree;
  set questionThree(int? questionThree) =>
      _$this._questionThree = questionThree;

  int? _questionFour;
  int? get questionFour => _$this._questionFour;
  set questionFour(int? questionFour) => _$this._questionFour = questionFour;

  int? _questionFive;
  int? get questionFive => _$this._questionFive;
  set questionFive(int? questionFive) => _$this._questionFive = questionFive;

  int? _totalScore;
  int? get totalScore => _$this._totalScore;
  set totalScore(int? totalScore) => _$this._totalScore = totalScore;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  int? _actionNumber;
  int? get actionNumber => _$this._actionNumber;
  set actionNumber(int? actionNumber) => _$this._actionNumber = actionNumber;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _journalEntry;
  String? get journalEntry => _$this._journalEntry;
  set journalEntry(String? journalEntry) => _$this._journalEntry = journalEntry;

  String? _journalTitle;
  String? get journalTitle => _$this._journalTitle;
  set journalTitle(String? journalTitle) => _$this._journalTitle = journalTitle;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MoodTrackerRecordBuilder() {
    MoodTrackerRecord._initializeBuilder(this);
  }

  MoodTrackerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _questionOne = $v.questionOne;
      _questionTwo = $v.questionTwo;
      _questionThree = $v.questionThree;
      _questionFour = $v.questionFour;
      _questionFive = $v.questionFive;
      _totalScore = $v.totalScore;
      _createdBy = $v.createdBy;
      _actionNumber = $v.actionNumber;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _journalEntry = $v.journalEntry;
      _journalTitle = $v.journalTitle;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoodTrackerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoodTrackerRecord;
  }

  @override
  void update(void Function(MoodTrackerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoodTrackerRecord build() => _build();

  _$MoodTrackerRecord _build() {
    final _$result = _$v ??
        new _$MoodTrackerRecord._(
            createdAt: createdAt,
            questionOne: questionOne,
            questionTwo: questionTwo,
            questionThree: questionThree,
            questionFour: questionFour,
            questionFive: questionFive,
            totalScore: totalScore,
            createdBy: createdBy,
            actionNumber: actionNumber,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            journalEntry: journalEntry,
            journalTitle: journalTitle,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
