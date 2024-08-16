import '/components/game_button/game_button_widget.dart';
import '/components/reward_component/reward_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'spin_the_wheel_page_model.dart';
export 'spin_the_wheel_page_model.dart';

class SpinTheWheelPageWidget extends StatefulWidget {
  const SpinTheWheelPageWidget({super.key});

  @override
  State<SpinTheWheelPageWidget> createState() => _SpinTheWheelPageWidgetState();
}

class _SpinTheWheelPageWidgetState extends State<SpinTheWheelPageWidget>
    with TickerProviderStateMixin {
  late SpinTheWheelPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpinTheWheelPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SpinTheWheelPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.spinCounter == 0) {
        context.safePop();
      }
    });

    animationsMap.addAll({
      'columnOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 60.0.ms,
            duration: 1420.0.ms,
            begin: const Offset(0.0, -48.0),
            end: const Offset(0.0, -168.0),
          ),
        ],
      ),
      'columnOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 60.0.ms,
            duration: 1420.0.ms,
            begin: const Offset(0.0, -48.0),
            end: const Offset(0.0, -392.0),
          ),
        ],
      ),
      'columnOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 60.0.ms,
            duration: 1420.0.ms,
            begin: const Offset(0.0, -48.0),
            end: const Offset(0.0, -280.0),
          ),
        ],
      ),
      'gameButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 8.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 8.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/SpinningBG.jpg',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 48.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 96.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.72,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(120.0),
                                          topRight: Radius.circular(120.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.67,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(120.0),
                                              topRight: Radius.circular(120.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ClipRRect(
                                                child: Container(
                                                  width: 43.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  48.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Cherry.png?alt=media&token=add66858-55ab-4e67-89c0-3db45bba96de',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%207.png?alt=media&token=7eeebf24-b52c-4df4-bf51-ef65036818e5',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Ball.png?alt=media&token=94e42cb4-4f75-4a29-9405-8f081cc69392',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Diamond.png?alt=media&token=557ec558-ee6d-4143-86bb-3d4a65cf9a08',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%207.png?alt=media&token=7eeebf24-b52c-4df4-bf51-ef65036818e5',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Cherry.png?alt=media&token=add66858-55ab-4e67-89c0-3db45bba96de',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Ball.png?alt=media&token=94e42cb4-4f75-4a29-9405-8f081cc69392',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Diamond.png?alt=media&token=557ec558-ee6d-4143-86bb-3d4a65cf9a08',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 8.0)),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'columnOnActionTriggerAnimation1']!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                child: Container(
                                                  width: 43.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  48.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Cherry.png?alt=media&token=add66858-55ab-4e67-89c0-3db45bba96de',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%207.png?alt=media&token=7eeebf24-b52c-4df4-bf51-ef65036818e5',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Ball.png?alt=media&token=94e42cb4-4f75-4a29-9405-8f081cc69392',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Diamond.png?alt=media&token=557ec558-ee6d-4143-86bb-3d4a65cf9a08',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%207.png?alt=media&token=7eeebf24-b52c-4df4-bf51-ef65036818e5',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Cherry.png?alt=media&token=add66858-55ab-4e67-89c0-3db45bba96de',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Ball.png?alt=media&token=94e42cb4-4f75-4a29-9405-8f081cc69392',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Diamond.png?alt=media&token=557ec558-ee6d-4143-86bb-3d4a65cf9a08',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 8.0)),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'columnOnActionTriggerAnimation2']!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                child: Container(
                                                  width: 43.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  48.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Cherry.png?alt=media&token=add66858-55ab-4e67-89c0-3db45bba96de',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%207.png?alt=media&token=7eeebf24-b52c-4df4-bf51-ef65036818e5',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Ball.png?alt=media&token=94e42cb4-4f75-4a29-9405-8f081cc69392',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Diamond.png?alt=media&token=557ec558-ee6d-4143-86bb-3d4a65cf9a08',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%207.png?alt=media&token=7eeebf24-b52c-4df4-bf51-ef65036818e5',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Cherry.png?alt=media&token=add66858-55ab-4e67-89c0-3db45bba96de',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Ball.png?alt=media&token=94e42cb4-4f75-4a29-9405-8f081cc69392',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 48.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20no%20Diamond.png?alt=media&token=557ec558-ee6d-4143-86bb-3d4a65cf9a08',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 8.0)),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'columnOnActionTriggerAnimation3']!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.72,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0x00FFEECE),
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: const [0.3, 0.4, 1.0],
                                          begin:
                                              const AlignmentDirectional(0.0, -1.0),
                                          end: const AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.438,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                            'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FSlot%20Machine.png?alt=media&token=4249a312-6b25-4121-b85f-2c08cc3cbb8b',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.51),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 70.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                '${valueOrDefault<String>(
                                                  _model.spinCounter
                                                      ?.toString(),
                                                  '5',
                                                )}/5',
                                                '5/5',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Daily spins left',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 8.0, 24.0, 24.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (!_model.isSpinning) {
                                                _model.isSpinning = true;
                                                setState(() {});
                                                await Future.wait([
                                                  Future(() async {
                                                    if (animationsMap[
                                                            'columnOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'columnOnActionTriggerAnimation1']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                  }),
                                                  Future(() async {
                                                    if (animationsMap[
                                                            'columnOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'columnOnActionTriggerAnimation2']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                  }),
                                                  Future(() async {
                                                    if (animationsMap[
                                                            'columnOnActionTriggerAnimation3'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'columnOnActionTriggerAnimation3']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                  }),
                                                  Future(() async {
                                                    if (animationsMap[
                                                            'gameButtonOnActionTriggerAnimation'] !=
                                                        null) {
                                                      await animationsMap[
                                                              'gameButtonOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0);
                                                    }
                                                  }),
                                                ]);
                                                _model.spinCounter =
                                                    _model.spinCounter! + -1;
                                                _model.isSpinning = false;
                                                setState(() {});
                                                await showDialog(
                                                  barrierColor:
                                                      const Color(0x7C000000),
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus(),
                                                          child: SizedBox(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.8,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.8,
                                                            child:
                                                                const RewardComponentWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: wrapWithModel(
                                              model: _model.gameButtonModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const GameButtonWidget(),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'gameButtonOnActionTriggerAnimation']!,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
