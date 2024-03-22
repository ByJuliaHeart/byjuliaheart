import '/flutter_flow/flutter_flow_util.dart';
import '/game_component/block_date_game_shimer/block_date_game_shimer_widget.dart';
import 'package:flutter/material.dart';
import 'shimmer_page_model.dart';
export 'shimmer_page_model.dart';

class ShimmerPageWidget extends StatefulWidget {
  const ShimmerPageWidget({super.key});

  @override
  State<ShimmerPageWidget> createState() => _ShimmerPageWidgetState();
}

class _ShimmerPageWidgetState extends State<ShimmerPageWidget> {
  late ShimmerPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerPageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 3.0,
      ),
      scrollDirection: Axis.vertical,
      children: [
        wrapWithModel(
          model: _model.blockDateGameShimerModel1,
          updateCallback: () => setState(() {}),
          child: const BlockDateGameShimerWidget(),
        ),
        wrapWithModel(
          model: _model.blockDateGameShimerModel2,
          updateCallback: () => setState(() {}),
          child: const BlockDateGameShimerWidget(),
        ),
        wrapWithModel(
          model: _model.blockDateGameShimerModel3,
          updateCallback: () => setState(() {}),
          child: const BlockDateGameShimerWidget(),
        ),
      ],
    );
  }
}
