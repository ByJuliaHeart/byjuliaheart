import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'game_time_add_widget.dart' show GameTimeAddWidget;
import 'package:flutter/material.dart';

class GameTimeAddModel extends FlutterFlowModel<GameTimeAddWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for discription widget.
  FocusNode? discriptionFocusNode;
  TextEditingController? discriptionController;
  String? Function(BuildContext, String?)? discriptionControllerValidator;
  // State field(s) for authorGame widget.
  String? authorGameValue;
  FormFieldController<String>? authorGameValueController;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for HH widget.
  String? hhValue;
  FormFieldController<String>? hhValueController;
  // State field(s) for mm widget.
  String? mmValue;
  FormFieldController<String>? mmValueController;
  // Stores action output result for [Backend Call - Query Rows] action in dateGam widget.
  List<GameRow>? gameimg;
  // Stores action output result for [Backend Call - Insert Row] action in dateGam widget.
  GameFieldRow? insertGameField;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    discriptionFocusNode?.dispose();
    discriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
