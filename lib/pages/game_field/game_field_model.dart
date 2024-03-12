import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'game_field_widget.dart' show GameFieldWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class GameFieldModel extends FlutterFlowModel<GameFieldWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<GameFieldRow>>? requestCompleter1;
  Completer<List<CardsLiveGameRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - Query Rows] action in gameField widget.
  List<AnktetsRow>? ankets;
  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Query Rows] action in cub widget.
  List<CubeRow>? cubeNumber;
  // Stores action output result for [Backend Call - Query Rows] action in cub widget.
  List<CubeRow>? cubeRow;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CardsRow>? mycardQ;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CardsLiveGameRow? cards;

  /// Query cache managers for this widget.

  final _usergameManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> usergame({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _usergameManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsergameCache() => _usergameManager.clear();
  void clearUsergameCacheKey(String? uniqueKey) =>
      _usergameManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();

    /// Dispose query cache managers for this widget.

    clearUsergameCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
