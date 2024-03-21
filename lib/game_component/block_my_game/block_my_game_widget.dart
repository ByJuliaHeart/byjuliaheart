import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'block_my_game_model.dart';
export 'block_my_game_model.dart';

class BlockMyGameWidget extends StatefulWidget {
  const BlockMyGameWidget({
    super.key,
    required this.name,
    required this.discription,
    required this.leader,
    required this.img,
    required this.buttonname,
    required this.unix,
    this.idmembergame,
    required this.idgamefield,
    this.date,
    required this.time,
    required this.gameID,
    required this.nameUser,
    required this.avatar,
  });

  final String? name;
  final String? discription;
  final String? leader;
  final String? img;
  final String? buttonname;
  final int? unix;
  final List<String>? idmembergame;
  final String? idgamefield;
  final String? date;
  final String? time;
  final String? gameID;
  final String? nameUser;
  final String? avatar;

  @override
  State<BlockMyGameWidget> createState() => _BlockMyGameWidgetState();
}

class _BlockMyGameWidgetState extends State<BlockMyGameWidget> {
  late BlockMyGameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockMyGameModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          height: 330.0,
          constraints: const BoxConstraints(
            maxWidth: 340.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Image.asset(
                      'assets/images/528fa359-1dfd-4a26-8a0d-7215e8661878.jpg',
                      width: double.infinity,
                      height: 86.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.name,
                          'Название',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.discription,
                            'Описание',
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.date,
                              '-',
                            ).maybeHandleOverflow(maxChars: 10),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.time,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ].divide(const SizedBox(width: 5.0)),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'gameField',
                                queryParameters: {
                                  'gamefield': serializeParam(
                                    widget.idgamefield,
                                    ParamType.String,
                                  ),
                                  'unix': serializeParam(
                                    widget.unix,
                                    ParamType.int,
                                  ),
                                  'idmembergame': serializeParam(
                                    widget.idmembergame,
                                    ParamType.String,
                                    true,
                                  ),
                                  'date': serializeParam(
                                    widget.date,
                                    ParamType.String,
                                  ),
                                  'time': serializeParam(
                                    widget.time,
                                    ParamType.String,
                                  ),
                                  'id': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                  'gameid': serializeParam(
                                    widget.gameID,
                                    ParamType.String,
                                  ),
                                  'nameGame': serializeParam(
                                    widget.name,
                                    ParamType.String,
                                  ),
                                  'description': serializeParam(
                                    widget.discription,
                                    ParamType.String,
                                  ),
                                  'avatar': serializeParam(
                                    FFAppState().avatar,
                                    ParamType.String,
                                  ),
                                  'nameUser': serializeParam(
                                    widget.nameUser,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: widget.buttonname!,
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          if (FFAppState().roleUsers.contains('Admin'))
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await RegistrGameTable().delete(
                                  matchingRows: (rows) => rows
                                      .eq(
                                        'userid',
                                        currentUserUid,
                                      )
                                      .eq(
                                        'gamefieldid',
                                        widget.idgamefield,
                                      ),
                                );

                                context.pushNamed(
                                  'myregistration',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
