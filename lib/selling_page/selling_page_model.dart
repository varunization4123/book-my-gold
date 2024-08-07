import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/withdraw_full_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'selling_page_widget.dart' show SellingPageWidget;
import 'package:flutter/material.dart';

class SellingPageModel extends FlutterFlowModel<SellingPageWidget> {
  ///  Local state fields for this page.

  double? goldPrice = 6000.0;

  double? goldDifference = 1.0;

  double? enteredAmount = 0.0;

  double? sellingFees = 1.0;

  String? rateId;

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in SellingPage widget.
  AppSettingsRecord? readAppSettings;
  InstantTimer? mainTimer;
  InstantTimer? refreshTimer;
  // Stores action output result for [Backend Call - API (Sell Price API)] action in SellingPage widget.
  ApiCallResponse? goldSellPriceFromApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in SellingPage widget.
  String? decryptedApiResponse;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 300000;
  int timerMilliseconds = 300000;
  String timerValue = StopWatchTimer.getDisplayTime(
    300000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for amountField widget.
  FocusNode? amountFieldFocusNode;
  TextEditingController? amountFieldTextController;
  String? Function(BuildContext, String?)? amountFieldTextControllerValidator;
  String? _amountFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Model for WithdrawFull component.
  late WithdrawFullModel withdrawFullModel1;
  // Stores action output result for [Backend Call - API (Sell Verify API)] action in SetupBtn widget.
  ApiCallResponse? sellVerifyApi;
  // State field(s) for gramsField widget.
  FocusNode? gramsFieldFocusNode;
  TextEditingController? gramsFieldTextController;
  String? Function(BuildContext, String?)? gramsFieldTextControllerValidator;
  String? _gramsFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Model for WithdrawFull component.
  late WithdrawFullModel withdrawFullModel2;
  // Stores action output result for [Backend Call - API (Sell Verify API)] action in SetupBtn widget.
  ApiCallResponse? sellVerifyApi2;
  // Stores action output result for [Custom Action - encryptSellVerifyApiRequest] action in SetupBtn widget.
  String? encryptSellVerifyApiRequest2;

  @override
  void initState(BuildContext context) {
    amountFieldTextControllerValidator = _amountFieldTextControllerValidator;
    withdrawFullModel1 = createModel(context, () => WithdrawFullModel());
    gramsFieldTextControllerValidator = _gramsFieldTextControllerValidator;
    withdrawFullModel2 = createModel(context, () => WithdrawFullModel());
  }

  @override
  void dispose() {
    mainTimer?.cancel();
    refreshTimer?.cancel();
    timerController.dispose();
    tabBarController?.dispose();
    amountFieldFocusNode?.dispose();
    amountFieldTextController?.dispose();

    withdrawFullModel1.dispose();
    gramsFieldFocusNode?.dispose();
    gramsFieldTextController?.dispose();

    withdrawFullModel2.dispose();
  }
}
