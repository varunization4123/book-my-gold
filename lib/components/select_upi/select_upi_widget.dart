import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/add_new_u_p_i/add_new_u_p_i_widget.dart';
import '/components/custom_list_tile/custom_list_tile_widget.dart';
import '/components/list_empty_component/list_empty_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_upi_model.dart';
export 'select_upi_model.dart';

class SelectUpiWidget extends StatefulWidget {
  const SelectUpiWidget({
    super.key,
    required this.txId,
    required this.date,
    required this.amount,
    required this.gold,
    required this.decryptedSellVerifyApiResopnse,
  });

  final int? txId;
  final DateTime? date;
  final String? amount;
  final String? gold;
  final String? decryptedSellVerifyApiResopnse;

  @override
  State<SelectUpiWidget> createState() => _SelectUpiWidgetState();
}

class _SelectUpiWidgetState extends State<SelectUpiWidget>
    with TickerProviderStateMixin {
  late SelectUpiModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectUpiModel());

    animationsMap.addAll({
      'progressBarOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 5.0,
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
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 36.0, 16.0, 36.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: AuthUserStreamWidget(
              builder: (context) => Builder(
                builder: (context) {
                  final upiId =
                      (currentUserDocument?.upiIds.toList() ?? []).toList();
                  if (upiId.isEmpty) {
                    return const Center(
                      child: ListEmptyComponentWidget(
                        text: 'No Payment Methods Added',
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: upiId.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                    itemBuilder: (context, upiIdIndex) {
                      final upiIdItem = upiId[upiIdIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.upiID = upiIdItem;
                          setState(() {});
                        },
                        child: CustomListTileWidget(
                          key: Key('Key688_${upiIdIndex}_of_${upiId.length}'),
                          item: upiIdItem,
                          isSelected: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                barrierColor: const Color(0x50000000),
                enableDrag: false,
                context: context,
                builder: (context) {
                  return WebViewAware(
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: const AddNewUPIWidget(),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).secondary,
                    FlutterFlowTheme.of(context).tertiary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: const [0.0, 0.6, 1.0],
                  begin: const AlignmentDirectional(1.0, -0.5),
                  end: const AlignmentDirectional(-1.0, 0.5),
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_box,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                  Text(
                    'Add a new UPI ID',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await Future.wait([
                  Future(() async {
                    _model.isLoading = true;
                    setState(() {});
                    if (_model.upiID != null && _model.upiID != '') {
                      _model.encryptedSellConfirmApiRequest =
                          actions.encryptApiRequest(
                        functions.sellConfirmData(widget.txId!.toString()),
                        FFAppState().safeGoldAccessToken,
                      );
                      _model.sellConfirmApi =
                          await SafeGoldAPIGroupGroup.sellConfirmAPICall.call(
                        userId: FFAppState().userId,
                        encryptedData: _model.encryptedSellConfirmApiRequest,
                      );

                      _model.decryptedSellConfirmApiResponse =
                          await actions.decryptApiResponse(
                        FFAppState().safeGoldAccessToken,
                        (_model.sellConfirmApi?.bodyText ?? ''),
                      );
                      if ((_model.sellConfirmApi?.succeeded ?? true)) {
                        unawaited(
                          () async {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'amount_bought':
                                      FieldValue.increment(getJsonField(
                                    functions.jsonFromString(widget
                                        .decryptedSellVerifyApiResopnse!),
                                    r'''$['sell_price']''',
                                  )),
                                  'gold_bought':
                                      FieldValue.increment(getJsonField(
                                    functions.jsonFromString(widget
                                        .decryptedSellVerifyApiResopnse!),
                                    r'''$['gold_amount']''',
                                  )),
                                },
                              ),
                            });
                          }(),
                        );

                        context.goNamed(
                          'WithdrawSuccessfulPage',
                          queryParameters: {
                            'amount': serializeParam(
                              widget.amount,
                              ParamType.String,
                            ),
                            'gold': serializeParam(
                              widget.gold,
                              ParamType.String,
                            ),
                            'upiId': serializeParam(
                              _model.upiID,
                              ParamType.String,
                            ),
                            'txId': serializeParam(
                              widget.txId,
                              ParamType.int,
                            ),
                            'invoiceId': serializeParam(
                              getJsonField(
                                functions.jsonFromString(
                                    _model.decryptedSellConfirmApiResponse!),
                                r'''$['invoice_id']''',
                              ).toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Something went wrong',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Select UPI ID',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      _model.isLoading = false;
                      setState(() {});
                    }
                  }),
                  Future(() async {
                    await Future.delayed(const Duration(milliseconds: 300000));
                    Navigator.pop(context);
                  }),
                ]);

                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (!_model.isLoading) {
                      return Text(
                        'Confirm',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Nunito',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      );
                    } else {
                      return CircularPercentIndicator(
                        percent: 0.85,
                        radius: 10.0,
                        lineWidth: 3.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        startAngle: 90.0,
                      ).animateOnPageLoad(
                          animationsMap['progressBarOnPageLoadAnimation']!);
                    }
                  },
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 24.0)),
      ),
    );
  }
}
