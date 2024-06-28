import '/components/f_a_qfor_support_widget.dart';
import '/components/support_topic_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'support_page_model.dart';
export 'support_page_model.dart';

class SupportPageWidget extends StatefulWidget {
  const SupportPageWidget({super.key});

  @override
  State<SupportPageWidget> createState() => _SupportPageWidgetState();
}

class _SupportPageWidgetState extends State<SupportPageWidget> {
  late SupportPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SupportPage'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondaryText),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Support',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Lato',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 14.0, 8.0, 14.0),
                            child: Text(
                              'Topics',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.supportTopicModel1,
                                    updateCallback: () => setState(() {}),
                                    child: const SupportTopicWidget(
                                      title: 'General',
                                      icon:
                                          'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.supportTopicModel2,
                                    updateCallback: () => setState(() {}),
                                    child: const SupportTopicWidget(
                                      title: 'Digital Gold',
                                      icon:
                                          'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.supportTopicModel3,
                                    updateCallback: () => setState(() {}),
                                    child: const SupportTopicWidget(
                                      title: 'Savings',
                                      icon:
                                          'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.supportTopicModel4,
                                    updateCallback: () => setState(() {}),
                                    child: const SupportTopicWidget(
                                      title: 'Payments',
                                      icon:
                                          'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.supportTopicModel5,
                                    updateCallback: () => setState(() {}),
                                    child: const SupportTopicWidget(
                                      title: 'Withdrawal',
                                      icon:
                                          'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.supportTopicModel6,
                                    updateCallback: () => setState(() {}),
                                    child: const SupportTopicWidget(
                                      title: 'Referral',
                                      icon:
                                          'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/gold%202.png?alt=media&token=1e67ecc0-74dc-4923-9d33-3c3b29b0c22f',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8.0, 14.0, 8.0, 14.0),
                        child: Text(
                          'Frequently Asked Questions',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.fAQforSupportModel1,
                        updateCallback: () => setState(() {}),
                        child: const FAQforSupportWidget(
                          title: 'What is this app? How does it work?',
                          detail:
                              'This your daily gold buying app that lets you invest your money in Digital Gold as a savings ot investment plan. This is the 1st Made In India app to come up with the innovative solution to get more Indians to invest in Gold as an investment.',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.fAQforSupportModel2,
                        updateCallback: () => setState(() {}),
                        child: const FAQforSupportWidget(
                          title: 'Why should I buy Digital gold?',
                          detail:
                              'Compared with Physical gold, Digital Gold is better as it is stored securely at the World-Class Brinks Vaults and there are no making charges as it is just digitally allocated to your name. With our Goldbeez feature, you can also lease your saved Gold to Jewellers using your App in order to earn better interest.',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.fAQforSupportModel3,
                        updateCallback: () => setState(() {}),
                        child: const FAQforSupportWidget(
                          title: 'How do I check today\'s Digital Gold price?',
                          detail:
                              'To check the current Digital Gold Price, Download the App and go to the App’s Home Screen, where at the top-right side of the screen you’ll be able to check the current Gold Buy Price.',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.fAQforSupportModel4,
                        updateCallback: () => setState(() {}),
                        child: const FAQforSupportWidget(
                          title: 'How do I check today\'s Digital Gold price?',
                          detail:
                              'To check the current Digital Gold Price, Download the App and go to the App’s Home Screen, where at the top-right side of the screen you’ll be able to check the current Gold Buy Price.',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Still need help?',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ChatSupportPage');
                          },
                          child: Text(
                            'Raise a Query',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Nunito',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
