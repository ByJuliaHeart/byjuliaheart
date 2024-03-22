import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_date_game_shimer/block_date_game_shimer_widget.dart';
import 'shimmer_page_widget.dart' show ShimmerPageWidget;
import 'package:flutter/material.dart';

class ShimmerPageModel extends FlutterFlowModel<ShimmerPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for block_dateGameShimer component.
  late BlockDateGameShimerModel blockDateGameShimerModel1;
  // Model for block_dateGameShimer component.
  late BlockDateGameShimerModel blockDateGameShimerModel2;
  // Model for block_dateGameShimer component.
  late BlockDateGameShimerModel blockDateGameShimerModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    blockDateGameShimerModel1 =
        createModel(context, () => BlockDateGameShimerModel());
    blockDateGameShimerModel2 =
        createModel(context, () => BlockDateGameShimerModel());
    blockDateGameShimerModel3 =
        createModel(context, () => BlockDateGameShimerModel());
  }

  @override
  void dispose() {
    blockDateGameShimerModel1.dispose();
    blockDateGameShimerModel2.dispose();
    blockDateGameShimerModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
