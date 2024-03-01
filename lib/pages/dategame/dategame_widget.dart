import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/block_date_game_widget.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
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
    context.watch<FFAppState>();

    return Title(
        title: 'dategame',
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
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
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
                                    return BlockDateGameWidget(
                                      key: Key(
                                          'Key1ek_${gridViewIndex}_of_${gridViewGameFieldRowList.length}'),
                                      name: gridViewGameFieldRow.nameGame!,
                                      discription:
                                          gridViewGameFieldRow.discription!,
                                      author: gridViewGameFieldRow.author!,
                                      img: gridViewGameFieldRow.img!,
                                      buttonname: 'Зарегистрироваться',
                                      gameid: gridViewGameFieldRow.gameId!,
                                      date: gridViewGameFieldRow.dateGame!
                                          .toString(),
                                      gamefieldid: gridViewGameFieldRow.id,
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
        ));
  }
}
