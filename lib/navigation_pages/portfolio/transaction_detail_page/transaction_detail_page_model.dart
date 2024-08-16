import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_detail_page_widget.dart' show TransactionDetailPageWidget;
import 'package:flutter/material.dart';

class TransactionDetailPageModel
    extends FlutterFlowModel<TransactionDetailPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Invoice API)] action in Container widget.
  ApiCallResponse? invoiceApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in Container widget.
  String? decryptedBuyInvoiceApiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
