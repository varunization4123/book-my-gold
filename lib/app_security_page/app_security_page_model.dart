import '/flutter_flow/flutter_flow_util.dart';
import 'app_security_page_widget.dart' show AppSecurityPageWidget;
import 'package:flutter/material.dart';

class AppSecurityPageModel extends FlutterFlowModel<AppSecurityPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool biometricVerification = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
