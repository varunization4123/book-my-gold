import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_upi_widget.dart' show SelectUpiWidget;
import 'package:flutter/material.dart';

class SelectUpiModel extends FlutterFlowModel<SelectUpiWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  String? upiID;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - encryptApiRequest] action in SetupBtn widget.
  String? encryptedSellConfirmApiRequest;
  // Stores action output result for [Backend Call - API (Sell Confirm API)] action in SetupBtn widget.
  ApiCallResponse? sellConfirmApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in SetupBtn widget.
  String? decryptedSellConfirmApiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
