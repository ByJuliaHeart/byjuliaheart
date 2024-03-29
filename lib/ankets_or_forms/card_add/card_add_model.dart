import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'card_add_widget.dart' show CardAddWidget;
import 'package:flutter/material.dart';

class CardAddModel extends FlutterFlowModel<CardAddWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name_game widget.
  String? nameGameValue;
  FormFieldController<String>? nameGameValueController;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for carddesk widget.
  FocusNode? carddeskFocusNode;
  TextEditingController? carddeskController;
  String? Function(BuildContext, String?)? carddeskControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    carddeskFocusNode?.dispose();
    carddeskController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
