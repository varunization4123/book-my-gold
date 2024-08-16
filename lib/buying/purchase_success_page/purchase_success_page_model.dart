import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'purchase_success_page_widget.dart' show PurchaseSuccessPageWidget;
import 'package:flutter/material.dart';

class PurchaseSuccessPageModel
    extends FlutterFlowModel<PurchaseSuccessPageWidget> {
  ///  Local state fields for this page.

  bool isUpdating = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Invoice API)] action in Row widget.
  ApiCallResponse? invoiceApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in Row widget.
  String? decryptedBuyInvoiceApiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
