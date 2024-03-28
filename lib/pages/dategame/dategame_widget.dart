import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/components/shimmer_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_date_game/block_date_game_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().clearDateGameCache();
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: FutureBuilder<List<GameFieldRow>>(
                    future: FFAppState()
                        .dateGame(
                      requestFn: () => GameFieldTable().queryRows(
                        queryFn: (q) => q,
                      ),
                    )
                        .then((result) {
                      _model.requestCompleted = true;
                      return result;
                    }),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const ShimmerPageWidget();
                      }
                      List<GameFieldRow> desktopGameFieldRowList =
                          snapshot.data!;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: valueOrDefault<int>(
                            () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 1;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 1;
                              } else if (MediaQuery.sizeOf(context).width >
                                  kBreakpointLarge) {
                                return 2;
                              } else {
                                return 2;
                              }
                            }(),
                            2,
                          ),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: 3.0,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: desktopGameFieldRowList.length,
                        itemBuilder: (context, desktopIndex) {
                          final desktopGameFieldRow =
                              desktopGameFieldRowList[desktopIndex];
                          return BlockDateGameWidget(
                            key: Key(
                                'Key1ek_${desktopIndex}_of_${desktopGameFieldRowList.length}'),
                            name: desktopGameFieldRow.nameGame!,
                            description: desktopGameFieldRow.discription!,
                            author: desktopGameFieldRow.author!,
                            img: desktopGameFieldRow.img!,
                            buttonname: 'Зарегистрироваться',
                            gameid: desktopGameFieldRow.gameId!,
                            date: desktopGameFieldRow.dateGame!.toString(),
                            gamefieldid: desktopGameFieldRow.id,
                            idmembergame: desktopGameFieldRow.idMemberGame,
                            dateTime:
                                '${functions.datecut(desktopGameFieldRow.dateGame?.toString())}${desktopGameFieldRow.hhTime}:${desktopGameFieldRow.mmTime}',
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
      ),
    );
  }
}
