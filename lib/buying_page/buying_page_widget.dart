import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/razorpay/razorpay_payment_sheet.dart';
import '/components/price_breakup_widget.dart';
import '/components/price_option_selected_widget.dart';
import '/components/price_option_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'buying_page_model.dart';
export 'buying_page_model.dart';

class BuyingPageWidget extends StatefulWidget {
  const BuyingPageWidget({super.key});

  @override
  State<BuyingPageWidget> createState() => _BuyingPageWidgetState();
}

class _BuyingPageWidgetState extends State<BuyingPageWidget>
    with TickerProviderStateMixin {
  late BuyingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyingPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BuyingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readAppSettings = await queryAppSettingsRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      setState(() {
        _model.commisionFees =
            _model.readAppSettings?.commisionFees.toDouble();
        _model.discount = _model.readAppSettings?.discount.toDouble();
        _model.buyingFees =
            _model.readAppSettings?.transactionFeesBuy.toDouble();
        _model.gst = _model.readAppSettings?.gst.toDouble();
        _model.rewards = _model.readAppSettings?.rewards.toDouble();
        _model.goldDifference =
            _model.readAppSettings?.goldDiffAmount.toDouble();
      });
      await Future.wait([
        Future(() async {
          _model.mainTimer = InstantTimer.periodic(
            duration: const Duration(milliseconds: 1000),
            callback: (timer) async {
              _model.timerController.onStartTimer();
            },
            startImmediately: true,
          );
        }),
        Future(() async {
          _model.refreshTimer = InstantTimer.periodic(
            duration: const Duration(milliseconds: 300000),
            callback: (timer) async {
              setState(() {});
            },
            startImmediately: false,
          );
        }),
        Future(() async {
          _model.goldDataAPI = await GoldPriceCall.call();
          setState(() {
            _model.goldPrice = valueOrDefault<double>(
              (_model.goldDataAPI?.jsonBody ?? ''),
              6000.0,
            );
          });
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.amountFieldTextController1 ??= TextEditingController();
    _model.amountFieldFocusNode1 ??= FocusNode();

    _model.amountFieldTextController2 ??= TextEditingController();
    _model.amountFieldFocusNode2 ??= FocusNode();

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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.16,
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
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.goNamed('DashboardPage');
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Buy 24K Digital Gold',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.0,
                                child: Container(
                                  width: 0.0,
                                  height: 27.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.radio_button_checked_rounded,
                            color: FlutterFlowTheme.of(context).accent3,
                            size: 16.0,
                          ),
                          Text(
                            'Current Buy Price',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            '₹ ${valueOrDefault<String>(
                              formatNumber(
                                valueOrDefault<double>(
                                      _model.goldPrice,
                                      6000.0,
                                    ) +
                                    (valueOrDefault<double>(
                                          _model.goldPrice,
                                          6000.0,
                                        ) *
                                        (valueOrDefault<double>(
                                              _model.goldDifference,
                                              1.0,
                                            ) /
                                            100)),
                                formatType: FormatType.custom,
                                format: '###.##',
                                locale: 'en_US',
                              ),
                              '6000',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            '+ ${valueOrDefault<String>(
                              _model.gst?.toString(),
                              '3',
                            )}% GST',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 14.0,
                    ),
                    Text(
                      'Valid for',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    FlutterFlowTimer(
                      initialTime: _model.timerInitialTimeMs,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: const Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) setState(() {});
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ].divide(const SizedBox(width: 6.0)),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.75,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: false,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Nunito',
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle: const TextStyle(),
                          labelColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor: const Color(0xFFCD950C),
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).accent1,
                          borderColor: const Color(0xFFCD950C),
                          unselectedBorderColor:
                              FlutterFlowTheme.of(context).accent1,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          elevation: 0.0,
                          buttonMargin: const EdgeInsets.all(24.0),
                          tabs: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 12.0,
                                ),
                                Tab(
                                  text: ' In Rupees',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kcomponent1,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 16.0,
                                ),
                                const Tab(
                                  text: ' In Grams',
                                ),
                              ],
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
                              () async {
                                setState(() {
                                  _model.enteredAmount = 0.0;
                                });
                              },
                              () async {
                                setState(() {
                                  _model.enteredAmount = 0.0;
                                });
                              }
                            ][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Form(
                                key: _model.formKey1,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Enter Amount',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 30.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 2.0),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .amountFieldTextController1,
                                                        focusNode: _model
                                                            .amountFieldFocusNode1,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.amountFieldTextController1',
                                                          const Duration(
                                                              milliseconds: 25),
                                                          () async {
                                                            setState(() {
                                                              _model.enteredAmount =
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text);
                                                            });
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: '₹1000',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        validator: _model
                                                            .amountFieldTextController1Validator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.currency_bitcoin,
                                                  color: Color(0xFFCD950C),
                                                  size: 15.0,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      (valueOrDefault<double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                0.0,
                                                              ) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  ((_model.gst!) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  ((_model.commisionFees!) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .buyingFees,
                                                                        0.0,
                                                                      ) /
                                                                      100)) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .discount,
                                                                        0.0,
                                                                      ) /
                                                                      100))) /
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .goldPrice,
                                                                6000.0,
                                                              ) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) *
                                                                  ((_model.goldDifference!) /
                                                                      100))),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '1',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFFCD950C),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              barrierColor: const Color(0x3E000000),
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.35,
                                                        child:
                                                            PriceBreakupWidget(
                                                          price: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) -
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.gst,
                                                                            3.0,
                                                                          ) /
                                                                          100)) -
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.buyingFees,
                                                                            0.0,
                                                                          ) /
                                                                          100)) -
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.commisionFees,
                                                                            0.0,
                                                                          ) /
                                                                          100)),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '6000',
                                                          ),
                                                          gst: formatNumber(
                                                            valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .gst,
                                                                      3.0,
                                                                    ) /
                                                                    100),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '###.##',
                                                            locale: 'en_US',
                                                          ),
                                                          discount:
                                                              formatNumber(
                                                            valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .discount,
                                                                      0.0,
                                                                    ) /
                                                                    100),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '###.##',
                                                            locale: 'en_US',
                                                          ),
                                                          amount:
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) -
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.gst,
                                                                            3.0,
                                                                          ) /
                                                                          100)) -
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.buyingFees,
                                                                            0.0,
                                                                          ) /
                                                                          100)) -
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.commisionFees,
                                                                            0.0,
                                                                          ) /
                                                                          100)),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '6000',
                                                          ),
                                                          buyingFees:
                                                              formatNumber(
                                                            valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .buyingFees,
                                                                      0.0,
                                                                    ) /
                                                                    100),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '###.##',
                                                            locale: 'en_US',
                                                          ),
                                                          total: valueOrDefault<
                                                              String>(
                                                            _model.enteredAmount
                                                                ?.toString(),
                                                            '0',
                                                          ),
                                                          commision:
                                                              formatNumber(
                                                            valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .commisionFees,
                                                                      0.0,
                                                                    ) /
                                                                    100),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '###.##',
                                                            locale: 'en_US',
                                                          ),
                                                          gold: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (valueOrDefault<
                                                                          double>(
                                                                        double.tryParse(_model
                                                                            .amountFieldTextController1
                                                                            .text),
                                                                        0.0,
                                                                      ) -
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            double.tryParse(_model.amountFieldTextController1.text),
                                                                            0.0,
                                                                          ) *
                                                                          ((_model.gst!) /
                                                                              100))) /
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          ((_model.goldDifference!) /
                                                                              100))),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                          gstPercentage:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.gst
                                                                ?.toString(),
                                                            '3',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.warning_rounded,
                                                color: Color(0xFFCD950C),
                                                size: 16.0,
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Buying 24K Gold for',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '₹${valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault<double>(
                                                            _model
                                                                .enteredAmount,
                                                            0.0,
                                                          ) -
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .gst,
                                                                        3.0,
                                                                      ) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .buyingFees,
                                                                        0.0,
                                                                      ) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .commisionFees,
                                                                        0.0,
                                                                      ) /
                                                                      100))),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '6000',
                                                  )}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '₹${formatNumber(
                                                    valueOrDefault<double>(
                                                          double.tryParse(_model
                                                              .amountFieldTextController1
                                                              .text),
                                                          0.0,
                                                        ) *
                                                        (valueOrDefault<double>(
                                                              _model.gst,
                                                              3.0,
                                                            ) /
                                                            100),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###.##',
                                                    locale: 'en_US',
                                                  )}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '(%${valueOrDefault<String>(
                                                    _model.gst?.toString(),
                                                    '3',
                                                  )} GST)',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 6.0)),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model
                                                    .amountFieldTextController1
                                                    ?.text = '10';
                                              });
                                              setState(() {
                                                _model.enteredAmount = 10.0;
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model.priceOptionModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const PriceOptionWidget(
                                                value: '₹10',
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model
                                                    .amountFieldTextController1
                                                    ?.text = '101';
                                              });
                                              setState(() {
                                                _model.enteredAmount = 101.0;
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model.priceOptionModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const PriceOptionWidget(
                                                value: '₹101',
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model
                                                    .amountFieldTextController1
                                                    ?.text = '501';
                                              });
                                              setState(() {
                                                _model.enteredAmount = 501.0;
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model.priceOptionModel3,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const PriceOptionWidget(
                                                value: '₹501',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF3F4FF),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model
                                                          .amountFieldTextController1
                                                          ?.text = '1001';
                                                    });
                                                    setState(() {
                                                      _model.enteredAmount =
                                                          1001.0;
                                                    });
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .priceOptionSelectedModel1,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        const PriceOptionSelectedWidget(
                                                      value: '₹1001',
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 2.0),
                                                  child: Text(
                                                    'Popular',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.security,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 16.0,
                                            ),
                                            Text(
                                              '100% Safe and Secured |',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '24K',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              'Pure Gold',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 6.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await processRazorpayPayment(
                                              context,
                                              amount:
                                                  _model.enteredAmount!.round(),
                                              currency: 'INR',
                                              userName: currentUserDisplayName,
                                              userEmail: currentUserEmail,
                                              userContact:
                                                  FFAppState().phoneNumber,
                                              dialogColor: '#00000000',
                                              processingColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              errorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              successColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              onReceivedResponse: (paymentId) =>
                                                  safeSetState(() =>
                                                      _model.razorpayPaymentId =
                                                          paymentId),
                                            );

                                            if (_model.razorpayPaymentId !=
                                                    null &&
                                                _model.razorpayPaymentId !=
                                                    '') {
                                              var digiGoldBuyRecordReference =
                                                  DigiGoldBuyRecord.createDoc(
                                                      currentUserReference!);
                                              await digiGoldBuyRecordReference
                                                  .set(
                                                      createDigiGoldBuyRecordData(
                                                razorpayPaymentId:
                                                    _model.razorpayPaymentId,
                                                status: valueOrDefault<String>(
                                                  _model.razorpayPaymentId !=
                                                              null &&
                                                          _model.razorpayPaymentId !=
                                                              ''
                                                      ? 'success'
                                                      : 'failed',
                                                  'failed',
                                                ),
                                                time: getCurrentTimestamp,
                                                amount: valueOrDefault<String>(
                                                  formatNumber(
                                                    valueOrDefault<double>(
                                                          _model.enteredAmount,
                                                          0.0,
                                                        ) -
                                                        (valueOrDefault<double>(
                                                              _model
                                                                  .enteredAmount,
                                                              0.0,
                                                            ) *
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model.gst,
                                                                  3.0,
                                                                ) /
                                                                100)) -
                                                        (valueOrDefault<double>(
                                                              _model
                                                                  .enteredAmount,
                                                              0.0,
                                                            ) *
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .buyingFees,
                                                                  0.0,
                                                                ) /
                                                                100)) -
                                                        (valueOrDefault<double>(
                                                              _model
                                                                  .enteredAmount,
                                                              0.0,
                                                            ) *
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .commisionFees,
                                                                  0.0,
                                                                ) /
                                                                100)),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###.0#',
                                                    locale: 'en_US',
                                                  ),
                                                  '6000',
                                                ),
                                                gold: valueOrDefault<String>(
                                                  formatNumber(
                                                    (valueOrDefault<double>(
                                                              double.tryParse(_model
                                                                  .amountFieldTextController1
                                                                  .text),
                                                              0.0,
                                                            ) -
                                                            (valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                ((_model.gst!) /
                                                                    100)) -
                                                            (valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                ((_model.commisionFees!) /
                                                                    100)) -
                                                            (valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .buyingFees,
                                                                      0.0,
                                                                    ) /
                                                                    100)) +
                                                            (valueOrDefault<
                                                                    double>(
                                                                  double.tryParse(
                                                                      _model
                                                                          .amountFieldTextController1
                                                                          .text),
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .discount,
                                                                      0.0,
                                                                    ) /
                                                                    100))) /
                                                        (valueOrDefault<double>(
                                                              _model.goldPrice,
                                                              6000.0,
                                                            ) +
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .goldPrice,
                                                                  6000.0,
                                                                ) *
                                                                ((_model.goldDifference!) /
                                                                    100))),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###.0#',
                                                    locale: 'en_US',
                                                  ),
                                                  '1',
                                                ),
                                                goldPrice:
                                                    valueOrDefault<String>(
                                                  _model.goldPrice.toString(),
                                                  '6000',
                                                ),
                                              ));
                                              _model.updateTransaction1 =
                                                  DigiGoldBuyRecord
                                                      .getDocumentFromData(
                                                          createDigiGoldBuyRecordData(
                                                            razorpayPaymentId:
                                                                _model
                                                                    .razorpayPaymentId,
                                                            status:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.razorpayPaymentId !=
                                                                          null &&
                                                                      _model.razorpayPaymentId !=
                                                                          ''
                                                                  ? 'success'
                                                                  : 'failed',
                                                              'failed',
                                                            ),
                                                            time:
                                                                getCurrentTimestamp,
                                                            amount:
                                                                valueOrDefault<
                                                                    String>(
                                                              formatNumber(
                                                                valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .enteredAmount,
                                                                      0.0,
                                                                    ) -
                                                                    (valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              _model.gst,
                                                                              3.0,
                                                                            ) /
                                                                            100)) -
                                                                    (valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              _model.buyingFees,
                                                                              0.0,
                                                                            ) /
                                                                            100)) -
                                                                    (valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<double>(
                                                                              _model.commisionFees,
                                                                              0.0,
                                                                            ) /
                                                                            100)),
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format:
                                                                    '###.0#',
                                                                locale: 'en_US',
                                                              ),
                                                              '6000',
                                                            ),
                                                            gold:
                                                                valueOrDefault<
                                                                    String>(
                                                              formatNumber(
                                                                (valueOrDefault<
                                                                            double>(
                                                                          double.tryParse(_model
                                                                              .amountFieldTextController1
                                                                              .text),
                                                                          0.0,
                                                                        ) -
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              double.tryParse(_model.amountFieldTextController1.text),
                                                                              0.0,
                                                                            ) *
                                                                            ((_model.gst!) /
                                                                                100)) -
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              double.tryParse(_model.amountFieldTextController1.text),
                                                                              0.0,
                                                                            ) *
                                                                            ((_model.commisionFees!) /
                                                                                100)) -
                                                                        (valueOrDefault<double>(
                                                                              double.tryParse(_model.amountFieldTextController1.text),
                                                                              0.0,
                                                                            ) *
                                                                            (valueOrDefault<double>(
                                                                                  _model.buyingFees,
                                                                                  0.0,
                                                                                ) /
                                                                                100)) +
                                                                        (valueOrDefault<double>(
                                                                              double.tryParse(_model.amountFieldTextController1.text),
                                                                              0.0,
                                                                            ) *
                                                                            (valueOrDefault<double>(
                                                                                  _model.discount,
                                                                                  0.0,
                                                                                ) /
                                                                                100))) /
                                                                    (valueOrDefault<double>(
                                                                          _model
                                                                              .goldPrice,
                                                                          6000.0,
                                                                        ) +
                                                                        (valueOrDefault<double>(
                                                                              _model.goldPrice,
                                                                              6000.0,
                                                                            ) *
                                                                            ((_model.goldDifference!) / 100))),
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format:
                                                                    '###.0#',
                                                                locale: 'en_US',
                                                              ),
                                                              '1',
                                                            ),
                                                            goldPrice:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.goldPrice
                                                                  .toString(),
                                                              '6000',
                                                            ),
                                                          ),
                                                          digiGoldBuyRecordReference);

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'amount_bought':
                                                        FieldValue.increment(
                                                            valueOrDefault<
                                                                double>(
                                                      valueOrDefault<double>(
                                                            _model
                                                                .enteredAmount,
                                                            0.0,
                                                          ) -
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model.gst,
                                                                    3.0,
                                                                  ) /
                                                                  100)) -
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .buyingFees,
                                                                    0.0,
                                                                  ) /
                                                                  100)) -
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .commisionFees,
                                                                    0.0,
                                                                  ) /
                                                                  100)),
                                                      6000.0,
                                                    )),
                                                    'gold_bought':
                                                        FieldValue.increment(
                                                            valueOrDefault<
                                                                double>(
                                                      (valueOrDefault<double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                0.0,
                                                              ) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  ((_model.gst!) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  ((_model.commisionFees!) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .buyingFees,
                                                                        0.0,
                                                                      ) /
                                                                      100)) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .discount,
                                                                        0.0,
                                                                      ) /
                                                                      100))) /
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .goldPrice,
                                                                6000.0,
                                                              ) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) *
                                                                  ((_model.goldDifference!) /
                                                                      100))),
                                                      1.0,
                                                    )),
                                                  },
                                                ),
                                              });

                                              context.goNamed(
                                                'PurchaseSuccessPage',
                                                queryParameters: {
                                                  'amount': serializeParam(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        valueOrDefault<double>(
                                                              _model
                                                                  .enteredAmount,
                                                              0.0,
                                                            ) -
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .enteredAmount,
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .gst,
                                                                      3.0,
                                                                    ) /
                                                                    100)) -
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .enteredAmount,
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .buyingFees,
                                                                      0.0,
                                                                    ) /
                                                                    100)) -
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .enteredAmount,
                                                                  0.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .commisionFees,
                                                                      0.0,
                                                                    ) /
                                                                    100)),
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '###.0#',
                                                        locale: 'en_US',
                                                      ),
                                                      '6000',
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                  'gold': serializeParam(
                                                    valueOrDefault<double>(
                                                      (valueOrDefault<double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                0.0,
                                                              ) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  ((_model.gst!) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  ((_model.commisionFees!) /
                                                                      100)) -
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .buyingFees,
                                                                        0.0,
                                                                      ) /
                                                                      100)) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    double.tryParse(_model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .discount,
                                                                        0.0,
                                                                      ) /
                                                                      100))) /
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .goldPrice,
                                                                6000.0,
                                                              ) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) *
                                                                  ((_model.goldDifference!) /
                                                                      100))),
                                                      1.0,
                                                    ),
                                                    ParamType.double,
                                                  ),
                                                  'goldPrice': serializeParam(
                                                    valueOrDefault<double>(
                                                      (valueOrDefault<double>(
                                                            _model.goldPrice,
                                                            6000.0,
                                                          ) +
                                                          (valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .goldPrice,
                                                                6000.0,
                                                              ) *
                                                              ((_model.goldDifference!) /
                                                                  100))),
                                                      1.0,
                                                    ),
                                                    ParamType.double,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              context.pushNamed(
                                                  'PurchaseFailurePage');
                                            }

                                            setState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Select Payment Method',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Nunito',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'By continuing, I agree to the ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            ' Terms & Conditions',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Enter Grams',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 24.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 2.0),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .amountFieldTextController2,
                                                        focusNode: _model
                                                            .amountFieldFocusNode2,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.amountFieldTextController2',
                                                          const Duration(
                                                              milliseconds: 25),
                                                          () async {
                                                            setState(() {
                                                              _model.enteredAmount =
                                                                  valueOrDefault<
                                                                      double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController2
                                                                        .text),
                                                                0.0,
                                                              );
                                                            });
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: '1 gm',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        maxLength: 6,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        validator: _model
                                                            .amountFieldTextController2Validator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '^\\d*\\.?\\d*\$'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.currency_rupee,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      (valueOrDefault<double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) +
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) *
                                                                      valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldDifference,
                                                                        0.0,
                                                                      ) /
                                                                      100))) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .buyingFees,
                                                                0.0,
                                                              ) /
                                                              100) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .commisionFees,
                                                                0.0,
                                                              ) /
                                                              100) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model.gst,
                                                                3.0,
                                                              ) /
                                                              100) -
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model.discount,
                                                                0.0,
                                                              ) /
                                                              100),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '####.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '1',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              barrierColor: const Color(0x3E000000),
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.35,
                                                        child:
                                                            PriceBreakupWidget(
                                                          price: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                          gst: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model.gst,
                                                                    3.0,
                                                                  ) /
                                                                  100),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                          discount:
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .discount,
                                                                    0.0,
                                                                  ) /
                                                                  100),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                          amount: _model
                                                              .amountFieldTextController2
                                                              .text,
                                                          buyingFees:
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .buyingFees,
                                                                    0.0,
                                                                  ) /
                                                                  100),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                          total: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) +
                                                                  ((valueOrDefault<double>(
                                                                            _model.enteredAmount,
                                                                            0.0,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) +
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) *
                                                                                  valueOrDefault<double>(
                                                                                    _model.goldDifference,
                                                                                    0.0,
                                                                                  ) /
                                                                                  100))) *
                                                                      valueOrDefault<double>(
                                                                        _model
                                                                            .buyingFees,
                                                                        0.0,
                                                                      ) /
                                                                      100) +
                                                                  ((valueOrDefault<double>(
                                                                            _model.enteredAmount,
                                                                            0.0,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) +
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) *
                                                                                  valueOrDefault<double>(
                                                                                    _model.goldDifference,
                                                                                    0.0,
                                                                                  ) /
                                                                                  100))) *
                                                                      valueOrDefault<double>(
                                                                        _model
                                                                            .commisionFees,
                                                                        0.0,
                                                                      ) /
                                                                      100) +
                                                                  ((valueOrDefault<double>(
                                                                            _model.enteredAmount,
                                                                            0.0,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) +
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) *
                                                                                  valueOrDefault<double>(
                                                                                    _model.goldDifference,
                                                                                    0.0,
                                                                                  ) /
                                                                                  100))) *
                                                                      valueOrDefault<double>(
                                                                        _model
                                                                            .gst,
                                                                        3.0,
                                                                      ) /
                                                                      100) -
                                                                  ((valueOrDefault<double>(
                                                                            _model.enteredAmount,
                                                                            0.0,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) +
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) *
                                                                                  valueOrDefault<double>(
                                                                                    _model.goldDifference,
                                                                                    0.0,
                                                                                  ) /
                                                                                  100))) *
                                                                      valueOrDefault<double>(
                                                                        _model
                                                                            .discount,
                                                                        0.0,
                                                                      ) /
                                                                      100),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                          gold: _model
                                                              .amountFieldTextController2
                                                              .text,
                                                          gstPercentage:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.gst
                                                                ?.toString(),
                                                            '3',
                                                          ),
                                                          commision:
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .commisionFees,
                                                                    0.0,
                                                                  ) /
                                                                  100),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.0#',
                                                              locale: 'en_US',
                                                            ),
                                                            '1',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.warning_rounded,
                                                color: Color(0xFFCD950C),
                                                size: 16.0,
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Buying 24K Gold for',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '₹${valueOrDefault<String>(
                                                    formatNumber(
                                                      (valueOrDefault<double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) +
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) *
                                                                      valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldDifference,
                                                                        0.0,
                                                                      ) /
                                                                      100))) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .buyingFees,
                                                                0.0,
                                                              ) /
                                                              100) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .commisionFees,
                                                                0.0,
                                                              ) /
                                                              100) -
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model.discount,
                                                                0.0,
                                                              ) /
                                                              100),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '####.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '1',
                                                  )}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '+ ₹${valueOrDefault<String>(
                                                    formatNumber(
                                                      ((valueOrDefault<double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) +
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) *
                                                                      valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldDifference,
                                                                        0.0,
                                                                      ) /
                                                                      100))) *
                                                          valueOrDefault<
                                                              double>(
                                                            _model.gst,
                                                            3.0,
                                                          ) /
                                                          100),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '####.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '1',
                                                  )}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '(${valueOrDefault<String>(
                                                    _model.gst?.toString(),
                                                    '3',
                                                  )}% GST)',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            const Color(0xFF525252),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 6.0)),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model
                                                    .amountFieldTextController2
                                                    ?.text = '0.1';
                                              });
                                              setState(() {
                                                _model.enteredAmount = 0.1;
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model.priceOptionModel4,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const PriceOptionWidget(
                                                value: '0.1 gm',
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model
                                                    .amountFieldTextController2
                                                    ?.text = '0.5';
                                              });
                                              setState(() {
                                                _model.enteredAmount = 0.5;
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model.priceOptionModel5,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const PriceOptionWidget(
                                                value: '0.5 gm',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF3F4FF),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model
                                                          .amountFieldTextController2
                                                          ?.text = '1.0';
                                                    });
                                                    setState(() {
                                                      _model.enteredAmount =
                                                          1.0;
                                                    });
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .priceOptionSelectedModel2,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        const PriceOptionSelectedWidget(
                                                      value: '1.0 gm',
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 2.0),
                                                  child: Text(
                                                    'Popular',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model
                                                    .amountFieldTextController2
                                                    ?.text = '1.5';
                                              });
                                              setState(() {
                                                _model.enteredAmount = 1.5;
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model.priceOptionModel6,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const PriceOptionWidget(
                                                value: '1.5 gm',
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.security,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 16.0,
                                            ),
                                            Text(
                                              '100% Safe and Secured |',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '24K',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Text(
                                              'Pure Gold',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 6.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              await processRazorpayPayment(
                                                context,
                                                amount: valueOrDefault<int>(
                                                  ((valueOrDefault<double>(
                                                                _model
                                                                    .enteredAmount,
                                                                0.0,
                                                              ) *
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) +
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) *
                                                                      valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldDifference,
                                                                        0.0,
                                                                      ) /
                                                                      100))) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .buyingFees,
                                                                0.0,
                                                              ) /
                                                              100) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .commisionFees,
                                                                0.0,
                                                              ) /
                                                              100) +
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model.gst,
                                                                3.0,
                                                              ) /
                                                              100) -
                                                          ((valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) *
                                                              valueOrDefault<
                                                                  double>(
                                                                _model.discount,
                                                                0.0,
                                                              ) /
                                                              100))
                                                      .round(),
                                                  1,
                                                ),
                                                currency: 'INR',
                                                userContact:
                                                    FFAppState().phoneNumber,
                                                dialogColor: '#00000000',
                                                processingColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                errorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                successColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                textColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                onReceivedResponse: (paymentId) =>
                                                    safeSetState(() => _model
                                                            .razorpayPaymentId2 =
                                                        paymentId),
                                              );

                                              if (_model.razorpayPaymentId2 !=
                                                      null &&
                                                  _model.razorpayPaymentId2 !=
                                                      '') {
                                                var digiGoldBuyRecordReference =
                                                    DigiGoldBuyRecord.createDoc(
                                                        currentUserReference!);
                                                firestoreBatch.set(
                                                    digiGoldBuyRecordReference,
                                                    createDigiGoldBuyRecordData(
                                                      razorpayPaymentId: _model
                                                          .razorpayPaymentId2,
                                                      status: valueOrDefault<
                                                          String>(
                                                        _model.razorpayPaymentId2 !=
                                                                    null &&
                                                                _model.razorpayPaymentId2 !=
                                                                    ''
                                                            ? 'success'
                                                            : 'failed',
                                                        'failed',
                                                      ),
                                                      time: getCurrentTimestamp,
                                                      amount: valueOrDefault<
                                                          String>(
                                                        formatNumber(
                                                          (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) +
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .buyingFees,
                                                                    0.0,
                                                                  ) /
                                                                  100) +
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .commisionFees,
                                                                    0.0,
                                                                  ) /
                                                                  100) +
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model.gst,
                                                                    3.0,
                                                                  ) /
                                                                  100) -
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .discount,
                                                                    0.0,
                                                                  ) /
                                                                  100),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '####.0#',
                                                          locale: 'en_US',
                                                        ),
                                                        '1',
                                                      ),
                                                      gold: _model.enteredAmount
                                                          ?.toString(),
                                                      goldPrice: valueOrDefault<
                                                          String>(
                                                        formatNumber(
                                                          valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .goldPrice,
                                                                6000.0,
                                                              ) +
                                                              (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .goldPrice,
                                                                    6000.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldDifference,
                                                                        1.0,
                                                                      ) /
                                                                      100)),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        '6000',
                                                      ),
                                                    ));
                                                _model.updateTransaction2 =
                                                    DigiGoldBuyRecord
                                                        .getDocumentFromData(
                                                            createDigiGoldBuyRecordData(
                                                              razorpayPaymentId:
                                                                  _model
                                                                      .razorpayPaymentId2,
                                                              status:
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model.razorpayPaymentId2 !=
                                                                            null &&
                                                                        _model.razorpayPaymentId2 !=
                                                                            ''
                                                                    ? 'success'
                                                                    : 'failed',
                                                                'failed',
                                                              ),
                                                              time:
                                                                  getCurrentTimestamp,
                                                              amount:
                                                                  valueOrDefault<
                                                                      String>(
                                                                formatNumber(
                                                                  (valueOrDefault<
                                                                              double>(
                                                                            _model.enteredAmount,
                                                                            0.0,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) +
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) *
                                                                                  valueOrDefault<double>(
                                                                                    _model.goldDifference,
                                                                                    0.0,
                                                                                  ) /
                                                                                  100))) +
                                                                      ((valueOrDefault<double>(
                                                                                _model.enteredAmount,
                                                                                0.0,
                                                                              ) *
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) +
                                                                                  (valueOrDefault<double>(
                                                                                        _model.goldPrice,
                                                                                        6000.0,
                                                                                      ) *
                                                                                      valueOrDefault<double>(
                                                                                        _model.goldDifference,
                                                                                        0.0,
                                                                                      ) /
                                                                                      100))) *
                                                                          valueOrDefault<double>(
                                                                            _model.buyingFees,
                                                                            0.0,
                                                                          ) /
                                                                          100) +
                                                                      ((valueOrDefault<double>(
                                                                                _model.enteredAmount,
                                                                                0.0,
                                                                              ) *
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) +
                                                                                  (valueOrDefault<double>(
                                                                                        _model.goldPrice,
                                                                                        6000.0,
                                                                                      ) *
                                                                                      valueOrDefault<double>(
                                                                                        _model.goldDifference,
                                                                                        0.0,
                                                                                      ) /
                                                                                      100))) *
                                                                          valueOrDefault<double>(
                                                                            _model.commisionFees,
                                                                            0.0,
                                                                          ) /
                                                                          100) +
                                                                      ((valueOrDefault<double>(
                                                                                _model.enteredAmount,
                                                                                0.0,
                                                                              ) *
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) +
                                                                                  (valueOrDefault<double>(
                                                                                        _model.goldPrice,
                                                                                        6000.0,
                                                                                      ) *
                                                                                      valueOrDefault<double>(
                                                                                        _model.goldDifference,
                                                                                        0.0,
                                                                                      ) /
                                                                                      100))) *
                                                                          valueOrDefault<double>(
                                                                            _model.gst,
                                                                            3.0,
                                                                          ) /
                                                                          100) -
                                                                      ((valueOrDefault<double>(
                                                                                _model.enteredAmount,
                                                                                0.0,
                                                                              ) *
                                                                              (valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.0,
                                                                                  ) +
                                                                                  (valueOrDefault<double>(
                                                                                        _model.goldPrice,
                                                                                        6000.0,
                                                                                      ) *
                                                                                      valueOrDefault<double>(
                                                                                        _model.goldDifference,
                                                                                        0.0,
                                                                                      ) /
                                                                                      100))) *
                                                                          valueOrDefault<double>(
                                                                            _model.discount,
                                                                            0.0,
                                                                          ) /
                                                                          100),
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '####.0#',
                                                                  locale:
                                                                      'en_US',
                                                                ),
                                                                '1',
                                                              ),
                                                              gold: _model
                                                                  .enteredAmount
                                                                  ?.toString(),
                                                              goldPrice:
                                                                  valueOrDefault<
                                                                      String>(
                                                                formatNumber(
                                                                  valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldDifference,
                                                                                1.0,
                                                                              ) /
                                                                              100)),
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '###.##',
                                                                  locale:
                                                                      'en_US',
                                                                ),
                                                                '6000',
                                                              ),
                                                            ),
                                                            digiGoldBuyRecordReference);

                                                firestoreBatch.update(
                                                    currentUserReference!,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'amount_bought':
                                                              FieldValue.increment(
                                                                  valueOrDefault<
                                                                      double>(
                                                            (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .enteredAmount,
                                                                      0.0,
                                                                    ) *
                                                                    (valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .goldPrice,
                                                                          6000.0,
                                                                        ) +
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              _model.goldPrice,
                                                                              6000.0,
                                                                            ) *
                                                                            valueOrDefault<
                                                                                double>(
                                                                              _model.goldDifference,
                                                                              0.0,
                                                                            ) /
                                                                            100))) +
                                                                ((valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              _model.goldPrice,
                                                                              6000.0,
                                                                            ) +
                                                                            (valueOrDefault<
                                                                                    double>(
                                                                                  _model.goldPrice,
                                                                                  6000.0,
                                                                                ) *
                                                                                valueOrDefault<
                                                                                    double>(
                                                                                  _model.goldDifference,
                                                                                  0.0,
                                                                                ) /
                                                                                100))) *
                                                                    valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .buyingFees,
                                                                      0.0,
                                                                    ) /
                                                                    100) +
                                                                ((valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              _model.goldPrice,
                                                                              6000.0,
                                                                            ) +
                                                                            (valueOrDefault<
                                                                                    double>(
                                                                                  _model.goldPrice,
                                                                                  6000.0,
                                                                                ) *
                                                                                valueOrDefault<
                                                                                    double>(
                                                                                  _model.goldDifference,
                                                                                  0.0,
                                                                                ) /
                                                                                100))) *
                                                                    valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .commisionFees,
                                                                      0.0,
                                                                    ) /
                                                                    100) +
                                                                ((valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<
                                                                                double>(
                                                                              _model.goldPrice,
                                                                              6000.0,
                                                                            ) +
                                                                            (valueOrDefault<
                                                                                    double>(
                                                                                  _model.goldPrice,
                                                                                  6000.0,
                                                                                ) *
                                                                                valueOrDefault<
                                                                                    double>(
                                                                                  _model.goldDifference,
                                                                                  0.0,
                                                                                ) /
                                                                                100))) *
                                                                    valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .gst,
                                                                      3.0,
                                                                    ) /
                                                                    100) -
                                                                ((valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .enteredAmount,
                                                                          0.0,
                                                                        ) *
                                                                        (valueOrDefault<double>(
                                                                              _model.goldPrice,
                                                                              6000.0,
                                                                            ) +
                                                                            (valueOrDefault<double>(
                                                                                  _model.goldPrice,
                                                                                  6000.0,
                                                                                ) *
                                                                                valueOrDefault<double>(
                                                                                  _model.goldDifference,
                                                                                  0.0,
                                                                                ) /
                                                                                100))) *
                                                                    valueOrDefault<double>(
                                                                      _model
                                                                          .discount,
                                                                      0.0,
                                                                    ) /
                                                                    100),
                                                            1.0,
                                                          )),
                                                          'gold_bought': FieldValue
                                                              .increment(_model
                                                                  .enteredAmount!),
                                                        },
                                                      ),
                                                    });

                                                context.goNamed(
                                                  'PurchaseSuccessPage',
                                                  queryParameters: {
                                                    'amount': serializeParam(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          (valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .enteredAmount,
                                                                    0.0,
                                                                  ) *
                                                                  (valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.0,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) *
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.goldDifference,
                                                                            0.0,
                                                                          ) /
                                                                          100))) +
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .buyingFees,
                                                                    0.0,
                                                                  ) /
                                                                  100) +
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .commisionFees,
                                                                    0.0,
                                                                  ) /
                                                                  100) +
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model.gst,
                                                                    3.0,
                                                                  ) /
                                                                  100) -
                                                              ((valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .enteredAmount,
                                                                        0.0,
                                                                      ) *
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.0,
                                                                          ) +
                                                                          (valueOrDefault<
                                                                                  double>(
                                                                                _model.goldPrice,
                                                                                6000.0,
                                                                              ) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100))) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    _model
                                                                        .discount,
                                                                    0.0,
                                                                  ) /
                                                                  100),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '####.0#',
                                                          locale: 'en_US',
                                                        ),
                                                        '1',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'gold': serializeParam(
                                                      _model.enteredAmount,
                                                      ParamType.double,
                                                    ),
                                                    'goldPrice': serializeParam(
                                                      valueOrDefault<double>(
                                                        valueOrDefault<double>(
                                                              _model.goldPrice,
                                                              6000.0,
                                                            ) +
                                                            (valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .goldPrice,
                                                                  6000.0,
                                                                ) *
                                                                (valueOrDefault<
                                                                        double>(
                                                                      _model
                                                                          .goldDifference,
                                                                      1.0,
                                                                    ) /
                                                                    100)),
                                                        6000.0,
                                                      ),
                                                      ParamType.double,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                    'PurchaseFailurePage');
                                              }
                                            } finally {
                                              await firestoreBatch.commit();
                                            }

                                            setState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Select Payment Method',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'By continuing, I agree to the ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            ' Terms & Conditions',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
