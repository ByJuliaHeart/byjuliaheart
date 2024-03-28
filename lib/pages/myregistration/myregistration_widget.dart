import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_new_my_registration/block_new_my_registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().clearMyregCache();
        _model.requestCompleted = false;
      });
      await _model.waitForRequestCompleted();
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
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Open Sans',
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
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FutureBuilder<List<RegistrGameRow>>(
                            future: FFAppState()
                                .myreg(
                              requestFn: () => RegistrGameTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'userid',
                                  currentUserUid,
                                ),
                              ),
                            )
                                .then((result) {
                              _model.requestCompleted = true;
                              return result;
                            }),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 10.0,
                                    height: 10.0,
                                    child: SpinKitDoubleBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<RegistrGameRow> gridViewRegistrGameRowList =
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
                                        return 1;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 2;
                                      } else {
                                        return 2;
                                      }
                                    }(),
                                    2,
                                  ),
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 3.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: gridViewRegistrGameRowList.length,
                                itemBuilder: (context, gridViewIndex) {
                                  final gridViewRegistrGameRow =
                                      gridViewRegistrGameRowList[gridViewIndex];
                                  return FutureBuilder<List<GameFieldRow>>(
                                    future: FFAppState().gameField(
                                      requestFn: () =>
                                          GameFieldTable().querySingleRow(
                                        queryFn: (q) => q.eq(
                                          'id',
                                          gridViewRegistrGameRow.gamefieldid,
                                        ),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          containerGameFieldRowList.isNotEmpty
                                              ? containerGameFieldRowList.first
                                              : null;
                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: BlockNewMyRegistrationWidget(
                                          key: Key(
                                              'Key1pq_${gridViewIndex}_of_${gridViewRegistrGameRowList.length}'),
                                          name:
                                              gridViewRegistrGameRow.nameGame!,
                                          description: gridViewRegistrGameRow
                                              .description!,
                                          author: gridViewRegistrGameRow
                                              .gamepractice!,
                                          img: gridViewRegistrGameRow.img!,
                                          buttonname: 'Начать',
                                          gameid:
                                              gridViewRegistrGameRow.gameid!,
                                          date:
                                              gridViewRegistrGameRow.dateGame!,
                                          gamefieldid: gridViewRegistrGameRow
                                              .gamefieldid!,
                                          dateTime:
                                              '${containerGameFieldRow?.hhTime}:${containerGameFieldRow?.mmTime}',
                                          idmembergame: containerGameFieldRow
                                              ?.idMemberGame,
                                          unix: containerGameFieldRow!.unix!,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
