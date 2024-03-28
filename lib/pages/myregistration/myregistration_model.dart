import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'myregistration_widget.dart' show MyregistrationWidget;
import 'package:flutter/material.dart';

class MyregistrationModel extends FlutterFlowModel<MyregistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Model for menubar component.
  late MenubarModel menubarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menubarModel = createModel(context, () => MenubarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menubarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
