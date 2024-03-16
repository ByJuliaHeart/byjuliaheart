import '/ankets_or_forms/game_i_n/game_i_n_widget.dart';
import '/ankets_or_forms/myanketa/myanketa_widget.dart';
import '/ankets_or_forms/recource/recource_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/game_component/random_card/random_card_widget.dart';
import '/game_component/user_card/user_card_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'game_field_copy_model.dart';
export 'game_field_copy_model.dart';

class GameFieldCopyWidget extends StatefulWidget {
  const GameFieldCopyWidget({
    super.key,
    required this.gamefield,
    required this.unix,
    this.idmembergame,
    this.date,
    this.time,
    this.id,
    this.gameid,
    required this.nameGame,
    required this.description,
  });

  final String? gamefield;
  final int? unix;
  final List<String>? idmembergame;
  final String? date;
  final String? time;
  final String? id;
  final String? gameid;
  final String? nameGame;
  final String? description;

  @override
  State<GameFieldCopyWidget> createState() => _GameFieldCopyWidgetState();
}

class _GameFieldCopyWidgetState extends State<GameFieldCopyWidget>
    with TickerProviderStateMixin {
  late GameFieldCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasImageTriggered = false;
  final animationsMap = {
    'imageOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        RotateEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 4000.ms,
          begin: 0.5,
          end: 3.5,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameFieldCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.newCustomAction(
        'game_field',
        () async {
          setState(() => _model.requestCompleter1 = null);
          await _model.waitForRequestCompleted1();
        },
      );
      await actions.newCustomAction(
        'cards_live_game',
        () async {
          setState(() => _model.requestCompleter2 = null);
          await _model.waitForRequestCompleted2();
        },
      );
      _model.ankets = await AnktetsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'user_id',
              currentUserUid,
            )
            .eq(
              'gameFeild_id',
              widget.gamefield,
            ),
      );
      if (!(_model.ankets != null && (_model.ankets)!.isNotEmpty)) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: GameINWidget(
                  idgame: '123',
                  nameGame: widget.nameGame!,
                  discription: widget.description!,
                  gamefieldid: widget.gamefield,
                  date: widget.date,
                  time: widget.time!,
                  idmembergame: widget.idmembergame,
                  unix: widget.unix,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Игра',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Трасформационные игры от Юлии Харт',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.timerController.onStartTimer();
                                      },
                                      text: 'Старт',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.timerController.onStopTimer();
                                      },
                                      text: 'Стоп',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.timerController.onResetTimer();
                                      },
                                      text: 'Сбросить',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                      text: 'выйти',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: FlutterFlowTimer(
                                  initialTime: _model.timerMilliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timerController,
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                                minHeight: double.infinity,
                                maxWidth: double.infinity,
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      width: 220.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: FutureBuilder<
                                                    List<UsersRow>>(
                                                  future: _model.usergame(
                                                    requestFn: () =>
                                                        UsersTable().queryRows(
                                                      queryFn: (q) => q.in_(
                                                        'id',
                                                        widget.idmembergame!,
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
                                                          child:
                                                              SpinKitDoubleBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRow>
                                                        columnUsersRowList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          columnUsersRowList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnUsersRow =
                                                            columnUsersRowList[
                                                                columnIndex];
                                                        return Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              minHeight: 100.0,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnUsersRow.id ==
                                                                              currentUserUid
                                                                          ? 'Мои карты'
                                                                          : columnUsersRow
                                                                              .name,
                                                                      '-',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                FutureBuilder<
                                                                    List<
                                                                        CardsLiveGameRow>>(
                                                                  future: (_model.requestCompleter2 ??= Completer<
                                                                          List<
                                                                              CardsLiveGameRow>>()
                                                                        ..complete(
                                                                            CardsLiveGameTable().queryRows(
                                                                          queryFn: (q) =>
                                                                              q.eq(
                                                                            'id_game_field',
                                                                            widget.gamefield,
                                                                          ),
                                                                        )))
                                                                      .future,
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              10.0,
                                                                          child:
                                                                              SpinKitDoubleBounce(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                10.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<CardsLiveGameRow>
                                                                        userGameCardsCardsLiveGameRowList =
                                                                        snapshot
                                                                            .data!;
                                                                    return SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            userGameCardsCardsLiveGameRowList.length,
                                                                            (userGameCardsIndex) {
                                                                          final userGameCardsCardsLiveGameRow =
                                                                              userGameCardsCardsLiveGameRowList[userGameCardsIndex];
                                                                          return Visibility(
                                                                            visible:
                                                                                userGameCardsCardsLiveGameRow.idUser == columnUsersRow.id,
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: UserCardWidget(
                                                                                          img: userGameCardsCardsLiveGameRow.frontCard!,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Container(
                                                                                decoration: const BoxDecoration(),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    userGameCardsCardsLiveGameRow.frontCard!,
                                                                                    width: 50.0,
                                                                                    height: 80.0,
                                                                                    fit: BoxFit.fitHeight,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }).divide(const SizedBox(
                                                                            width:
                                                                                3.0)),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
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
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/fieldmagic.jpg',
                                            ).image,
                                          ),
                                        ),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child:
                                                FutureBuilder<List<UsersRow>>(
                                              future: UsersTable().queryRows(
                                                queryFn: (q) => q
                                                    .in_(
                                                      'id',
                                                      widget.idmembergame!,
                                                    )
                                                    .order('name',
                                                        ascending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child:
                                                          SpinKitDoubleBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRow>
                                                    columnUsersRowList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: List.generate(
                                                      columnUsersRowList.length,
                                                      (columnIndex) {
                                                    final columnUsersRow =
                                                        columnUsersRowList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(6.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (columnUsersRow
                                                                  .id ==
                                                              currentUserUid) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        MyanketaWidget(
                                                                      userid:
                                                                          currentUserUid,
                                                                      gamefield:
                                                                          widget
                                                                              .gamefield!,
                                                                      unix: widget
                                                                          .unix!,
                                                                      usergameid:
                                                                          columnUsersRow
                                                                              .id,
                                                                      name: columnUsersRow
                                                                          .name!,
                                                                      email: columnUsersRow
                                                                          .email!,
                                                                      avatar: columnUsersRow
                                                                          .avatar!,
                                                                      date: widget
                                                                          .date,
                                                                      time: widget
                                                                          .time,
                                                                      nameGame:
                                                                          widget
                                                                              .nameGame!,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        RecourceWidget(
                                                                      userid:
                                                                          currentUserUid,
                                                                      gamefield:
                                                                          widget
                                                                              .gamefield!,
                                                                      unix: widget
                                                                          .unix!,
                                                                      usergameid:
                                                                          columnUsersRow
                                                                              .id,
                                                                      name: columnUsersRow
                                                                          .name!,
                                                                      avatar: valueOrDefault<
                                                                          String>(
                                                                        columnUsersRow
                                                                            .avatar,
                                                                        'https://dsnwvvivuxpvrywcizfb.supabase.co/storage/v1/object/public/gamebasket/gamebasket/9280082.jpg',
                                                                      ),
                                                                      date: widget
                                                                          .date,
                                                                      time: widget
                                                                          .time,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          43.0,
                                                                      height:
                                                                          43.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        'https://images.unsplash.com/photo-1608889175123-8ee362201f81?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOHx8YXZhdGFyfGVufDB8fHx8MTcwODIwNzMwOXww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnUsersRow.id ==
                                                                              currentUserUid
                                                                          ? 'Я'
                                                                          : columnUsersRow
                                                                              .name,
                                                                      '-',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                          FutureBuilder<List<GameFieldRow>>(
                                            future: (_model
                                                        .requestCompleter1 ??=
                                                    Completer<
                                                        List<GameFieldRow>>()
                                                      ..complete(
                                                          GameFieldTable()
                                                              .querySingleRow(
                                                        queryFn: (q) => q.eq(
                                                          'id',
                                                          widget.gamefield,
                                                        ),
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 10.0,
                                                    height: 10.0,
                                                    child: SpinKitDoubleBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 10.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<GameFieldRow>
                                                  columnCubGameFieldRowList =
                                                  snapshot.data!;
                                              final columnCubGameFieldRow =
                                                  columnCubGameFieldRowList
                                                          .isNotEmpty
                                                      ? columnCubGameFieldRowList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(6.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (animationsMap[
                                                                'imageOnActionTriggerAnimation'] !=
                                                            null) {
                                                          setState(() =>
                                                              hasImageTriggered =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'imageOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                        _model.cubeNumber =
                                                            await CubeTable()
                                                                .queryRows(
                                                          queryFn: (q) => q,
                                                        );
                                                        setState(() {
                                                          FFAppState()
                                                                  .cubeNumber =
                                                              _model
                                                                  .cubeNumber![
                                                                      random_data
                                                                          .randomInteger(
                                                                              0,
                                                                              5)]
                                                                  .number!;
                                                        });
                                                        _model.cubeRow =
                                                            await CubeTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'number',
                                                            FFAppState()
                                                                .cubeNumber,
                                                          ),
                                                        );
                                                        await GameFieldTable()
                                                            .update(
                                                          data: {
                                                            'cube_img': _model
                                                                .cubeRow
                                                                ?.first
                                                                .img,
                                                            'cube_number':
                                                                _model
                                                                    .cubeRow
                                                                    ?.first
                                                                    .number,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget.gamefield,
                                                          ),
                                                        );
                                                        await AnktetsTable()
                                                            .update(
                                                          data: {
                                                            'cube_num': _model
                                                                .cubeRow
                                                                ?.first
                                                                .number,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'gameFeild_id',
                                                            widget.gamefield,
                                                          ),
                                                        );

                                                        setState(() {});
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            columnCubGameFieldRow
                                                                ?.cubeImg,
                                                            'https://dsnwvvivuxpvrywcizfb.supabase.co/storage/v1/object/public/gamebasket/gamebasket/cube/four.png',
                                                          ),
                                                          width: 50.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation']!,
                                                        hasBeenTriggered:
                                                            hasImageTriggered),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
                                                    child: FutureBuilder<
                                                        List<AnktetsRow>>(
                                                      future: AnktetsTable()
                                                          .querySingleRow(
                                                        queryFn: (q) => q
                                                            .eq(
                                                              'user_id',
                                                              currentUserUid,
                                                            )
                                                            .eq(
                                                              'gameFeild_id',
                                                              widget.gamefield,
                                                            ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child:
                                                                  SpinKitDoubleBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AnktetsRow>
                                                            columnAnktetsRowList =
                                                            snapshot.data!;
                                                        final columnAnktetsRow =
                                                            columnAnktetsRowList
                                                                    .isNotEmpty
                                                                ? columnAnktetsRowList
                                                                    .first
                                                                : null;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (columnAnktetsRow
                                                                    ?.cubeNum !=
                                                                null)
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.mycardQ =
                                                                      await CardsTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  setState(() {
                                                                    FFAppState().cardConfirm = _model
                                                                        .mycardQ![random_data.randomInteger(
                                                                            0,
                                                                            5)]
                                                                        .frontCard!;
                                                                  });
                                                                  _model.cards =
                                                                      await CardsLiveGameTable()
                                                                          .insert({
                                                                    'id_user':
                                                                        currentUserUid,
                                                                    'id_game_field':
                                                                        widget
                                                                            .gamefield,
                                                                    'unix': widget
                                                                        .unix,
                                                                    'front_card':
                                                                        FFAppState()
                                                                            .cardConfirm,
                                                                    'back_cards': _model
                                                                        .mycardQ
                                                                        ?.first
                                                                        .backCards,
                                                                  });
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              RandomCardWidget(
                                                                            img:
                                                                                FFAppState().cardConfirm,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  setState(() =>
                                                                      _model.requestCompleter2 =
                                                                          null);

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'Взять карту',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
