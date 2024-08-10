import '/backend/api_requests/api_calls.dart';
import '/components/list_empty_component_widget.dart';
import '/components/sort_by_options_widget.dart';
import '/components/transaction_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'portfolio_page_model.dart';
export 'portfolio_page_model.dart';

class PortfolioPageWidget extends StatefulWidget {
  const PortfolioPageWidget({super.key});

  @override
  State<PortfolioPageWidget> createState() => _PortfolioPageWidgetState();
}

class _PortfolioPageWidgetState extends State<PortfolioPageWidget> {
  late PortfolioPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PortfolioPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PortfolioPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().amountBought = valueOrDefault<double>(
        FFAppState().amountBought,
        0.0,
      );
      setState(() {});
      await Future.wait([
        Future(() async {
          setState(() {});
          _model.goldPriceFromApi =
              await SafeGoldAPIGroupGroup.buyPriceAPICall.call();

          _model.decryptedApiResponse = await actions.decryptApiResponse(
            FFAppState().safeGoldAccessToken,
            (_model.goldPriceFromApi?.bodyText ?? ''),
          );
          if ((_model.goldPriceFromApi?.statusCode ?? 200) == 200) {
            _model.goldPrice = valueOrDefault<double>(
              getJsonField(
                functions.jsonFromString(_model.decryptedApiResponse!),
                r'''$['current_price']''',
              ),
              6000.0,
            );
            _model.currentPrice = valueOrDefault<double>(
                  FFAppState().goldBalance,
                  0.0,
                ) *
                valueOrDefault<double>(
                  _model.goldPrice,
                  6000.0,
                );
            setState(() {});
            FFAppState().buyPrice = valueOrDefault<String>(
              getJsonField(
                functions.jsonFromString(_model.decryptedApiResponse!),
                r'''$['current_price']''',
              )?.toString().toString(),
              '6000',
            );
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Couldn\'t fetch Gold Data',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
            await actions.forceCloseTheApp();
          }
        }),
        Future(() async {
          _model.userTransactionApi =
              await SafeGoldAPIGroupGroup.userTransactionsAPICall.call(
            userId: FFAppState().userId,
          );

          _model.decryptedUserTransactionApi = await actions.decryptApiResponse(
            FFAppState().safeGoldAccessToken,
            (_model.userTransactionApi?.bodyText ?? ''),
          );
          if ((_model.userTransactionApi?.succeeded ?? true)) {
            FFAppState().transactions = getJsonField(
              functions.jsonFromString(_model.decryptedUserTransactionApi!),
              r'''$['transactions']''',
              true,
            )!
                .toList()
                .cast<dynamic>();
            setState(() {});
            _model.transactions =
                FFAppState().transactions.toList().cast<dynamic>();
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Couldn\'t fetch User Gold Data',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
            await Future.delayed(const Duration(milliseconds: 6000));
            await actions.forceCloseTheApp();
          }
        }),
      ]);
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.goNamed('DashboardPage');
                },
              ),
              title: Text(
                'Investment Portfolio',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Nunito',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Visibility(
                  visible: responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).secondary,
                                    FlutterFlowTheme.of(context).tertiary,
                                    FlutterFlowTheme.of(context).secondary
                                  ],
                                  stops: const [0.0, 0.5, 1.0],
                                  begin: const AlignmentDirectional(1.0, 0.0),
                                  end: const AlignmentDirectional(-1.0, 0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Invested',
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
                                          Text(
                                            'Current',
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
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                FFAppState().amountBought,
                                                formatType: FormatType.custom,
                                                currency: '₹',
                                                format: '###.##',
                                                locale: 'en_US',
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                valueOrDefault<double>(
                                                      FFAppState().goldBalance,
                                                      0.0,
                                                    ) *
                                                    valueOrDefault<double>(
                                                      _model.goldPrice,
                                                      6000.0,
                                                    ),
                                                formatType: FormatType.custom,
                                                currency: '₹',
                                                format: '###.##',
                                                locale: 'en_US',
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '(${valueOrDefault<String>(
                                              FFAppState()
                                                  .goldBalance
                                                  .toString(),
                                              '0',
                                            )} gm)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            '(${valueOrDefault<String>(
                                              FFAppState()
                                                  .goldBalance
                                                  .toString(),
                                              '0',
                                            )} gm)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.25,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'P&L',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            '${valueOrDefault<String>(
                                              formatNumber(
                                                (((valueOrDefault<double>(
                                                                  FFAppState()
                                                                      .goldBalance,
                                                                  0.0,
                                                                ) *
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model
                                                                      .goldPrice,
                                                                  6000.0,
                                                                )) -
                                                            valueOrDefault<
                                                                double>(
                                                              FFAppState()
                                                                  .amountBought,
                                                              0.0,
                                                            )) /
                                                        valueOrDefault<double>(
                                                          FFAppState()
                                                              .amountBought,
                                                          0.0,
                                                        )) *
                                                    100,
                                                formatType: FormatType.custom,
                                                format: '###.##',
                                                locale: 'en_US',
                                              ),
                                              '0',
                                            )}%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if (_model.currentPrice >
                                                          FFAppState()
                                                              .amountBought) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent3;
                                                      } else if (_model
                                                              .currentPrice <
                                                          FFAppState()
                                                              .amountBought) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent4;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryText;
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
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
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context).tertiary,
                                          FlutterFlowTheme.of(context).secondary
                                        ],
                                        stops: const [0.0, 1.0],
                                        begin: const AlignmentDirectional(-1.0, 0.0),
                                        end: const AlignmentDirectional(1.0, 0),
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 6.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/icon-images%2Fgold%20icon.png?alt=media&token=122cc462-b2a5-418f-accd-261f2a202738',
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '24K Digital Gold',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
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
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 12.0, 6.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Invested',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                'Current',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    FFAppState().amountBought,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '₹',
                                                    format: '###.##',
                                                    locale: 'en_US',
                                                  ),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    valueOrDefault<double>(
                                                          FFAppState()
                                                              .goldBalance,
                                                          0.0,
                                                        ) *
                                                        valueOrDefault<double>(
                                                          _model.goldPrice,
                                                          6000.0,
                                                        ),
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '₹',
                                                    format: '###.##',
                                                    locale: 'en_US',
                                                  ),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '(${valueOrDefault<String>(
                                                  FFAppState()
                                                      .goldBalance
                                                      .toString(),
                                                  '0',
                                                )} gm)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '(${valueOrDefault<String>(
                                                  FFAppState()
                                                      .goldBalance
                                                      .toString(),
                                                  '0',
                                                )} gm)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.25,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'P&L',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    (valueOrDefault<double>(
                                                              FFAppState()
                                                                  .goldBalance,
                                                              0.0,
                                                            ) *
                                                            valueOrDefault<
                                                                double>(
                                                              _model.goldPrice,
                                                              6000.0,
                                                            )) -
                                                        valueOrDefault<double>(
                                                          FFAppState()
                                                              .amountBought,
                                                          0.0,
                                                        ),
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '₹',
                                                    format: '###.##',
                                                    locale: 'en_US',
                                                  ),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model
                                                                      .currentPrice >
                                                                  FFAppState()
                                                                      .amountBought) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3;
                                                              } else if (_model
                                                                      .currentPrice <
                                                                  FFAppState()
                                                                      .amountBought) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Transactions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.25,
                                                  child: const SortByOptionsWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: const Icon(
                                      Icons.tune,
                                      color: Color(0xFF535353),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Builder(
                              builder: (context) {
                                final transactionList =
                                    FFAppState().transactions.toList();
                                if (transactionList.isEmpty) {
                                  return const ListEmptyComponentWidget(
                                    text:
                                        'You haven\'t made any transaction yet.',
                                  );
                                }

                                return ListView.separated(
                                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: transactionList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 6.0),
                                  itemBuilder: (context, transactionListIndex) {
                                    final transactionListItem =
                                        transactionList[transactionListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'TransactionDetailPage',
                                          queryParameters: {
                                            'amount': serializeParam(
                                              valueOrDefault<String>(
                                                () {
                                                  if (valueOrDefault<String>(
                                                        getJsonField(
                                                          transactionListItem,
                                                          r'''$['type']''',
                                                        )?.toString(),
                                                        'buy',
                                                      ) ==
                                                      'buy') {
                                                    return getJsonField(
                                                      transactionListItem,
                                                      r'''$['buy_price']''',
                                                    ).toString();
                                                  } else if (valueOrDefault<String>(
                                                        getJsonField(
                                                          transactionListItem,
                                                          r'''$['type']''',
                                                        )?.toString(),
                                                        'buy',
                                                      ) ==
                                                      'sell') {
                                                    return getJsonField(
                                                      transactionListItem,
                                                      r'''$['sell_price']''',
                                                    ).toString();
                                                  } else if (valueOrDefault<String>(
                                                        getJsonField(
                                                          transactionListItem,
                                                          r'''$['type']''',
                                                        )?.toString(),
                                                        'buy',
                                                      ) ==
                                                      'delivery') {
                                                    return getJsonField(
                                                      transactionListItem,
                                                      r'''$['delivery_price']''',
                                                    ).toString();
                                                  } else {
                                                    return 'null';
                                                  }
                                                }(),
                                                '0',
                                              ),
                                              ParamType.String,
                                            ),
                                            'gold': serializeParam(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  transactionListItem,
                                                  r'''$['gold_amount']''',
                                                )?.toString(),
                                                '0',
                                              ),
                                              ParamType.String,
                                            ),
                                            'status': serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                            'time': serializeParam(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  transactionListItem,
                                                  r'''$['tx_date']''',
                                                )?.toString(),
                                                '0',
                                              ),
                                              ParamType.String,
                                            ),
                                            'txId': serializeParam(
                                              valueOrDefault<int>(
                                                getJsonField(
                                                  transactionListItem,
                                                  r'''$['tx_id']''',
                                                ),
                                                0,
                                              ),
                                              ParamType.int,
                                            ),
                                            'type': serializeParam(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  transactionListItem,
                                                  r'''$['type']''',
                                                )?.toString(),
                                                '0',
                                              ),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: TransactionTileWidget(
                                        key: Key(
                                            'Keyyjb_${transactionListIndex}_of_${transactionList.length}'),
                                        transactionValue:
                                            valueOrDefault<String>(
                                          () {
                                            if (getJsonField(
                                                  transactionListItem,
                                                  r'''$['type']''',
                                                ).toString() ==
                                                'buy') {
                                              return getJsonField(
                                                transactionListItem,
                                                r'''$['buy_price']''',
                                              ).toString();
                                            } else if (getJsonField(
                                                  transactionListItem,
                                                  r'''$['type']''',
                                                ).toString() ==
                                                'sell') {
                                              return getJsonField(
                                                transactionListItem,
                                                r'''$['sell_price']''',
                                              ).toString();
                                            } else if (getJsonField(
                                                  transactionListItem,
                                                  r'''$['type']''',
                                                ).toString() ==
                                                'delivery') {
                                              return getJsonField(
                                                transactionListItem,
                                                r'''$['delivery_price']''',
                                              ).toString();
                                            } else {
                                              return 'null';
                                            }
                                          }(),
                                          '0',
                                        ),
                                        transactionGold: valueOrDefault<String>(
                                          getJsonField(
                                            transactionListItem,
                                            r'''$['gold_amount']''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        transactionGoldPrice:
                                            valueOrDefault<String>(
                                          getJsonField(
                                            transactionListItem,
                                            r'''$['rate']''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        transactionDate: valueOrDefault<String>(
                                          getJsonField(
                                            transactionListItem,
                                            r'''$['tx_date']''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        buy: valueOrDefault<String>(
                                          getJsonField(
                                                    transactionListItem,
                                                    r'''$['type']''',
                                                  ).toString() ==
                                                  'buy'
                                              ? 'buy'
                                              : 'none',
                                          '0',
                                        ),
                                        sell: valueOrDefault<String>(
                                          getJsonField(
                                                    transactionListItem,
                                                    r'''$['type']''',
                                                  ).toString() ==
                                                  'sell'
                                              ? 'sell'
                                              : 'none',
                                          '0',
                                        ),
                                        delivery: valueOrDefault<String>(
                                          getJsonField(
                                                    transactionListItem,
                                                    r'''$['type']''',
                                                  ).toString() ==
                                                  'delivery'
                                              ? 'delivery'
                                              : 'none',
                                          '0',
                                        ),
                                        txId: valueOrDefault<int>(
                                          getJsonField(
                                            transactionListItem,
                                            r'''$['tx_id']''',
                                          ),
                                          0,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 360.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: CachedNetworkImageProvider(
                                  'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/bottom-img.png?alt=media&token=d7931665-d159-4c6d-b0d4-c5983df145b4',
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 0.0)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
