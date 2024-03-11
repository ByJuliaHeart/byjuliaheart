import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_date_game/block_date_game_widget.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Расписание игр',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
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
                      'Расписание игр',
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
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
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: FutureBuilder<List<GameFieldRow>>(
                                  future: GameFieldTable().queryRows(
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
                                    List<GameFieldRow>
                                        gridViewGameFieldRowList =
                                        snapshot.data!;
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 1;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 2;
                                          } else {
                                            return 3;
                                          }
                                        }(),
                                        mainAxisSpacing: 1.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewGameFieldRowList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewGameFieldRow =
                                            gridViewGameFieldRowList[
                                                gridViewIndex];
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
                                          date: gridViewGameFieldRow.dateGame!
                                              .toString(),
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
                          child: FutureBuilder<List<GameFieldRow>>(
                            future: GameFieldTable().queryRows(
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
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<GameFieldRow> columnGameFieldRowList =
                                  snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(columnGameFieldRowList.length,
                                        (columnIndex) {
                                  final columnGameFieldRow =
                                      columnGameFieldRowList[columnIndex];
                                  return BlockDateGameWidget(
                                    key: Key(
                                        'Key6b3_${columnIndex}_of_${columnGameFieldRowList.length}'),
                                    name: columnGameFieldRow.nameGame!,
                                    description:
                                        columnGameFieldRow.discription!,
                                    author: columnGameFieldRow.author!,
                                    img: columnGameFieldRow.img!,
                                    buttonname: 'Зарегистрироваться',
                                    gameid: columnGameFieldRow.gameId!,
                                    date:
                                        columnGameFieldRow.dateGame!.toString(),
                                    gamefieldid: columnGameFieldRow.id,
                                    idmembergame:
                                        columnGameFieldRow.idMemberGame,
                                    dateTime:
                                        '${functions.datecut(functions.datecut(columnGameFieldRow.dateGame?.toString()))}${columnGameFieldRow.hhTime}:${columnGameFieldRow.mmTime}',
                                  );
                                }).divide(const SizedBox(height: 8.0)),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
