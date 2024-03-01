import '/components/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'myregistration_widget.dart' show MyregistrationWidget;
import 'package:flutter/material.dart';

class MyregistrationModel extends FlutterFlowModel<MyregistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
