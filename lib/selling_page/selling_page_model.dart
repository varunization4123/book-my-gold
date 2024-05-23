import '/backend/api_requests/api_calls.dart';
import '/components/withdraw_full_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'selling_page_widget.dart' show SellingPageWidget;
import 'package:flutter/material.dart';

class SellingPageModel extends FlutterFlowModel<SellingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  InstantTimer? mainTimer;
  InstantTimer? refreshTimer;
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

    if (val.length < 2) {
      return 'Enter a value greater than ₹9';
    }

    return null;
  }

  // Model for WithdrawFull component.
  late WithdrawFullModel withdrawFullModel1;
  // Stores action output result for [Backend Call - API (Gold Price)] action in SetupBtn widget.
  ApiCallResponse? apiResultd1v;
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

  @override
  void initState(BuildContext context) {
    amountFieldTextControllerValidator = _amountFieldTextControllerValidator;
    withdrawFullModel1 = createModel(context, () => WithdrawFullModel());
    gramsFieldTextControllerValidator = _gramsFieldTextControllerValidator;
    withdrawFullModel2 = createModel(context, () => WithdrawFullModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
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
