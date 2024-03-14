import '/backend/supabase/supabase.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'resource_widget.dart' show ResourceWidget;
import 'package:flutter/material.dart';

class ResourceModel extends FlutterFlowModel<ResourceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  // Model for menubar component.
  late MenubarModel menubarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _anketsManager = FutureRequestManager<List<AnktetsRow>>();
  Future<List<AnktetsRow>> ankets({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AnktetsRow>> Function() requestFn,
  }) =>
      _anketsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAnketsCache() => _anketsManager.clear();
  void clearAnketsCacheKey(String? uniqueKey) =>
      _anketsManager.clearRequest(uniqueKey);

  final _resourceManager = FutureRequestManager<List<ResourseRow>>();
  Future<List<ResourseRow>> resource({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ResourseRow>> Function() requestFn,
  }) =>
      _resourceManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearResourceCache() => _resourceManager.clear();
  void clearResourceCacheKey(String? uniqueKey) =>
      _resourceManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menubarModel = createModel(context, () => MenubarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menubarModel.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearAnketsCache();

    clearResourceCache();
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
      final requestComplete = requestCompleted1;
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
      final requestComplete = requestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
