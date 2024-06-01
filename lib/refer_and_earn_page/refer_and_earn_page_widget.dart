import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'refer_and_earn_page_model.dart';
export 'refer_and_earn_page_model.dart';

class ReferAndEarnPageWidget extends StatefulWidget {
  const ReferAndEarnPageWidget({super.key});

  @override
  State<ReferAndEarnPageWidget> createState() => _ReferAndEarnPageWidgetState();
}

class _ReferAndEarnPageWidgetState extends State<ReferAndEarnPageWidget> {
  late ReferAndEarnPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReferAndEarnPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ReferAndEarnPage'});
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
              context.pop();
            },
          ),
          title: Text(
            'Refer & Earn',
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Nunito',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).tertiary,
                  FlutterFlowTheme.of(context).secondary,
                  FlutterFlowTheme.of(context).tertiary
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: const AlignmentDirectional(0.64, -1.0),
                end: const AlignmentDirectional(-0.64, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FReferral.png?alt=media&token=cdcc0ff0-07a1-48f5-88bf-18249919f4fa',
                      ).image,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: CachedNetworkImageProvider(
                            'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FGolden%20Bricks.png?alt=media&token=b20cb78c-94a9-4c91-aa20-e517e3a7c80b',
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Free Gold Upto 1gm',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Nunito',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'on your friend\'s first purchase',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: CachedNetworkImageProvider(
                            'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/app-images%2FGolden%20Ticket.png?alt=media&token=14d7b6af-3316-42e4-b51e-bdb5891fcf70',
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Extra Gold Upto 0.3gm',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Nunito',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Coupons for you & your friend',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 48.0, 16.0, 48.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'whatsapp://send?text=Hey%21%0D%0AJoin+BookMyGold+-+India%27s+safest+gold-savings+app%2C+trusted+by+millions+of+Indians.%0D%0A%E2%98%91%EF%B8%8FStart+as+small+as+Rs.10%2Fday%0D%0A%E2%98%91%EF%B8%8FWithdraw+anytime%0D%0A%E2%98%91%EF%B8%8F100%25+safe+%26+secure%0D%0A%0D%0AYou+can+earn+FREE+GOLD+worth+upto+0.3gm+on+your+first+saving.%0D%0A%0D%0AClick+the+link+below+to+download%21%0D%0Ahttps%3A%2F%2Fbookmygold.flutterflow.app%2FBuyingPage');
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: CachedNetworkImageProvider(
                                        'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/icon-images%2FWhatsApp.png?alt=media&token=3b55bba1-1b20-4451-97e9-a85bb6c016a6',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Invite via WhatsApp',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Terms & Conditions apply*',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito',
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(const SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
