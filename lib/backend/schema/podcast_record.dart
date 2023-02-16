import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'podcast_record.g.dart';

abstract class PodcastRecord
    implements Built<PodcastRecord, PodcastRecordBuilder> {
  static Serializer<PodcastRecord> get serializer => _$podcastRecordSerializer;

  @BuiltValueField(wireName: 'p_title')
  String? get pTitle;

  @BuiltValueField(wireName: 'p_category')
  String? get pCategory;

  @BuiltValueField(wireName: 'p_audio')
  String? get pAudio;

  @BuiltValueField(wireName: 'p_img')
  String? get pImg;

  @BuiltValueField(wireName: 'p_createdAt')
  DateTime? get pCreatedAt;

  @BuiltValueField(wireName: 'p_createdBy')
  DocumentReference? get pCreatedBy;

  @BuiltValueField(wireName: 'p_description')
  String? get pDescription;

  @BuiltValueField(wireName: 'p_duration')
  String? get pDuration;

  @BuiltValueField(wireName: 'p_liked_by')
  BuiltList<DocumentReference>? get pLikedBy;

  @BuiltValueField(wireName: 'p_listened_at')
  DateTime? get pListenedAt;

  @BuiltValueField(wireName: 'p_listened_by')
  BuiltList<DocumentReference>? get pListenedBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PodcastRecordBuilder builder) => builder
    ..pTitle = ''
    ..pCategory = ''
    ..pAudio = ''
    ..pImg = ''
    ..pDescription = ''
    ..pDuration = ''
    ..pLikedBy = ListBuilder()
    ..pListenedBy = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('podcast');

  static Stream<PodcastRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PodcastRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PodcastRecord._();
  factory PodcastRecord([void Function(PodcastRecordBuilder) updates]) =
      _$PodcastRecord;

  static PodcastRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPodcastRecordData({
  String? pTitle,
  String? pCategory,
  String? pAudio,
  String? pImg,
  DateTime? pCreatedAt,
  DocumentReference? pCreatedBy,
  String? pDescription,
  String? pDuration,
  DateTime? pListenedAt,
}) {
  final firestoreData = serializers.toFirestore(
    PodcastRecord.serializer,
    PodcastRecord(
      (p) => p
        ..pTitle = pTitle
        ..pCategory = pCategory
        ..pAudio = pAudio
        ..pImg = pImg
        ..pCreatedAt = pCreatedAt
        ..pCreatedBy = pCreatedBy
        ..pDescription = pDescription
        ..pDuration = pDuration
        ..pLikedBy = null
        ..pListenedAt = pListenedAt
        ..pListenedBy = null,
    ),
  );

  return firestoreData;
}
