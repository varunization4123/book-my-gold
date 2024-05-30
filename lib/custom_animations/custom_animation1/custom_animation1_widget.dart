import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'custom_animation1_model.dart';
export 'custom_animation1_model.dart';

class CustomAnimation1Widget extends StatefulWidget {
  const CustomAnimation1Widget({super.key});

  @override
  State<CustomAnimation1Widget> createState() => _CustomAnimation1WidgetState();
}

class _CustomAnimation1WidgetState extends State<CustomAnimation1Widget>
    with TickerProviderStateMixin {
  late CustomAnimation1Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomAnimation1Model());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 30.0.ms,
            begin: const Offset(-64.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 350.0.ms,
            duration: 30.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(64.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 350.0.ms,
            duration: 30.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 400.0.ms,
            duration: 50.0.ms,
            begin: const Offset(-64.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 850.0.ms,
            duration: 50.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(64.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 850.0.ms,
            duration: 50.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 900.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 900.0.ms,
            duration: 50.0.ms,
            begin: const Offset(-64.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 1250.0.ms,
            duration: 50.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(64.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1250.0.ms,
            duration: 50.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1250.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 1250.0.ms,
            duration: 50.0.ms,
            begin: const Offset(-64.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 1600.0.ms,
            duration: 50.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(64.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1600.0.ms,
            duration: 50.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 148.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Container(
                width: 96.0,
                height: 96.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Gold_locker_vault.png',
                    ).image,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
              Container(
                width: 96.0,
                height: 96.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/gold_3.png',
                    ).image,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
              Container(
                width: 96.0,
                height: 96.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/gold_2.png',
                    ).image,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation3']!),
              Container(
                width: 96.0,
                height: 96.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/gold.png',
                    ).image,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation4']!),
            ],
          ),
          Text(
            'Fetching the best Gold prices for you',
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Nunito',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ].divide(const SizedBox(height: 24.0)),
      ),
    );
  }
}
