import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_screen_widget.dart' show LoadingScreenWidget;
import 'package:flutter/material.dart';

class LoadingScreenModel extends FlutterFlowModel<LoadingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Buy Status API)] action in LoadingScreen widget.
  ApiCallResponse? buyStatusApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in LoadingScreen widget.
  String? decryptedBuyVerifyApiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
