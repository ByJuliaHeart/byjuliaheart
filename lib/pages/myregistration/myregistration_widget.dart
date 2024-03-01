import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/block_my_game_widget.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
        title: 'myregistration',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.menubarModel,
                    updateCallback: () => setState(() {}),
                    child: const MenubarWidget(
                      nameUser: 'Max',
                      email: 'mail',
                      pageName: 'myreg',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FutureBuilder<List<GameFieldRow>>(
                            future: GameFieldTable().queryRows(
                              queryFn: (q) => q.contains(
                                'id_member_game',
                                '{$currentUserUid}',
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
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<GameFieldRow> gridViewGameFieldRowList =
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
                                itemCount: gridViewGameFieldRowList.length,
                                itemBuilder: (context, gridViewIndex) {
                                  final gridViewGameFieldRow =
                                      gridViewGameFieldRowList[gridViewIndex];
                                  return BlockMyGameWidget(
                                    key: Key(
                                        'Keyxfy_${gridViewIndex}_of_${gridViewGameFieldRowList.length}'),
                                    name: gridViewGameFieldRow.nameGame!,
                                    discription:
                                        gridViewGameFieldRow.discription!,
                                    leader: gridViewGameFieldRow.author!,
                                    img: gridViewGameFieldRow.img!,
                                    buttonname: 'Начать игру',
                                    unix: gridViewGameFieldRow.unix!,
                                    idgamefield: gridViewGameFieldRow.id,
                                    idmembergame:
                                        gridViewGameFieldRow.idMemberGame,
                                    date: gridViewGameFieldRow.dateGame
                                        ?.toString(),
                                    time:
                                        '${gridViewGameFieldRow.hhTime}:${gridViewGameFieldRow.mmTime}',
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
        ));
  }
}
