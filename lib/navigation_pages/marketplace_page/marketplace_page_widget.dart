import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'marketplace_page_model.dart';
export 'marketplace_page_model.dart';

class MarketplacePageWidget extends StatefulWidget {
  const MarketplacePageWidget({super.key});

  @override
  State<MarketplacePageWidget> createState() => _MarketplacePageWidgetState();
}

class _MarketplacePageWidgetState extends State<MarketplacePageWidget> {
  late MarketplacePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketplacePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MarketplacePage'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
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
              context.goNamed('PortfolioPage');
            },
          ),
          title: Text(
            'Market Place',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowWebView(
                    content: 'https://gelly.in',
                    bypass: true,
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    verticalScroll: true,
                    horizontalScroll: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
