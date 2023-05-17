// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecommendationRecord> _$recommendationRecordSerializer =
    new _$RecommendationRecordSerializer();

class _$RecommendationRecordSerializer
    implements StructuredSerializer<RecommendationRecord> {
  @override
  final Iterable<Type> types = const [
    RecommendationRecord,
    _$RecommendationRecord
  ];
  @override
  final String wireName = 'RecommendationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RecommendationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.positive;
    if (value != null) {
      result
        ..add('positive')
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
  RecommendationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecommendationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'positive':
          result.positive = serializers.deserialize(value,
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

class _$RecommendationRecord extends RecommendationRecord {
  @override
  final String? positive;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecommendationRecord(
          [void Function(RecommendationRecordBuilder)? updates]) =>
      (new RecommendationRecordBuilder()..update(updates))._build();

  _$RecommendationRecord._({this.positive, this.ffRef}) : super._();

  @override
  RecommendationRecord rebuild(
          void Function(RecommendationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecommendationRecordBuilder toBuilder() =>
      new RecommendationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecommendationRecord &&
        positive == other.positive &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positive.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecommendationRecord')
          ..add('positive', positive)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecommendationRecordBuilder
    implements Builder<RecommendationRecord, RecommendationRecordBuilder> {
  _$RecommendationRecord? _$v;

  String? _positive;
  String? get positive => _$this._positive;
  set positive(String? positive) => _$this._positive = positive;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecommendationRecordBuilder() {
    RecommendationRecord._initializeBuilder(this);
  }

  RecommendationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _positive = $v.positive;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecommendationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecommendationRecord;
  }

  @override
  void update(void Function(RecommendationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecommendationRecord build() => _build();

  _$RecommendationRecord _build() {
    final _$result =
        _$v ?? new _$RecommendationRecord._(positive: positive, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
