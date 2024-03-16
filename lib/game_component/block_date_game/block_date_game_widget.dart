import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'block_date_game_model.dart';
export 'block_date_game_model.dart';

class BlockDateGameWidget extends StatefulWidget {
  const BlockDateGameWidget({
    super.key,
    required this.name,
    required this.description,
    required this.author,
    required this.img,
    required this.buttonname,
    required this.gameid,
    required this.date,
    required this.gamefieldid,
    this.idmembergame,
    required this.dateTime,
  });

  final String? name;
  final String? description;
  final String? author;
  final String? img;
  final String? buttonname;
  final String? gameid;
  final String? date;
  final String? gamefieldid;
  final List<String>? idmembergame;
  final String? dateTime;

  @override
  State<BlockDateGameWidget> createState() => _BlockDateGameWidgetState();
}

class _BlockDateGameWidgetState extends State<BlockDateGameWidget> {
  late BlockDateGameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockDateGameModel());
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
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 2.2,
          height: 320.0,
          constraints: const BoxConstraints(
            maxWidth: 320.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
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
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.img,
                            'https://dsnwvvivuxpvrywcizfb.supabase.co/storage/v1/object/public/gamebasket/imggame/1709737784895000.png',
                          ),
                          width: double.infinity,
                          height: 78.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
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
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.date,
                                    'скоро...',
                                  ).maybeHandleOverflow(maxChars: 10),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.description,
                            'Описание',
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
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
                              if (functions.conditions(
                                      widget.idmembergame!.toList(),
                                      currentUserUid) ==
                                  false) {
                                await RegistrGameTable().insert({
                                  'userid': currentUserUid,
                                  'gameid': widget.gameid,
                                  'nameGame': widget.name,
                                  'discription': widget.description,
                                  'img': widget.img,
                                  'author': widget.author,
                                  'dateGame': widget.date,
                                  'gamefieldid': widget.gamefieldid,
                                  'unix': getCurrentTimestamp
                                      .millisecondsSinceEpoch,
                                });

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
                              } else {
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
                              }
                            },
                            text: functions.conditions(
                                        widget.idmembergame!.toList(),
                                        currentUserUid) ==
                                    false
                                ? widget.buttonname!
                                : 'Зарегистрированы',
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: functions.conditions(
                                          widget.idmembergame!.toList(),
                                          currentUserUid) ==
                                      false
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
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
                                await GameFieldTable().delete(
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.gamefieldid,
                                  ),
                                );

                                context.pushNamed(
                                  'dategame',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                setState(() {});
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
