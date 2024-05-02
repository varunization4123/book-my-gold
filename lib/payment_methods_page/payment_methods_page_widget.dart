import '/auth/firebase_auth/auth_util.dart';
import '/components/add_new_u_p_i_widget.dart';
import '/components/custom_list_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'payment_methods_page_model.dart';
export 'payment_methods_page_model.dart';

class PaymentMethodsPageWidget extends StatefulWidget {
  const PaymentMethodsPageWidget({super.key});

  @override
  State<PaymentMethodsPageWidget> createState() =>
      _PaymentMethodsPageWidgetState();
}

class _PaymentMethodsPageWidgetState extends State<PaymentMethodsPageWidget> {
  late PaymentMethodsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaymentMethodsPage'});
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
            'Payment Methods',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).secondaryText,
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
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 36.0, 12.0, 36.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: AuthUserStreamWidget(
                      builder: (context) => Builder(
                        builder: (context) {
                          final upiId =
                              (currentUserDocument?.upiIds.toList() ?? [])
                                  .toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: upiId.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, upiIdIndex) {
                              final upiIdItem = upiId[upiIdIndex];
                              return CustomListTileWidget(
                                key: Key(
                                    'Key5yu_${upiIdIndex}_of_${upiId.length}'),
                                item: upiIdItem,
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
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        barrierColor: const Color(0x50000000),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                  child: const AddNewUPIWidget(),
                                ),
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
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
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
