import '/flutter_flow/flutter_flow_util.dart';
import 'profile_create_edit_widget.dart' show ProfileCreateEditWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileCreateEditModel extends FlutterFlowModel<ProfileCreateEditWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
