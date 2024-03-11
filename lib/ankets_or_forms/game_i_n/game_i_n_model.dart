import '/flutter_flow/flutter_flow_util.dart';
import 'game_i_n_widget.dart' show GameINWidget;
import 'package:flutter/material.dart';

class GameINModel extends FlutterFlowModel<GameINWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for discription widget.
  FocusNode? discriptionFocusNode;
  TextEditingController? discriptionController;
  String? Function(BuildContext, String?)? discriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    discriptionFocusNode?.dispose();
    discriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
