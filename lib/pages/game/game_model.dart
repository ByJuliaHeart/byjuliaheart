import '/backend/api_requests/api_calls.dart';
import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'game_widget.dart' show GameWidget;
import 'package:flutter/material.dart';

class GameModel extends FlutterFlowModel<GameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (roleUsers)] action in Game widget.
  ApiCallResponse? roleUs;
  // Stores action output result for [Backend Call - API (users)] action in Game widget.
  ApiCallResponse? users;
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
}
