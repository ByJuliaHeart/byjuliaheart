import '/ankets_or_forms/game_add/game_add_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/components/shimmer_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block/block_widget.dart';
import '/game_component/game_newblock/game_newblock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'game_new_block_page_model.dart';
export 'game_new_block_page_model.dart';

class GameNewBlockPageWidget extends StatefulWidget {
  const GameNewBlockPageWidget({super.key});

  @override
  State<GameNewBlockPageWidget> createState() => _GameNewBlockPageWidgetState();
}

class _GameNewBlockPageWidgetState extends State<GameNewBlockPageWidget> {
  late GameNewBlockPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameNewBlockPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.roleUs = await RoleUsersCall.call(
        userId: 'eq.$currentUserUid',
      );
      if ((_model.roleUs?.succeeded ?? true)) {
        setState(() {
          FFAppState().roleUsers = RoleUsersCall.role(
            (_model.roleUs?.jsonBody ?? ''),
          )!
              .map((e) => e.toString())
              .toList()
              .toList()
              .cast<String>();
        });
      }
      _model.users = await UsersCall.call(
        id: 'eq.$currentUserUid',
      );
      if ((_model.users?.succeeded ?? true)) {
        setState(() {
          FFAppState().name = UsersCall.name(
            (_model.users?.jsonBody ?? ''),
          )!
              .first;
          FFAppState().avatar = UsersCall.avatar(
            (_model.users?.jsonBody ?? ''),
          )!
              .first;
          FFAppState().city = UsersCall.city(
            (_model.users?.jsonBody ?? ''),
          )!
              .first;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Visibility(
          visible: FFAppState().roleUsers.contains('Admin'),
          child: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: const GameAddWidget(),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
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
                  'Игры',
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
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.menubarModel,
                          updateCallback: () => setState(() {}),
                          child: MenubarWidget(
                            email: valueOrDefault<String>(
                              currentUserEmail,
                              '@mail',
                            ),
                            pageName: 'Game',
                          ),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FutureBuilder<List<GameRow>>(
                                future: GameTable().queryRows(
                                  queryFn: (q) => q,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const ShimmerPageWidget();
                                  }
                                  List<GameRow> gridViewGameRowList =
                                      snapshot.data!;
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 3.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 3.0,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridViewGameRowList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewGameRow =
                                          gridViewGameRowList[gridViewIndex];
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'dategame',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: GameNewblockWidget(
                                            key: Key(
                                                'Key1yg_${gridViewIndex}_of_${gridViewGameRowList.length}'),
                                            nameGame: gridViewGameRow.nameGame,
                                            description:
                                                gridViewGameRow.description,
                                            img: valueOrDefault<String>(
                                              gridViewGameRow.img,
                                              'https://dsnwvvivuxpvrywcizfb.supabase.co/storage/v1/object/public/gamebasket/imggame/528fa359-1dfd-4a26-8a0d-7215e8661878.jpg',
                                            ),
                                            id: gridViewGameRow.id,
                                            authorUserID:
                                                gridViewGameRow.idUser!,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Expanded(
                  child: FutureBuilder<List<GameRow>>(
                    future: GameTable().queryRows(
                      queryFn: (q) => q,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 10.0,
                            height: 10.0,
                            child: SpinKitDoubleBounce(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 10.0,
                            ),
                          ),
                        );
                      }
                      List<GameRow> columnGameRowList = snapshot.data!;
                      return SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(columnGameRowList.length,
                                  (columnIndex) {
                            final columnGameRow =
                                columnGameRowList[columnIndex];
                            return BlockWidget(
                              key: Key(
                                  'Key1ss_${columnIndex}_of_${columnGameRowList.length}'),
                              name: columnGameRow.nameGame!,
                              deskription: columnGameRow.description!,
                              author: columnGameRow.author!,
                              img: columnGameRow.img!,
                              buttonname: 'Расписание',
                              id: columnGameRow.id,
                            );
                          })
                              .divide(const SizedBox(height: 5.0))
                              .addToStart(const SizedBox(height: 15.0)),
                        ),
                      );
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
