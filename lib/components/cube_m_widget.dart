import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'cube_m_model.dart';
export 'cube_m_model.dart';

class CubeMWidget extends StatefulWidget {
  const CubeMWidget({super.key});

  @override
  State<CubeMWidget> createState() => _CubeMWidgetState();
}

class _CubeMWidgetState extends State<CubeMWidget>
    with TickerProviderStateMixin {
  late CubeMModel _model;

  var hasImageTriggered = false;
  final animationsMap = {
    'imageOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        RotateEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 4000.ms,
          begin: 0.5,
          end: 3.5,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 630.ms,
          begin: -0.25,
          end: 5.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CubeMModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/six.png',
        width: 50.0,
        fit: BoxFit.contain,
      ),
    )
        .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!)
        .animateOnActionTrigger(animationsMap['imageOnActionTriggerAnimation']!,
            hasBeenTriggered: hasImageTriggered);
  }
}
