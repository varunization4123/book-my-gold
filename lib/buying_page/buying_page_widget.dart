import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/razorpay/razorpay_payment_sheet.dart';
import '/components/price_option_selected_widget.dart';
import '/components/price_option_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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

    return FutureBuilder<ApiCallResponse>(
      future: GoldPriceCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
            ),
          );
        }
        final buyingPageGoldPriceResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Column(
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
                              valueOrDefault<String>(
                                formatNumber(
                                  GoldPriceCall.price(
                                    buyingPageGoldPriceResponse.jsonBody,
                                  ),
                                  formatType: FormatType.custom,
                                  currency: '₹',
                                  format: '####.0#',
                                  locale: 'en_US',
                                ),
                                '6000.00',
                              ),
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
                              '+ 3% GST',
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
                        initialTime: _model.timerMilliseconds,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                              [() async {}, () async {}][i]();
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 30.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
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
                                                                milliseconds:
                                                                    500),
                                                            () =>
                                                                setState(() {}),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        valueOrDefault<double>(
                                                              double.parse(
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model
                                                                    .amountFieldTextController1
                                                                    .text,
                                                                '1',
                                                              )),
                                                              1.0,
                                                            ) /
                                                            valueOrDefault<
                                                                double>(
                                                              GoldPriceCall
                                                                  .price(
                                                                buyingPageGoldPriceResponse
                                                                    .jsonBody,
                                                              ),
                                                              6000.0,
                                                            ),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
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
                                                            double.tryParse(_model
                                                                .amountFieldTextController1
                                                                .text),
                                                            1.0,
                                                          ) -
                                                          (valueOrDefault<
                                                                  double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController1
                                                                        .text),
                                                                1.0,
                                                              ) *
                                                              0.03),
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
                                                  '₹${valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault<double>(
                                                            double.tryParse(_model
                                                                .amountFieldTextController1
                                                                .text),
                                                            1.0,
                                                          ) *
                                                          0.03,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '30',
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
                                                  '(3% GST)',
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .amountFieldTextController1
                                                      ?.text = '10';
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .amountFieldTextController1
                                                      ?.text = '101';
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .amountFieldTextController1
                                                      ?.text = '501';
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
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 2.0),
                                                    child: Text(
                                                      'Popular',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 9.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '24K',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                'Pure Gold',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 6.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 16.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await processRazorpayPayment(
                                                context,
                                                amount: valueOrDefault<int>(
                                                  (double.parse(_model
                                                              .amountFieldTextController1
                                                              .text) *
                                                          100)
                                                      .round(),
                                                  0,
                                                ),
                                                currency: 'INR',
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
                                                    safeSetState(() => _model
                                                            .razorpayPaymentId =
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
                                                  status:
                                                      valueOrDefault<String>(
                                                    _model.razorpayPaymentId !=
                                                                null &&
                                                            _model.razorpayPaymentId !=
                                                                ''
                                                        ? 'success'
                                                        : 'failed',
                                                    'failed',
                                                  ),
                                                  time: getCurrentTimestamp,
                                                  amount:
                                                      valueOrDefault<String>(
                                                    _model
                                                        .amountFieldTextController1
                                                        .text,
                                                    '0',
                                                  ),
                                                  gold: formatNumber(
                                                    double.parse(_model
                                                            .amountFieldTextController1
                                                            .text) /
                                                        valueOrDefault<double>(
                                                          double.parse(
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              GoldPriceCall
                                                                  .price(
                                                                buyingPageGoldPriceResponse
                                                                    .jsonBody,
                                                              ),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '####.##',
                                                              locale: 'en_US',
                                                            ),
                                                            '6000',
                                                          )),
                                                          6000.0,
                                                        ),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '#.##',
                                                    locale: 'en_US',
                                                  ),
                                                  goldPrice:
                                                      valueOrDefault<String>(
                                                    GoldPriceCall.price(
                                                      buyingPageGoldPriceResponse
                                                          .jsonBody,
                                                    )?.toString(),
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
                                                                _model
                                                                    .amountFieldTextController1
                                                                    .text,
                                                                '0',
                                                              ),
                                                              gold:
                                                                  formatNumber(
                                                                double.parse(_model
                                                                        .amountFieldTextController1
                                                                        .text) /
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.parse(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        formatNumber(
                                                                          GoldPriceCall
                                                                              .price(
                                                                            buyingPageGoldPriceResponse.jsonBody,
                                                                          ),
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '####.##',
                                                                          locale:
                                                                              'en_US',
                                                                        ),
                                                                        '6000',
                                                                      )),
                                                                      6000.0,
                                                                    ),
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#.##',
                                                                locale: 'en_US',
                                                              ),
                                                              goldPrice:
                                                                  valueOrDefault<
                                                                      String>(
                                                                GoldPriceCall
                                                                    .price(
                                                                  buyingPageGoldPriceResponse
                                                                      .jsonBody,
                                                                )?.toString(),
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
                                                              double.parse(_model
                                                                  .amountFieldTextController1
                                                                  .text)),
                                                      'gold_bought':
                                                          FieldValue.increment(
                                                              valueOrDefault<
                                                                  double>(
                                                        double.parse(_model
                                                                .amountFieldTextController1
                                                                .text) /
                                                            valueOrDefault<
                                                                double>(
                                                              GoldPriceCall
                                                                  .price(
                                                                buyingPageGoldPriceResponse
                                                                    .jsonBody,
                                                              ),
                                                              6000.0,
                                                            ),
                                                        0.0,
                                                      )),
                                                    },
                                                  ),
                                                });

                                                context.goNamed(
                                                  'PurchaseSuccessPage',
                                                  queryParameters: {
                                                    'amount': serializeParam(
                                                      _model
                                                          .amountFieldTextController1
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'gold': serializeParam(
                                                      valueOrDefault<double>(
                                                        double.parse(_model
                                                                .amountFieldTextController1
                                                                .text) /
                                                            valueOrDefault<
                                                                double>(
                                                              GoldPriceCall
                                                                  .price(
                                                                buyingPageGoldPriceResponse
                                                                    .jsonBody,
                                                              ),
                                                              6000.0,
                                                            ),
                                                        0.0,
                                                      ),
                                                      ParamType.double,
                                                    ),
                                                    'goldPrice': serializeParam(
                                                      valueOrDefault<double>(
                                                        GoldPriceCall.price(
                                                          buyingPageGoldPriceResponse
                                                              .jsonBody,
                                                        ),
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
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Select Payment Method',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                              ' Terms & Conditions',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 24.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
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
                                                                milliseconds:
                                                                    500),
                                                            () =>
                                                                setState(() {}),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        valueOrDefault<double>(
                                                              GoldPriceCall
                                                                  .price(
                                                                buyingPageGoldPriceResponse
                                                                    .jsonBody,
                                                              ),
                                                              6000.0,
                                                            ) *
                                                            valueOrDefault<
                                                                double>(
                                                              double.parse(
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model
                                                                    .amountFieldTextController2
                                                                    .text,
                                                                '1',
                                                              )),
                                                              1.0,
                                                            ),
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '######.0#',
                                                        locale: 'en_US',
                                                      ),
                                                      '1',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
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
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController2
                                                                        .text),
                                                                1.0,
                                                              ) *
                                                              valueOrDefault<
                                                                  double>(
                                                                GoldPriceCall
                                                                    .price(
                                                                  buyingPageGoldPriceResponse
                                                                      .jsonBody,
                                                                ),
                                                                6000.0,
                                                              ) -
                                                          (valueOrDefault<
                                                                  double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .amountFieldTextController2
                                                                        .text),
                                                                1.0,
                                                              ) *
                                                              valueOrDefault<
                                                                  double>(
                                                                GoldPriceCall
                                                                    .price(
                                                                  buyingPageGoldPriceResponse
                                                                      .jsonBody,
                                                                ),
                                                                6000.0,
                                                              ) *
                                                              0.03),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '####.0#',
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
                                                  '+ ₹${valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault<double>(
                                                            double.tryParse(_model
                                                                .amountFieldTextController2
                                                                .text),
                                                            1.0,
                                                          ) *
                                                          valueOrDefault<
                                                              double>(
                                                            GoldPriceCall.price(
                                                              buyingPageGoldPriceResponse
                                                                  .jsonBody,
                                                            ),
                                                            6000.0,
                                                          ) *
                                                          0.03,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.0#',
                                                      locale: 'en_US',
                                                    ),
                                                    '60',
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
                                                  '(3% GST)',
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .amountFieldTextController2
                                                      ?.text = '0.1';
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .amountFieldTextController2
                                                      ?.text = '0.5';
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
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 2.0),
                                                    child: Text(
                                                      'Popular',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 9.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .amountFieldTextController2
                                                      ?.text = '1.5';
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '24K',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                'Pure Gold',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 6.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                    (double.parse(_model
                                                                .amountFieldTextController2
                                                                .text) *
                                                            valueOrDefault<
                                                                double>(
                                                              GoldPriceCall
                                                                  .price(
                                                                buyingPageGoldPriceResponse
                                                                    .jsonBody,
                                                              ),
                                                              6000.0,
                                                            ) *
                                                            100)
                                                        .round(),
                                                    0,
                                                  ),
                                                  currency: 'INR',
                                                  userContact:
                                                      FFAppState().phoneNumber,
                                                  dialogColor: '#00000000',
                                                  processingColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  errorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  successColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                        time:
                                                            getCurrentTimestamp,
                                                        amount: valueOrDefault<
                                                            String>(
                                                          (double gold,
                                                                  double
                                                                      goldPrice) {
                                                            return "${gold * goldPrice}";
                                                          }(
                                                              double.parse(_model
                                                                  .amountFieldTextController2
                                                                  .text),
                                                              valueOrDefault<
                                                                  double>(
                                                                double.parse(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  formatNumber(
                                                                    GoldPriceCall
                                                                        .price(
                                                                      buyingPageGoldPriceResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '####.##',
                                                                    locale:
                                                                        'en_US',
                                                                  ),
                                                                  '6000',
                                                                )),
                                                                6000.0,
                                                              )),
                                                          '0',
                                                        ),
                                                        gold: _model
                                                            .amountFieldTextController2
                                                            .text,
                                                        goldPrice:
                                                            valueOrDefault<
                                                                String>(
                                                          GoldPriceCall.price(
                                                            buyingPageGoldPriceResponse
                                                                .jsonBody,
                                                          )?.toString(),
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
                                                                  (double gold,
                                                                          double
                                                                              goldPrice) {
                                                                    return "${gold * goldPrice}";
                                                                  }(
                                                                      double.parse(_model
                                                                          .amountFieldTextController2
                                                                          .text),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        double.parse(
                                                                            valueOrDefault<String>(
                                                                          formatNumber(
                                                                            GoldPriceCall.price(
                                                                              buyingPageGoldPriceResponse.jsonBody,
                                                                            ),
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '####.##',
                                                                            locale:
                                                                                'en_US',
                                                                          ),
                                                                          '6000',
                                                                        )),
                                                                        6000.0,
                                                                      )),
                                                                  '0',
                                                                ),
                                                                gold: _model
                                                                    .amountFieldTextController2
                                                                    .text,
                                                                goldPrice:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  GoldPriceCall
                                                                      .price(
                                                                    buyingPageGoldPriceResponse
                                                                        .jsonBody,
                                                                  )?.toString(),
                                                                  '6000',
                                                                ),
                                                              ),
                                                              digiGoldBuyRecordReference);

                                                  firestoreBatch.update(
                                                      currentUserReference!, {
                                                    ...mapToFirestore(
                                                      {
                                                        'amount_bought':
                                                            FieldValue.increment(
                                                                valueOrDefault<
                                                                    double>(
                                                          double.parse(_model
                                                                  .amountFieldTextController2
                                                                  .text) *
                                                              valueOrDefault<
                                                                  double>(
                                                                GoldPriceCall
                                                                    .price(
                                                                  buyingPageGoldPriceResponse
                                                                      .jsonBody,
                                                                ),
                                                                6000.0,
                                                              ),
                                                          0.0,
                                                        )),
                                                        'gold_bought':
                                                            FieldValue.increment(
                                                                valueOrDefault<
                                                                    double>(
                                                          double.tryParse(_model
                                                              .amountFieldTextController2
                                                              .text),
                                                          0.0,
                                                        )),
                                                      },
                                                    ),
                                                  });

                                                  context.goNamed(
                                                    'PurchaseSuccessPage',
                                                    queryParameters: {
                                                      'amount': serializeParam(
                                                        formatNumber(
                                                          double.parse(_model
                                                                  .amountFieldTextController2
                                                                  .text) *
                                                              valueOrDefault<
                                                                  double>(
                                                                GoldPriceCall
                                                                    .price(
                                                                  buyingPageGoldPriceResponse
                                                                      .jsonBody,
                                                                ),
                                                                6000.0,
                                                              ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '₹',
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'gold': serializeParam(
                                                        double.tryParse(_model
                                                            .amountFieldTextController2
                                                            .text),
                                                        ParamType.double,
                                                      ),
                                                      'goldPrice':
                                                          serializeParam(
                                                        valueOrDefault<double>(
                                                          GoldPriceCall.price(
                                                            buyingPageGoldPriceResponse
                                                                .jsonBody,
                                                          ),
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
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Select Payment Method',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                              ' Terms & Conditions',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
        );
      },
    );
  }
}
