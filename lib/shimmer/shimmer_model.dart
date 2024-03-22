import '/components/shimmer_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shimmer_widget.dart' show ShimmerWidget;
import 'package:flutter/material.dart';

class ShimmerModel extends FlutterFlowModel<ShimmerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for shimmerPage component.
  late ShimmerPageModel shimmerPageModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    shimmerPageModel = createModel(context, () => ShimmerPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    shimmerPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
