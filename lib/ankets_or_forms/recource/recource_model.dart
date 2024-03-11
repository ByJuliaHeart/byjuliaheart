import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recource_widget.dart' show RecourceWidget;
import 'package:flutter/material.dart';

class RecourceModel extends FlutterFlowModel<RecourceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for my_comments widget.
  FocusNode? myCommentsFocusNode;
  TextEditingController? myCommentsController;
  String? Function(BuildContext, String?)? myCommentsControllerValidator;
  // State field(s) for player_queries widget.
  FocusNode? playerQueriesFocusNode;
  TextEditingController? playerQueriesController;
  String? Function(BuildContext, String?)? playerQueriesControllerValidator;
  // State field(s) for my_contribution widget.
  FocusNode? myContributionFocusNode;
  TextEditingController? myContributionController;
  String? Function(BuildContext, String?)? myContributionControllerValidator;
  // State field(s) for player_contribution widget.
  FocusNode? playerContributionFocusNode;
  TextEditingController? playerContributionController;
  String? Function(BuildContext, String?)?
      playerContributionControllerValidator;
  // State field(s) for highlights_for_player widget.
  FocusNode? highlightsForPlayerFocusNode;
  TextEditingController? highlightsForPlayerController;
  String? Function(BuildContext, String?)?
      highlightsForPlayerControllerValidator;
  // State field(s) for feedback_time widget.
  FocusNode? feedbackTimeFocusNode;
  TextEditingController? feedbackTimeController;
  String? Function(BuildContext, String?)? feedbackTimeControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ResourseRow>? resourceOut;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    myCommentsFocusNode?.dispose();
    myCommentsController?.dispose();

    playerQueriesFocusNode?.dispose();
    playerQueriesController?.dispose();

    myContributionFocusNode?.dispose();
    myContributionController?.dispose();

    playerContributionFocusNode?.dispose();
    playerContributionController?.dispose();

    highlightsForPlayerFocusNode?.dispose();
    highlightsForPlayerController?.dispose();

    feedbackTimeFocusNode?.dispose();
    feedbackTimeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
