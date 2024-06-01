import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_detail_page_widget.dart' show TransactionDetailPageWidget;
import 'package:flutter/material.dart';

class TransactionDetailPageModel
    extends FlutterFlowModel<TransactionDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
