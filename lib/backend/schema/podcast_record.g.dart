// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PodcastRecord> _$podcastRecordSerializer =
    new _$PodcastRecordSerializer();

class _$PodcastRecordSerializer implements StructuredSerializer<PodcastRecord> {
  @override
  final Iterable<Type> types = const [PodcastRecord, _$PodcastRecord];
  @override
  final String wireName = 'PodcastRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PodcastRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pTitle;
    if (value != null) {
      result
        ..add('p_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pCategory;
    if (value != null) {
      result
        ..add('p_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pAudio;
    if (value != null) {
      result
        ..add('p_audio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pImg;
    if (value != null) {
      result
        ..add('p_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pCreatedAt;
    if (value != null) {
      result
        ..add('p_createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.pCreatedBy;
    if (value != null) {
      result
        ..add('p_createdBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.pDescription;
    if (value != null) {
      result
        ..add('p_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pDuration;
    if (value != null) {
      result
        ..add('p_duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pLikedBy;
    if (value != null) {
      result
        ..add('p_liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.pListenedAt;
    if (value != null) {
      result
        ..add('p_listened_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.pListenedBy;
    if (value != null) {
      result
        ..add('p_listened_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  PodcastRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PodcastRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'p_title':
          result.pTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'p_category':
          result.pCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'p_audio':
          result.pAudio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'p_img':
          result.pImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'p_createdAt':
          result.pCreatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'p_createdBy':
          result.pCreatedBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'p_description':
          result.pDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'p_duration':
          result.pDuration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'p_liked_by':
          result.pLikedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'p_listened_at':
          result.pListenedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'p_listened_by':
          result.pListenedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$PodcastRecord extends PodcastRecord {
  @override
  final String? pTitle;
  @override
  final String? pCategory;
  @override
  final String? pAudio;
  @override
  final String? pImg;
  @override
  final DateTime? pCreatedAt;
  @override
  final DocumentReference<Object?>? pCreatedBy;
  @override
  final String? pDescription;
  @override
  final String? pDuration;
  @override
  final BuiltList<DocumentReference<Object?>>? pLikedBy;
  @override
  final DateTime? pListenedAt;
  @override
  final BuiltList<DocumentReference<Object?>>? pListenedBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PodcastRecord([void Function(PodcastRecordBuilder)? updates]) =>
      (new PodcastRecordBuilder()..update(updates))._build();

  _$PodcastRecord._(
      {this.pTitle,
      this.pCategory,
      this.pAudio,
      this.pImg,
      this.pCreatedAt,
      this.pCreatedBy,
      this.pDescription,
      this.pDuration,
      this.pLikedBy,
      this.pListenedAt,
      this.pListenedBy,
      this.ffRef})
      : super._();

  @override
  PodcastRecord rebuild(void Function(PodcastRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PodcastRecordBuilder toBuilder() => new PodcastRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PodcastRecord &&
        pTitle == other.pTitle &&
        pCategory == other.pCategory &&
        pAudio == other.pAudio &&
        pImg == other.pImg &&
        pCreatedAt == other.pCreatedAt &&
        pCreatedBy == other.pCreatedBy &&
        pDescription == other.pDescription &&
        pDuration == other.pDuration &&
        pLikedBy == other.pLikedBy &&
        pListenedAt == other.pListenedAt &&
        pListenedBy == other.pListenedBy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, pTitle.hashCode),
                                                pCategory.hashCode),
                                            pAudio.hashCode),
                                        pImg.hashCode),
                                    pCreatedAt.hashCode),
                                pCreatedBy.hashCode),
                            pDescription.hashCode),
                        pDuration.hashCode),
                    pLikedBy.hashCode),
                pListenedAt.hashCode),
            pListenedBy.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PodcastRecord')
          ..add('pTitle', pTitle)
          ..add('pCategory', pCategory)
          ..add('pAudio', pAudio)
          ..add('pImg', pImg)
          ..add('pCreatedAt', pCreatedAt)
          ..add('pCreatedBy', pCreatedBy)
          ..add('pDescription', pDescription)
          ..add('pDuration', pDuration)
          ..add('pLikedBy', pLikedBy)
          ..add('pListenedAt', pListenedAt)
          ..add('pListenedBy', pListenedBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PodcastRecordBuilder
    implements Builder<PodcastRecord, PodcastRecordBuilder> {
  _$PodcastRecord? _$v;

  String? _pTitle;
  String? get pTitle => _$this._pTitle;
  set pTitle(String? pTitle) => _$this._pTitle = pTitle;

  String? _pCategory;
  String? get pCategory => _$this._pCategory;
  set pCategory(String? pCategory) => _$this._pCategory = pCategory;

  String? _pAudio;
  String? get pAudio => _$this._pAudio;
  set pAudio(String? pAudio) => _$this._pAudio = pAudio;

  String? _pImg;
  String? get pImg => _$this._pImg;
  set pImg(String? pImg) => _$this._pImg = pImg;

  DateTime? _pCreatedAt;
  DateTime? get pCreatedAt => _$this._pCreatedAt;
  set pCreatedAt(DateTime? pCreatedAt) => _$this._pCreatedAt = pCreatedAt;

  DocumentReference<Object?>? _pCreatedBy;
  DocumentReference<Object?>? get pCreatedBy => _$this._pCreatedBy;
  set pCreatedBy(DocumentReference<Object?>? pCreatedBy) =>
      _$this._pCreatedBy = pCreatedBy;

  String? _pDescription;
  String? get pDescription => _$this._pDescription;
  set pDescription(String? pDescription) => _$this._pDescription = pDescription;

  String? _pDuration;
  String? get pDuration => _$this._pDuration;
  set pDuration(String? pDuration) => _$this._pDuration = pDuration;

  ListBuilder<DocumentReference<Object?>>? _pLikedBy;
  ListBuilder<DocumentReference<Object?>> get pLikedBy =>
      _$this._pLikedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set pLikedBy(ListBuilder<DocumentReference<Object?>>? pLikedBy) =>
      _$this._pLikedBy = pLikedBy;

  DateTime? _pListenedAt;
  DateTime? get pListenedAt => _$this._pListenedAt;
  set pListenedAt(DateTime? pListenedAt) => _$this._pListenedAt = pListenedAt;

  ListBuilder<DocumentReference<Object?>>? _pListenedBy;
  ListBuilder<DocumentReference<Object?>> get pListenedBy =>
      _$this._pListenedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set pListenedBy(ListBuilder<DocumentReference<Object?>>? pListenedBy) =>
      _$this._pListenedBy = pListenedBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PodcastRecordBuilder() {
    PodcastRecord._initializeBuilder(this);
  }

  PodcastRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pTitle = $v.pTitle;
      _pCategory = $v.pCategory;
      _pAudio = $v.pAudio;
      _pImg = $v.pImg;
      _pCreatedAt = $v.pCreatedAt;
      _pCreatedBy = $v.pCreatedBy;
      _pDescription = $v.pDescription;
      _pDuration = $v.pDuration;
      _pLikedBy = $v.pLikedBy?.toBuilder();
      _pListenedAt = $v.pListenedAt;
      _pListenedBy = $v.pListenedBy?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PodcastRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PodcastRecord;
  }

  @override
  void update(void Function(PodcastRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PodcastRecord build() => _build();

  _$PodcastRecord _build() {
    _$PodcastRecord _$result;
    try {
      _$result = _$v ??
          new _$PodcastRecord._(
              pTitle: pTitle,
              pCategory: pCategory,
              pAudio: pAudio,
              pImg: pImg,
              pCreatedAt: pCreatedAt,
              pCreatedBy: pCreatedBy,
              pDescription: pDescription,
              pDuration: pDuration,
              pLikedBy: _pLikedBy?.build(),
              pListenedAt: pListenedAt,
              pListenedBy: _pListenedBy?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pLikedBy';
        _pLikedBy?.build();

        _$failedField = 'pListenedBy';
        _pListenedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PodcastRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
