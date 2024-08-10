import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'loading_screen_model.dart';
export 'loading_screen_model.dart';

class LoadingScreenWidget extends StatefulWidget {
  const LoadingScreenWidget({
    super.key,
    String? invoiceId,
    required this.goldAmount,
    String? buyPrice,
    int? txId,
    required this.goldPrice,
    required this.amount,
  })  : invoiceId = invoiceId ?? 'SG000',
        buyPrice = buyPrice ?? '0',
        txId = txId ?? 0;

  final String invoiceId;
  final double? goldAmount;
  final String buyPrice;
  final int txId;
  final double? goldPrice;
  final String? amount;

  @override
  State<LoadingScreenWidget> createState() => _LoadingScreenWidgetState();
}

class _LoadingScreenWidgetState extends State<LoadingScreenWidget>
    with TickerProviderStateMixin {
  late LoadingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoadingScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.buyStatusApi = await SafeGoldAPIGroupGroup.buyStatusAPICall.call(
        txId: widget.txId,
      );

      _model.decryptedBuyVerifyApiResponse = await actions.decryptApiResponse(
        FFAppState().safeGoldAccessToken,
        (_model.buyStatusApi?.bodyText ?? ''),
      );
      if ((_model.buyStatusApi?.succeeded ?? true)) {
        context.goNamed(
          'PurchaseSuccessPage',
          queryParameters: {
            'amount': serializeParam(
              widget.amount,
              ParamType.String,
            ),
            'gold': serializeParam(
              widget.goldAmount,
              ParamType.double,
            ),
            'goldPrice': serializeParam(
              valueOrDefault<double>(
                widget.goldPrice,
                6000.0,
              ),
              ParamType.double,
            ),
            'invoiceId': serializeParam(
              widget.invoiceId,
              ParamType.String,
            ),
            'txId': serializeParam(
              widget.txId,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      } else {
        context.pushNamed('PurchaseFailurePage');
      }
    });

    animationsMap.addAll({
      'circleImageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 240.0.ms,
            duration: 820.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).tertiary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: const [0.0, 0.5, 1.0],
                        begin: const AlignmentDirectional(1.0, 0.98),
                        end: const AlignmentDirectional(-1.0, -0.98),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 64.0, 0.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Transaction Initiated',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 96.0, 0.0, 0.0),
                          child: Container(
                            width: 280.0,
                            height: 280.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/logo_bookmygold.png?alt=media&token=31c14fc6-9baf-4d3e-b77a-72a6b44a76e8',
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['circleImageOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Please wait until the transaction goes through',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Don\'t close this screen',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
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
