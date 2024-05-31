import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_graph_widget.dart';
import '/components/grap_option_widget.dart';
import '/components/rewards_card_widget.dart';
import '/components/s_i_p_card_widget.dart';
import '/components/sponsored_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/app_walkthrough.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dashboard_page_model.dart';
export 'dashboard_page_model.dart';

class DashboardPageWidget extends StatefulWidget {
  const DashboardPageWidget({super.key});

  @override
  State<DashboardPageWidget> createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPageWidget> {
  late DashboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DashboardPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readAppSettings = await queryAppSettingsRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.goldDifference =
          _model.readAppSettings?.goldDiffAmount.toDouble();
      setState(() {});
      _model.goldPriceFromApi = await GoldPriceCall.call();
      if ((_model.goldPriceFromApi?.succeeded ?? true)) {
        _model.goldPrice = valueOrDefault<double>(
          GoldPriceCall.currentPrice(
            (_model.goldPriceFromApi?.jsonBody ?? ''),
          ),
          6000.00,
        );
        setState(() {});
      }
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Visibility(
            visible: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 94.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).tertiary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 52.0, 0.0, 0.0),
                            child: Text(
                              'Dashboard',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                14.0, 18.0, 14.0, 30.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('PortfolioPage');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).secondary,
                                      FlutterFlowTheme.of(context).accent1,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                    begin: const AlignmentDirectional(0.64, 1.0),
                                    end: const AlignmentDirectional(-0.64, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 2.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 6.0),
                                              child: Text(
                                                'Total Investment',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.amountBought,
                                                              0.0),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: '₹',
                                                        ),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      '(${valueOrDefault<String>(
                                                        formatNumber(
                                                          double.parse(
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.goldBought,
                                                                  0.0),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###.##',
                                                              locale: 'en_US',
                                                            ),
                                                            '0',
                                                          )),
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
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 12.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                                                  valueOrDefault<
                                                                          double>(
                                                                        _model
                                                                            .goldPrice,
                                                                        6000.00,
                                                                      ) +
                                                                      (valueOrDefault<
                                                                              double>(
                                                                            _model.goldPrice,
                                                                            6000.00,
                                                                          ) *
                                                                          (valueOrDefault<double>(
                                                                                _model.goldDifference,
                                                                                0.0,
                                                                              ) /
                                                                              100)),
                                                                  6000.0,
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
                                                                        valueOrDefault(currentUserDocument?.goldBought,
                                                                                0.0) *
                                                                            valueOrDefault<double>(
                                                                              valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.00,
                                                                                  ) +
                                                                                  (valueOrDefault<double>(
                                                                                        _model.goldPrice,
                                                                                        6000.00,
                                                                                      ) *
                                                                                      (valueOrDefault<double>(
                                                                                            _model.goldDifference,
                                                                                            0.0,
                                                                                          ) /
                                                                                          100)),
                                                                              6000.0,
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
                                                                        valueOrDefault(currentUserDocument?.goldBought,
                                                                                0.0) *
                                                                            valueOrDefault<double>(
                                                                              valueOrDefault<double>(
                                                                                    _model.goldPrice,
                                                                                    6000.00,
                                                                                  ) +
                                                                                  (valueOrDefault<double>(
                                                                                        _model.goldPrice,
                                                                                        6000.00,
                                                                                      ) *
                                                                                      (valueOrDefault<double>(
                                                                                            _model.goldDifference,
                                                                                            0.0,
                                                                                          ) /
                                                                                          100)),
                                                                              6000.0,
                                                                            ),
                                                                        0.0,
                                                                      ) <
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.amountBought,
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
                                                Text(
                                                  'Total Returns',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 20.0)),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 30.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(-0.34, -1.0),
                                end: const AlignmentDirectional(0.34, 1.0),
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('SellingPage');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .btnBorder,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            36.0, 0.0, 36.0, 0.0),
                                        child: Text(
                                          'Withdraw',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ).addWalkthrough(
                                  containerJwkfyeql,
                                  _model.appWalkthroughController,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('BuyingPage');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                          FlutterFlowTheme.of(context).tertiary,
                                          FlutterFlowTheme.of(context).secondary
                                        ],
                                        stops: const [0.0, 0.5, 1.0],
                                        begin: const AlignmentDirectional(1.0, 0.98),
                                        end: const AlignmentDirectional(-1.0, -0.98),
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            36.0, 0.0, 36.0, 0.0),
                                        child: Text(
                                          'Buy More Gold',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ).addWalkthrough(
                                  containerVcfz0bry,
                                  _model.appWalkthroughController,
                                ),
                              ].divide(const SizedBox(width: 36.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '24K Digital Gold Current Buy Price',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.radio_button_checked_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            size: 14.0,
                                          ),
                                          Text(
                                            'LIVE',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                      Text(
                                        '${valueOrDefault<String>(
                                          formatNumber(
                                            valueOrDefault<double>(
                                                  _model.goldPrice,
                                                  6000.00,
                                                ) +
                                                (valueOrDefault<double>(
                                                      _model.goldPrice,
                                                      6000.00,
                                                    ) *
                                                    (valueOrDefault<double>(
                                                          _model.goldDifference,
                                                          0.0,
                                                        ) /
                                                        100)),
                                            formatType: FormatType.custom,
                                            format: '###.##',
                                            locale: 'en_US',
                                          ),
                                          '6000',
                                        )}/gm',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Nunito',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F4FF),
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 3.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.notifications_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 16.0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                valueOrDefault<double>(
                                                      _model.goldPrice,
                                                      6000.00,
                                                    ) +
                                                    (valueOrDefault<double>(
                                                          _model.goldPrice,
                                                          6000.00,
                                                        ) *
                                                        (valueOrDefault<double>(
                                                              _model
                                                                  .goldDifference,
                                                              0.0,
                                                            ) /
                                                            100)),
                                                formatType: FormatType.custom,
                                                format: '###.##',
                                                locale: 'en_US',
                                              ),
                                              '6000',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  wrapWithModel(
                                    model: _model.customGraphModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: const CustomGraphWidget(),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).formBorder,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      wrapWithModel(
                                        model: _model.grapOptionModel1,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: '1W',
                                          isSelected: false,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.grapOptionModel2,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: '1M',
                                          isSelected: false,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.grapOptionModel3,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: '6M',
                                          isSelected: false,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.grapOptionModel4,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: '1Y',
                                          isSelected: false,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.grapOptionModel5,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: '3Y',
                                          isSelected: false,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.grapOptionModel6,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: '5Y',
                                          isSelected: false,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.grapOptionModel7,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: const GrapOptionWidget(
                                          value: 'All',
                                          isSelected: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFF0E2),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 3.0, 4.0, 3.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                size: 16.0,
                                              ),
                                              Text(
                                                'Lowest ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '3209.33',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                ' /gm',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE0F0E4),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 3.0, 4.0, 3.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_up,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                size: 16.0,
                                              ),
                                              Text(
                                                'Highest ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '3209.33',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                ' /gm',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 3.0, 4.0, 3.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Icon(
                                                Icons.bar_chart,
                                                color: Color(0xFF767676),
                                                size: 16.0,
                                              ),
                                              Text(
                                                '5Y Change ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color:
                                                              const Color(0xFF767676),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '20%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color:
                                                              const Color(0xFF767676),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                ' p.a',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color:
                                                              const Color(0xFF767676),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('SavingsPlanPage1');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/Gold%20locker%20vault.png?alt=media&token=6a5ea05e-d0df-4f74-b190-f92f96037be6',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Gold has been the best performing \nasset in the last 20 years, consistently \ngiving ~12% return per annum',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).formBorder,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Grow Gold with SIP',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
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
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'You can start investing with just ₹10 today',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('SavingsPlanPage1');
                              },
                              child: wrapWithModel(
                                model: _model.sIPCardModel1,
                                updateCallback: () => setState(() {}),
                                child: const SIPCardWidget(
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold.png?alt=media&token=91a27812-14cf-43e2-a34f-32acdb972628',
                                  text:
                                      'Track your savings everyday, hassle free and relax',
                                ),
                              ),
                            ).addWalkthrough(
                              containerSx22cg5d,
                              _model.appWalkthroughController,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('SavingsPlanPage1');
                              },
                              child: wrapWithModel(
                                model: _model.sIPCardModel2,
                                updateCallback: () => setState(() {}),
                                child: const SIPCardWidget(
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                  text:
                                      'Add savings weekly to achieve your future goals',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('SavingsPlanPage1');
                              },
                              child: wrapWithModel(
                                model: _model.sIPCardModel3,
                                updateCallback: () => setState(() {}),
                                child: const SIPCardWidget(
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%203.png?alt=media&token=b2d59c56-c047-4900-8a9f-6b17e944a315',
                                  text:
                                      'Save every month and get returns upto 12% per year',
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 8.0))
                              .addToEnd(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).formBorder,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Buy Real Gold',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
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
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Buy exclusive jewellery and get 5% off',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('MarketplacePage');
                              },
                              child: wrapWithModel(
                                model: _model.sponsoredCardModel1,
                                updateCallback: () => setState(() {}),
                                child: const SponsoredCardWidget(
                                  title: 'For Her',
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/C022597__1.webp?alt=media&token=54ebd8c3-b26b-44e9-aa92-dfb5a69c13f3',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('MarketplacePage');
                              },
                              child: wrapWithModel(
                                model: _model.sponsoredCardModel2,
                                updateCallback: () => setState(() {}),
                                child: const SponsoredCardWidget(
                                  title: 'For Him',
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/large_jos-alukkas-Gold-Bracelet--JA9KTM-hLef.png?alt=media&token=e49595cd-0a0e-4a01-87b5-6df50668cdf0',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('MarketplacePage');
                              },
                              child: wrapWithModel(
                                model: _model.sponsoredCardModel3,
                                updateCallback: () => setState(() {}),
                                child: const SponsoredCardWidget(
                                  title: 'For Couples',
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/0b824ff0-f979-11ea-a85f-0d8be549225f.png?alt=media&token=7466f843-eb99-4030-a094-f11db6a3a571',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('MarketplacePage');
                              },
                              child: wrapWithModel(
                                model: _model.sponsoredCardModel4,
                                updateCallback: () => setState(() {}),
                                child: const SponsoredCardWidget(
                                  title: 'Divine',
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/jio_gold_1g_goddess_lakshmi_gold_coin-1.png?alt=media&token=b5a6ab26-af22-42ed-bca4-0ba6f5c2c302',
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 12.0))
                              .addToEnd(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).formBorder,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Win Rewards',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
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
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Get lucky and stand a chance to win Gold',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      letterSpacing: 0.0,
                                    ),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('SpinTheWheelPage');
                              },
                              child: wrapWithModel(
                                model: _model.rewardsCardModel,
                                updateCallback: () => setState(() {}),
                                child: const RewardsCardWidget(
                                  title: 'Spin the wheel of fortune',
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FWheel%20of%20fortune%20small.png?alt=media&token=98e7b847-509d-42c0-a350-8a50c601b017',
                                  description:
                                      'Stand a chance to win upto 1gm of \nExtra Gold',
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
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.appWalkthroughController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
