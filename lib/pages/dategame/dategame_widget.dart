import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/components/shimmer_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_date_game/block_date_game_widget.dart';
import '/game_component/block_date_game_copy/block_date_game_copy_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dategame_model.dart';
export 'dategame_model.dart';

class DategameWidget extends StatefulWidget {
  const DategameWidget({super.key});

  @override
  State<DategameWidget> createState() => _DategameWidgetState();
}

class _DategameWidgetState extends State<DategameWidget> {
  late DategameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DategameModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Расписание игр',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.menubarModel,
                        updateCallback: () => setState(() {}),
                        child: MenubarWidget(
                          email: currentUserEmail,
                          pageName: 'dateGame',
                        ),
                      ),
                    ),
                  ],
                ),
              Flexible(
                child: Builder(
                  builder: (context) {
                    if ((MediaQuery.sizeOf(context).width < kBreakpointSmall) ||
                            (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium)
                        ? false
                        : true) {
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FutureBuilder<List<GameFieldRow>>(
                          future: FFAppState().dateGame(
                            requestFn: () => GameFieldTable().queryRows(
                              queryFn: (q) => q,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const ShimmerPageWidget();
                            }
                            List<GameFieldRow> gridViewGameFieldRowList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: valueOrDefault<int>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 1;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 2;
                                    } else {
                                      return 2;
                                    }
                                  }(),
                                  2,
                                ),
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 3.0,
                              ),
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewGameFieldRowList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewGameFieldRow =
                                    gridViewGameFieldRowList[gridViewIndex];
                                return BlockDateGameWidget(
                                  key: Key(
                                      'Key1ek_${gridViewIndex}_of_${gridViewGameFieldRowList.length}'),
                                  name: gridViewGameFieldRow.nameGame!,
                                  description:
                                      gridViewGameFieldRow.discription!,
                                  author: gridViewGameFieldRow.author!,
                                  img: gridViewGameFieldRow.img!,
                                  buttonname: 'Зарегистрироваться',
                                  gameid: gridViewGameFieldRow.gameId!,
                                  date:
                                      gridViewGameFieldRow.dateGame!.toString(),
                                  gamefieldid: gridViewGameFieldRow.id,
                                  idmembergame:
                                      gridViewGameFieldRow.idMemberGame,
                                  dateTime:
                                      '${functions.datecut(gridViewGameFieldRow.dateGame?.toString())}${gridViewGameFieldRow.hhTime}:${gridViewGameFieldRow.mmTime}',
                                );
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<List<GameFieldRow>>(
                                  future: FFAppState().dateGame(
                                    requestFn: () => GameFieldTable().queryRows(
                                      queryFn: (q) => q,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 10.0,
                                          height: 10.0,
                                          child: SpinKitDoubleBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 10.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<GameFieldRow>
                                        listViewGameFieldRowList =
                                        snapshot.data!;
                                    return ListView.separated(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        8.0,
                                        0,
                                        0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGameFieldRowList.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 8.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGameFieldRow =
                                            listViewGameFieldRowList[
                                                listViewIndex];
                                        return BlockDateGameCopyWidget(
                                          key: Key(
                                              'Keyapg_${listViewIndex}_of_${listViewGameFieldRowList.length}'),
                                          name: listViewGameFieldRow.nameGame!,
                                          description:
                                              listViewGameFieldRow.discription!,
                                          author: listViewGameFieldRow.author!,
                                          img: listViewGameFieldRow.img!,
                                          buttonname: 'Зарегистрироваться',
                                          gameid: listViewGameFieldRow.gameId!,
                                          date: listViewGameFieldRow.dateGame!
                                              .toString(),
                                          gamefieldid: listViewGameFieldRow.id,
                                          dateTime:
                                              '${listViewGameFieldRow.hhTime}${listViewGameFieldRow.mmTime}',
                                          idmembergame:
                                              listViewGameFieldRow.idMemberGame,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ].addToStart(const SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
