import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_my_game/block_my_game_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'myregistration_model.dart';
export 'myregistration_model.dart';

class MyregistrationWidget extends StatefulWidget {
  const MyregistrationWidget({super.key});

  @override
  State<MyregistrationWidget> createState() => _MyregistrationWidgetState();
}

class _MyregistrationWidgetState extends State<MyregistrationWidget> {
  late MyregistrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyregistrationModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<RegistrGameRow>>(
      future: RegistrGameTable().queryRows(
        queryFn: (q) => q.eq(
          'userid',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 10.0,
                ),
              ),
            ),
          );
        }
        List<RegistrGameRow> myregistrationRegistrGameRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      'Мои регистрации',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                    ),
                    actions: const [],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.menubarModel,
                              updateCallback: () => setState(() {}),
                              child: MenubarWidget(
                                nameUser: FFAppState().name,
                                email: currentUserEmail,
                                pageName: 'myreg',
                              ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final regGame =
                                      myregistrationRegistrGameRowList.toList();
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
                                            return 1;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 2;
                                          } else {
                                            return 3;
                                          }
                                        }(),
                                        1,
                                      ),
                                      crossAxisSpacing: valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 0.8;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 1.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 1.0;
                                          } else {
                                            return 1.0;
                                          }
                                        }(),
                                        1.0,
                                      ),
                                      mainAxisSpacing: valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 0.8;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 1.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 1.0;
                                          } else {
                                            return 1.0;
                                          }
                                        }(),
                                        1.0,
                                      ),
                                      childAspectRatio: 1.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: regGame.length,
                                    itemBuilder: (context, regGameIndex) {
                                      final regGameItem = regGame[regGameIndex];
                                      return FutureBuilder<List<GameFieldRow>>(
                                        future: GameFieldTable().querySingleRow(
                                          queryFn: (q) => q.eq(
                                            'id',
                                            regGameItem.gamefieldid,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 10.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<GameFieldRow>
                                              containerGameFieldRowList =
                                              snapshot.data!;
                                          final containerGameFieldRow =
                                              containerGameFieldRowList
                                                      .isNotEmpty
                                                  ? containerGameFieldRowList
                                                      .first
                                                  : null;
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: BlockMyGameWidget(
                                              key: Key(
                                                  'Keyenu_${regGameIndex}_of_${regGame.length}'),
                                              name: regGameItem.nameGame!,
                                              discription:
                                                  regGameItem.discription!,
                                              leader: regGameItem.author!,
                                              img: regGameItem.img!,
                                              buttonname: 'начать игру',
                                              unix: regGameItem.unix!,
                                              idgamefield:
                                                  regGameItem.gamefieldid!,
                                              date: regGameItem.dateGame,
                                              time:
                                                  '${containerGameFieldRow?.hhTime}:${containerGameFieldRow?.mmTime}',
                                              gameID: regGameItem.gameid!,
                                              idmembergame:
                                                  containerGameFieldRow
                                                      ?.idMemberGame,
                                              nameUser: FFAppState().name,
                                              avatar: FFAppState().avatar,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final regGameMob =
                                      myregistrationRegistrGameRowList.toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(regGameMob.length,
                                          (regGameMobIndex) {
                                        final regGameMobItem =
                                            regGameMob[regGameMobIndex];
                                        return FutureBuilder<
                                            List<GameFieldRow>>(
                                          future:
                                              GameFieldTable().querySingleRow(
                                            queryFn: (q) => q.eq(
                                              'id',
                                              regGameMobItem.gamefieldid,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 10.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<GameFieldRow>
                                                containerGameFieldRowList =
                                                snapshot.data!;
                                            final containerGameFieldRow =
                                                containerGameFieldRowList
                                                        .isNotEmpty
                                                    ? containerGameFieldRowList
                                                        .first
                                                    : null;
                                            return Container(
                                              decoration: const BoxDecoration(),
                                              child: BlockMyGameWidget(
                                                key: Key(
                                                    'Keyxz2_${regGameMobIndex}_of_${regGameMob.length}'),
                                                name: valueOrDefault<String>(
                                                  containerGameFieldRow
                                                      ?.nameGame,
                                                  '-',
                                                ),
                                                discription:
                                                    valueOrDefault<String>(
                                                  containerGameFieldRow
                                                      ?.discription,
                                                  '-',
                                                ),
                                                leader: valueOrDefault<String>(
                                                  containerGameFieldRow?.author,
                                                  '-',
                                                ),
                                                img: valueOrDefault<String>(
                                                  containerGameFieldRow?.img,
                                                  'https://dsnwvvivuxpvrywcizfb.supabase.co/storage/v1/object/public/gamebasket/useravatar/1709976654976000.png',
                                                ),
                                                buttonname: 'начать игру',
                                                unix: valueOrDefault<int>(
                                                  containerGameFieldRow?.unix,
                                                  123,
                                                ),
                                                idgamefield:
                                                    regGameMobItem.gamefieldid!,
                                                date: containerGameFieldRow
                                                    ?.dateGame
                                                    ?.toString(),
                                                time:
                                                    '${containerGameFieldRow?.hhTime}:${containerGameFieldRow?.mmTime}',
                                                gameID: containerGameFieldRow!
                                                    .gameId!,
                                                idmembergame:
                                                    containerGameFieldRow
                                                        .idMemberGame,
                                                nameUser: FFAppState().name,
                                                avatar: FFAppState().avatar,
                                              ),
                                            );
                                          },
                                        );
                                      }).divide(const SizedBox(height: 5.0)),
                                    ),
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
        );
      },
    );
  }
}
