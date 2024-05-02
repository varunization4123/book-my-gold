import '/flutter_flow/flutter_flow_util.dart';
import 'admin_dashboard_page_widget.dart' show AdminDashboardPageWidget;
import 'package:flutter/material.dart';

class AdminDashboardPageModel
    extends FlutterFlowModel<AdminDashboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
