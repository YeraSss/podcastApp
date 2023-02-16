import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_model.dart';
export 'history_model.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({
    Key? key,
    String? category,
    int? numPodcast,
    String? namePodcast,
    this.descPodcast,
    this.imgPodcast,
    this.mp3Podcast,
    this.publishedAt,
    this.publishedBy,
  })  : this.category = category ?? 'Podcast Category',
        this.numPodcast = numPodcast ?? 0,
        this.namePodcast = namePodcast ?? 'Podcast name',
        super(key: key);

  final String category;
  final int numPodcast;
  final String namePodcast;
  final String? descPodcast;
  final String? imgPodcast;
  final String? mp3Podcast;
  final DateTime? publishedAt;
  final DocumentReference? publishedBy;

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 210,
                      child: Stack(
                        children: [
                          Image.network(
                            'https://picsum.photos/seed/213/600',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 7,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 230,
                                  decoration: BoxDecoration(
                                    color: Color(0x48000000),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 44, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 44,
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                                onPressed: () async {
                                                  context.pop();
                                                },
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Details',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 30, 0, 0),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: currentUserDisplayName,
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: '\'s history',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                      child: Text(
                        'Pick one and enjoy',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: StreamBuilder<List<PodcastRecord>>(
                        stream: queryPodcastRecord(
                          queryBuilder: (podcastRecord) => podcastRecord
                              .where('p_listened_by',
                                  arrayContains: currentUserReference)
                              .orderBy('p_listened_at', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PodcastRecord> listViewPodcastRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPodcastRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPodcastRecord =
                                  listViewPodcastRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 8),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            listViewPodcastRecord.pImg!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewPodcastRecord
                                                        .pTitle,
                                                    'Podcast without title',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    listViewPodcastRecord
                                                        .pDescription!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ToggleIcon(
                                              onPressed: () async {
                                                final pLikedByElement =
                                                    currentUserReference;
                                                final pLikedByUpdate =
                                                    listViewPodcastRecord
                                                            .pLikedBy!
                                                            .toList()
                                                            .contains(
                                                                pLikedByElement)
                                                        ? FieldValue
                                                            .arrayRemove([
                                                            pLikedByElement
                                                          ])
                                                        : FieldValue.arrayUnion(
                                                            [pLikedByElement]);
                                                final podcastUpdateData = {
                                                  'p_liked_by': pLikedByUpdate,
                                                };
                                                await listViewPodcastRecord
                                                    .reference
                                                    .update(podcastUpdateData);
                                              },
                                              value: listViewPodcastRecord
                                                  .pLikedBy!
                                                  .toList()
                                                  .contains(
                                                      currentUserReference),
                                              onIcon: Icon(
                                                Icons.favorite,
                                                color: Color(0xFFFF0000),
                                                size: 25,
                                              ),
                                              offIcon: Icon(
                                                Icons.favorite_border,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<PodcastRecord>(
                                              stream: PodcastRecord.getDocument(
                                                  listViewPodcastRecord
                                                      .reference),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final iconButtonPodcastRecord =
                                                    snapshot.data!;
                                                return FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.play_circle_fill,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    final podcastUpdateData = {
                                                      ...createPodcastRecordData(
                                                        pListenedAt:
                                                            getCurrentTimestamp,
                                                      ),
                                                      'p_listened_by':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await iconButtonPodcastRecord
                                                        .reference
                                                        .update(
                                                            podcastUpdateData);
                                                    FFAppState().update(() {
                                                      FFAppState().podcastMp3 =
                                                          iconButtonPodcastRecord
                                                              .pAudio!;
                                                      FFAppState().podcastName =
                                                          iconButtonPodcastRecord
                                                              .pTitle!;
                                                      FFAppState().musicOnOff =
                                                          true;
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
            StreamBuilder<List<PodcastRecord>>(
              stream: queryPodcastRecord(
                queryBuilder: (podcastRecord) => podcastRecord.where('p_title',
                    isEqualTo: FFAppState().podcastName),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                List<PodcastRecord> buttonFullWidthPodcastRecordList =
                    snapshot.data!;
                final buttonFullWidthPodcastRecord =
                    buttonFullWidthPodcastRecordList.isNotEmpty
                        ? buttonFullWidthPodcastRecordList.first
                        : null;
                return InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'player',
                      queryParams: {
                        'podcastTitle': serializeParam(
                          buttonFullWidthPodcastRecord!.pTitle,
                          ParamType.String,
                        ),
                        'podcastImg': serializeParam(
                          buttonFullWidthPodcastRecord!.pImg,
                          ParamType.String,
                        ),
                        'podcastMp3': serializeParam(
                          buttonFullWidthPodcastRecord!.pAudio,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                        ),
                      },
                    );

                    FFAppState().update(() {
                      FFAppState().musicOnOff = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x411D2429),
                          offset: Offset(0, -2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: FlutterFlowAudioPlayer(
                      audio: Audio.network(
                        FFAppState().podcastMp3,
                        metas: Metas(
                          id: 'sample3.mp3-n7kiw4n4',
                          title: FFAppState().podcastName,
                        ),
                      ),
                      titleTextStyle: FlutterFlowTheme.of(context).title3,
                      playbackDurationTextStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            fontSize: 12,
                          ),
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      playbackButtonColor:
                          FlutterFlowTheme.of(context).primaryText,
                      activeTrackColor:
                          FlutterFlowTheme.of(context).primaryText,
                      elevation: 4,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
