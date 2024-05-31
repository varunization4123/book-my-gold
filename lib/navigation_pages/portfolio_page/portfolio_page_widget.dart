import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/list_empty_component_widget.dart';
import '/components/sort_by_options_widget.dart';
import '/components/transaction_tile_widget.dart';
import '/custom_animations/custom_animation1/custom_animation1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: FFAppState().previousTransactionQuery(
        requestFn: () => GoldPriceCall.call(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 320.0,
                height: 148.0,
                child: CustomAnimation1Widget(),
              ),
            ),
          );
        }
        final portfolioPageGoldPriceResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).secondary,
                                        FlutterFlowTheme.of(context).tertiary,
                                        FlutterFlowTheme.of(context).secondary
                                      ],
                                      stops: const [0.0, 0.6, 1.0],
                                      begin: const AlignmentDirectional(0.64, 1.0),
                                      end: const AlignmentDirectional(-0.64, -1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 12.0, 6.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 12.0),
                                          child: Text(
                                            'Total Investment Value',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  letterSpacing: 0.0,
                                                ),
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
                                                'Invested',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
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
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.amountBought,
                                                          0.0),
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: '₹',
                                                      format: '###.##',
                                                      locale: 'en_US',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.goldBought,
                                                              0.0) *
                                                          valueOrDefault<
                                                              double>(
                                                            GoldPriceCall.price(
                                                              portfolioPageGoldPriceResponse
                                                                  .jsonBody,
                                                            ),
                                                            7000.0,
                                                          ),
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: '₹',
                                                      format: '###.##',
                                                      locale: 'en_US',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
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
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  '(${valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.goldBought,
                                                          0.0),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.##',
                                                      locale: 'en_US',
                                                    ),
                                                    '0',
                                                  )} gm)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  '(${valueOrDefault<String>(
                                                    formatNumber(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.goldBought,
                                                          0.0),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.##',
                                                      locale: 'en_US',
                                                    ),
                                                    '0',
                                                  )} gm)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
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
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.goldBought,
                                                                      0.0) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    GoldPriceCall
                                                                        .price(
                                                                      portfolioPageGoldPriceResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    7000.0,
                                                                  )) -
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.amountBought,
                                                                  0.0),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '₹',
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  () {
                                                                    if (valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault(currentUserDocument?.goldBought, 0.0) *
                                                                              valueOrDefault<double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              ),
                                                                          0.0,
                                                                        ) >
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.amountBought,
                                                                            0.0)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                    } else if (valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault(currentUserDocument?.goldBought, 0.0) *
                                                                              valueOrDefault<double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              ),
                                                                          0.0,
                                                                        ) <
                                                                        valueOrDefault(
                                                                            currentUserDocument?.amountBought,
                                                                            0.0)) {
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (valueOrDefault<
                                                                    double>(
                                                                  valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.goldBought,
                                                                          0.0) *
                                                                      valueOrDefault<
                                                                          double>(
                                                                        GoldPriceCall
                                                                            .price(
                                                                          portfolioPageGoldPriceResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        7000.0,
                                                                      ),
                                                                  0.0,
                                                                ) >
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.amountBought,
                                                                    0.0)) {
                                                              return const Color(
                                                                  0xFFD7F2DB);
                                                            } else if (valueOrDefault<
                                                                    double>(
                                                                  valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.goldBought,
                                                                          0.0) *
                                                                      valueOrDefault<
                                                                          double>(
                                                                        GoldPriceCall
                                                                            .price(
                                                                          portfolioPageGoldPriceResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        7000.0,
                                                                      ),
                                                                  0.0,
                                                                ) <
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.amountBought,
                                                                    0.0)) {
                                                              return const Color(
                                                                  0xFFECC1A5);
                                                            } else {
                                                              return const Color(
                                                                  0x1D000000);
                                                            }
                                                          }(),
                                                          const Color(0x1D000000),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    2.0,
                                                                    8.0,
                                                                    2.0),
                                                        child: Text(
                                                          '${valueOrDefault<String>(
                                                            formatNumber(
                                                              (((valueOrDefault(
                                                                                  currentUserDocument
                                                                                      ?.goldBought,
                                                                                  0.0) *
                                                                              valueOrDefault<
                                                                                  double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              )) -
                                                                          valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.amountBought,
                                                                              0.0)) /
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.amountBought,
                                                                          0.0)) *
                                                                  100,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###.##',
                                                              locale: 'en_US',
                                                            ),
                                                            '0',
                                                          )}%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  () {
                                                                    if (valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault(currentUserDocument?.goldBought, 0.0) *
                                                                              valueOrDefault<double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              ),
                                                                          0.0,
                                                                        ) >
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.amountBought,
                                                                            0.0)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                    } else if (valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault(currentUserDocument?.goldBought, 0.0) *
                                                                              valueOrDefault<double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              ),
                                                                          0.0,
                                                                        ) <
                                                                        valueOrDefault(
                                                                            currentUserDocument?.amountBought,
                                                                            0.0)) {
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                              FlutterFlowTheme.of(context)
                                                  .secondary
                                            ],
                                            stops: const [0.0, 1.0],
                                            begin:
                                                const AlignmentDirectional(-1.0, 0.0),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '24K Digital Gold',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 2.0, 12.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Invested',
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
                                                  Text(
                                                    'Current',
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
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 2.0, 12.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.amountBought,
                                                              0.0),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '₹',
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.goldBought,
                                                                  0.0) *
                                                              valueOrDefault<
                                                                  double>(
                                                                GoldPriceCall
                                                                    .price(
                                                                  portfolioPageGoldPriceResponse
                                                                      .jsonBody,
                                                                ),
                                                                7000.0,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 2.0, 12.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      '(${valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.goldBought,
                                                              0.0),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        '0',
                                                      )} gm)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      '(${valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.goldBought,
                                                              0.0),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        '0',
                                                      )} gm)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 0.25,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 2.0, 12.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'P&L',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.goldBought,
                                                                      0.0) *
                                                                  valueOrDefault<
                                                                      double>(
                                                                    GoldPriceCall
                                                                        .price(
                                                                      portfolioPageGoldPriceResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    7000.0,
                                                                  )) -
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.amountBought,
                                                                  0.0),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '₹',
                                                          format: '###.##',
                                                          locale: 'en_US',
                                                        ),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  () {
                                                                    if (valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault(currentUserDocument?.goldBought, 0.0) *
                                                                              valueOrDefault<double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              ),
                                                                          0.0,
                                                                        ) >
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.amountBought,
                                                                            0.0)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                    } else if (valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault(currentUserDocument?.goldBought, 0.0) *
                                                                              valueOrDefault<double>(
                                                                                GoldPriceCall.price(
                                                                                  portfolioPageGoldPriceResponse.jsonBody,
                                                                                ),
                                                                                7000.0,
                                                                              ),
                                                                          0.0,
                                                                        ) <
                                                                        valueOrDefault(
                                                                            currentUserDocument?.amountBought,
                                                                            0.0)) {
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.25,
                                                      child:
                                                          const SortByOptionsWidget(),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
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
                                child: PagedListView<DocumentSnapshot<Object?>?,
                                    DigiGoldBuyRecord>.separated(
                                  pagingController:
                                      _model.setListViewController(
                                          DigiGoldBuyRecord.collection(
                                                  currentUserReference)
                                              .orderBy('time'),
                                          parent: currentUserReference),
                                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 6.0),
                                  builderDelegate: PagedChildBuilderDelegate<
                                      DigiGoldBuyRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) =>
                                        const ListEmptyComponentWidget(
                                      text:
                                          'You haven\'t made any transaction yet.',
                                    ),
                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewDigiGoldBuyRecord = _model
                                          .listViewPagingController!
                                          .itemList![listViewIndex];
                                      return TransactionTileWidget(
                                        key: Key(
                                            'Keyx1j_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                        transactionValue:
                                            listViewDigiGoldBuyRecord.amount,
                                        transactionGold: valueOrDefault<String>(
                                          formatNumber(
                                            double.parse(
                                                listViewDigiGoldBuyRecord.gold),
                                            formatType: FormatType.custom,
                                            format: '###.##',
                                            locale: 'en_US',
                                          ),
                                          '0',
                                        ),
                                        transactionGoldPrice:
                                            listViewDigiGoldBuyRecord.goldPrice,
                                        digital: true,
                                        purchasedOrSold: true,
                                        successOrFailure: true,
                                        transactionDate:
                                            listViewDigiGoldBuyRecord.time!,
                                      );
                                    },
                                  ),
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
      },
    );
  }
}
