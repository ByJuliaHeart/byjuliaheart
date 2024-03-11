import '/ankets_or_forms/game_add/game_add_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block/block_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';
export 'game_model.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late GameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameModel());

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Трансформациоонные игры',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
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
                          child: const GameAddWidget(),
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
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                    title: Text(
                      'Игры',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
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
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 10.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<GameRow> gridViewGameRowList =
                                        snapshot.data!;
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: gridViewGameRowList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewGameRow =
                                            gridViewGameRowList[gridViewIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: BlockWidget(
                                            key: Key(
                                                'Keym3c_${gridViewIndex}_of_${gridViewGameRowList.length}'),
                                            name: gridViewGameRow.nameGame!,
                                            deskription:
                                                gridViewGameRow.discription!,
                                            author: gridViewGameRow.author!,
                                            img: gridViewGameRow.img!,
                                            buttonname: 'Расписание',
                                            id: gridViewGameRow.id,
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
                                    color: FlutterFlowTheme.of(context).accent1,
                                    size: 10.0,
                                  ),
                                ),
                              );
                            }
                            List<GameRow> columnGameRowList = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(columnGameRowList.length,
                                  (columnIndex) {
                                final columnGameRow =
                                    columnGameRowList[columnIndex];
                                return BlockWidget(
                                  key: Key(
                                      'Keymzy_${columnIndex}_of_${columnGameRowList.length}'),
                                  name: columnGameRow.nameGame!,
                                  deskription: columnGameRow.discription!,
                                  author: columnGameRow.author!,
                                  img: columnGameRow.img!,
                                  buttonname: 'Расписание',
                                  id: columnGameRow.id,
                                );
                              }),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
