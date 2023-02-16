import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('addPodcast');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryBtnText,
          size: 24,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 44, 16, 12),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(currentUserReference!),
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
                    final rowUsersRecord = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                  ),
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  currentUserEmail,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Great to see you ',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('profile');
                          },
                          child: Icon(
                            Icons.settings,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'Categories',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: FutureBuilder<int>(
                  future: queryPodcastRecordCount(),
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
                    int listViewCount = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 12, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) => podcastRecord
                                  .where('p_category', isEqualTo: 'Education'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Education'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'mp3Podcast': serializeParam(
                                              containerPodcastRecord!.pAudio,
                                              ParamType.String,
                                            ),
                                            'publishedAt': serializeParam(
                                              containerPodcastRecord!
                                                  .pCreatedAt,
                                              ParamType.DateTime,
                                            ),
                                            'publishedBy': serializeParam(
                                              containerPodcastRecord!
                                                  .pCreatedBy,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://media.istockphoto.com/id/1282713996/photo/statue-of-the-ancient-greek-philosopher-socrates-in-athens-greece.jpg?s=170667a&w=0&k=20&c=RJpAgNazRwwOkJ0X5xmZjRlWdGlvlghuLn7AVA_W7M0=',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.book,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Education',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 160,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Education'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo:
                                                                'Education'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 16, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) => podcastRecord
                                  .where('p_category', isEqualTo: 'Psychology'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Psychology'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                            'mp3Podcast': serializeParam(
                                              containerPodcastRecord!.pAudio,
                                              ParamType.String,
                                            ),
                                            'publishedAt': serializeParam(
                                              containerPodcastRecord!
                                                  .pCreatedAt,
                                              ParamType.DateTime,
                                            ),
                                            'publishedBy': serializeParam(
                                              containerPodcastRecord!
                                                  .pCreatedBy,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://www.wwu.edu/files/styles/header_medium_large_screens/public/2022-04/psychology.jpg.webp?itok=Mydu3UIS',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons.psychology,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Psychology',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Psychology'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 4, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo:
                                                                'Psychology'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) =>
                                  podcastRecord.where('p_category',
                                      isEqualTo: 'Fitness & Sport'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Fitness & Sport'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://www.vmcdn.ca/f/files/halifaxtoday/images/sports/060820-sports-adobestock_4437963.jpeg',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons.desktop_windows,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Fitness & Sport',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Fitness & Sport'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 4, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo:
                                                                'Fitness & Sport'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 16, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) =>
                                  podcastRecord.where('p_category',
                                      isEqualTo: 'Self Improvement'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Self improvement'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://trailsmomentum.com/wp-content/uploads/2019/04/benjamin-davies-301161-unsplash.jpg',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons
                                                          .design_services_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Self Improvement',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Self Improvement'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 4, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo:
                                                                'Self Improvement'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) => podcastRecord
                                  .where('p_category', isEqualTo: 'Success'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Success'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://www.theladders.com/wp-content/uploads/ambition-success-190801.jpg',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons.desktop_windows,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Success',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Success'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 4, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo:
                                                                'Success'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 16, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) =>
                                  podcastRecord.where('p_category',
                                      isEqualTo: 'Entertainment'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Entertainment'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://ruahtech.com.au/wp-content/uploads/2022/06/arrangement-cinema-elements-bicolor-background-with-copy-space_23-2148457840.webp',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons
                                                          .design_services_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Entertainment',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Entertainment'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 4, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo:
                                                                'Entertainment'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
                          child: StreamBuilder<List<PodcastRecord>>(
                            stream: queryPodcastRecord(
                              queryBuilder: (podcastRecord) => podcastRecord
                                  .where('p_category', isEqualTo: 'Other'),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PodcastRecord> containerPodcastRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerPodcastRecord =
                                  containerPodcastRecordList.isNotEmpty
                                      ? containerPodcastRecordList.first
                                      : null;
                              return Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryPodcastRecordCount(
                                    queryBuilder: (podcastRecord) =>
                                        podcastRecord.where('p_category',
                                            isEqualTo: 'Other'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'audioList',
                                          queryParams: {
                                            'category': serializeParam(
                                              containerPodcastRecord!.pCategory,
                                              ParamType.String,
                                            ),
                                            'numPodcast': serializeParam(
                                              columnCount,
                                              ParamType.int,
                                            ),
                                            'namePodcast': serializeParam(
                                              containerPodcastRecord!.pTitle,
                                              ParamType.String,
                                            ),
                                            'descPodcast': serializeParam(
                                              containerPodcastRecord!
                                                  .pDescription,
                                              ParamType.String,
                                            ),
                                            'imgPodcast': serializeParam(
                                              containerPodcastRecord!.pImg,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://imageio.forbes.com/specials-images/imageserve/5ef0a47ee782210007a90afa/Radio-microphone/960x0.jpg?format=jpg&width=960',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x98FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons.desktop_windows,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Other',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      columnCount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord.where('uid',
                                                            isEqualTo:
                                                                containerPodcastRecord!
                                                                    .pCreatedBy
                                                                    ?.id),
                                                    limit: 8,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        stackUsersRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            stackUsersRecordList
                                                                .length,
                                                            (stackIndex) {
                                                          final stackUsersRecord =
                                                              stackUsersRecordList[
                                                                  stackIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.91, 0),
                                                            child: Container(
                                                              width: 28,
                                                              height: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                stackUsersRecord
                                                                    .photoUrl!,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryPodcastRecordCount(
                                                    queryBuilder: (podcastRecord) =>
                                                        podcastRecord
                                                            .where(
                                                                'p_listened_by',
                                                                arrayContains:
                                                                    currentUserReference)
                                                            .where('p_category',
                                                                isEqualTo:
                                                                    'Other'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: (richTextCount
                                                                        .toDouble() /
                                                                    columnCount
                                                                        .toDouble() *
                                                                    100)
                                                                .toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 4, 0, 0),
                                            child: FutureBuilder<int>(
                                              future: queryPodcastRecordCount(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord
                                                        .where('p_listened_by',
                                                            arrayContains:
                                                                currentUserReference)
                                                        .where('p_category',
                                                            isEqualTo: 'Other'),
                                              ),
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
                                                int progressBarCount =
                                                    snapshot.data!;
                                                return LinearPercentIndicator(
                                                  percent: progressBarCount
                                                          .toDouble() /
                                                      columnCount.toDouble(),
                                                  width: 200,
                                                  lineHeight: 16,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  barRadius:
                                                      Radius.circular(12),
                                                  padding: EdgeInsets.zero,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'My Activity',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Color(0x1B090F13),
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            indicatorColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            indicatorWeight: 2,
                            tabs: [
                              Tab(
                                text: 'My Podcasts',
                              ),
                              Tab(
                                text: 'Favourite',
                              ),
                              Tab(
                                text: 'History',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: StreamBuilder<List<PodcastRecord>>(
                                    stream: queryPodcastRecord(
                                      queryBuilder: (podcastRecord) =>
                                          podcastRecord
                                              .where('p_createdBy',
                                                  isEqualTo:
                                                      currentUserReference)
                                              .orderBy('p_createdAt',
                                                  descending: true),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<PodcastRecord>
                                          listViewPodcastRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPodcastRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPodcastRecord =
                                              listViewPodcastRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: StreamBuilder<
                                                List<PodcastRecord>>(
                                              stream: queryPodcastRecord(
                                                singleRecord: true,
                                              ),
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
                                                List<PodcastRecord>
                                                    containerPodcastRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerPodcastRecord =
                                                    containerPodcastRecordList
                                                            .isNotEmpty
                                                        ? containerPodcastRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 12, 12),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewPodcastRecord
                                                              .pTitle!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            listViewPodcastRecord
                                                                .pDescription!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 24,
                                                          thickness: 1,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                listViewPodcastRecord
                                                                    .pCategory!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                      'relative',
                                                                      listViewPodcastRecord
                                                                          .pCreatedAt!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'player',
                                                                  queryParams: {
                                                                    'podcastTitle':
                                                                        serializeParam(
                                                                      listViewPodcastRecord
                                                                          .pTitle,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'podcastImg':
                                                                        serializeParam(
                                                                      containerPodcastRecord!
                                                                          .pImg,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'podcastMp3':
                                                                        serializeParam(
                                                                      containerPodcastRecord!
                                                                          .pAudio,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 32,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              32),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Text(
                                                                  'Listen',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: StreamBuilder<List<PodcastRecord>>(
                                    stream: queryPodcastRecord(
                                      queryBuilder: (podcastRecord) =>
                                          podcastRecord.where('p_liked_by',
                                              arrayContains:
                                                  currentUserReference),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<PodcastRecord>
                                          listViewPodcastRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPodcastRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPodcastRecord =
                                              listViewPodcastRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 12, 12, 12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewPodcastRecord
                                                          .pTitle!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        listViewPodcastRecord
                                                            .pDescription!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 24,
                                                      thickness: 1,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            listViewPodcastRecord
                                                                .pCategory!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  listViewPodcastRecord
                                                                      .pCreatedAt!),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'player',
                                                              queryParams: {
                                                                'podcastTitle':
                                                                    serializeParam(
                                                                  listViewPodcastRecord
                                                                      .pTitle,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'podcastImg':
                                                                    serializeParam(
                                                                  listViewPodcastRecord
                                                                      .pImg,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'podcastMp3':
                                                                    serializeParam(
                                                                  listViewPodcastRecord
                                                                      .pAudio,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 32,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Text(
                                                              'Continue',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                  ),
                                                            ),
                                                          ),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: StreamBuilder<List<PodcastRecord>>(
                                    stream: queryPodcastRecord(
                                      queryBuilder: (podcastRecord) =>
                                          podcastRecord
                                              .where(
                                                  'p_listened_by',
                                                  arrayContains:
                                                      currentUserReference)
                                              .orderBy('p_listened_at',
                                                  descending: true),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<PodcastRecord>
                                          listViewPodcastRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPodcastRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPodcastRecord =
                                              listViewPodcastRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: StreamBuilder<
                                                List<PodcastRecord>>(
                                              stream: queryPodcastRecord(
                                                queryBuilder: (podcastRecord) =>
                                                    podcastRecord.where(
                                                        'p_listened_by',
                                                        arrayContains:
                                                            currentUserReference),
                                                singleRecord: true,
                                              ),
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
                                                List<PodcastRecord>
                                                    containerPodcastRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerPodcastRecord =
                                                    containerPodcastRecordList
                                                            .isNotEmpty
                                                        ? containerPodcastRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 12, 12),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewPodcastRecord
                                                              .pTitle!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            listViewPodcastRecord
                                                                .pDescription!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 24,
                                                          thickness: 1,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                listViewPodcastRecord
                                                                    .pCategory!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                      'relative',
                                                                      listViewPodcastRecord
                                                                          .pListenedAt!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 100,
                                                              height: 32,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                'Complete',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
