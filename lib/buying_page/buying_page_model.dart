import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/price_option_selected_widget.dart';
import '/components/price_option_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'buying_page_widget.dart' show BuyingPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class BuyingPageModel extends FlutterFlowModel<BuyingPageWidget> {
  ///  Local state fields for this page.

  double goldPrice = 6000.0;

  double? commisionFees = 1.0;

  double? discount = 1.0;

  double? buyingFees = 1.0;

  double? gst = 3.0;

  double? rewards = 1.0;

  double? goldDifference = 1.0;

  double? enteredAmount = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in BuyingPage widget.
  AppSettingsRecord? readAppSettings;
  InstantTimer? mainTimer;
  InstantTimer? refreshTimer;
  // Stores action output result for [Backend Call - API (Gold Price)] action in BuyingPage widget.
  ApiCallResponse? goldDataAPI;
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
  FocusNode? amountFieldFocusNode1;
  TextEditingController? amountFieldTextController1;
  String? Function(BuildContext, String?)? amountFieldTextController1Validator;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel1;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel2;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel3;
  // Model for PriceOptionSelected component.
  late PriceOptionSelectedModel priceOptionSelectedModel1;
  // Stores action output result for [Razorpay Payment] action in SetupBtn widget.
  String? razorpayPaymentId;
  // Stores action output result for [Backend Call - Create Document] action in SetupBtn widget.
  DigiGoldBuyRecord? updateTransaction1;
  // State field(s) for amountField widget.
  FocusNode? amountFieldFocusNode2;
  TextEditingController? amountFieldTextController2;
  String? Function(BuildContext, String?)? amountFieldTextController2Validator;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel4;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel5;
  // Model for PriceOptionSelected component.
  late PriceOptionSelectedModel priceOptionSelectedModel2;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel6;
  // Stores action output result for [Razorpay Payment] action in SetupBtn widget.
  String? razorpayPaymentId2;
  // Stores action output result for [Backend Call - Create Document] action in SetupBtn widget.
  DigiGoldBuyRecord? updateTransaction2;

  @override
  void initState(BuildContext context) {
    priceOptionModel1 = createModel(context, () => PriceOptionModel());
    priceOptionModel2 = createModel(context, () => PriceOptionModel());
    priceOptionModel3 = createModel(context, () => PriceOptionModel());
    priceOptionSelectedModel1 =
        createModel(context, () => PriceOptionSelectedModel());
    priceOptionModel4 = createModel(context, () => PriceOptionModel());
    priceOptionModel5 = createModel(context, () => PriceOptionModel());
    priceOptionSelectedModel2 =
        createModel(context, () => PriceOptionSelectedModel());
    priceOptionModel6 = createModel(context, () => PriceOptionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainTimer?.cancel();
    refreshTimer?.cancel();
    timerController.dispose();
    tabBarController?.dispose();
    amountFieldFocusNode1?.dispose();
    amountFieldTextController1?.dispose();

    priceOptionModel1.dispose();
    priceOptionModel2.dispose();
    priceOptionModel3.dispose();
    priceOptionSelectedModel1.dispose();
    amountFieldFocusNode2?.dispose();
    amountFieldTextController2?.dispose();

    priceOptionModel4.dispose();
    priceOptionModel5.dispose();
    priceOptionSelectedModel2.dispose();
    priceOptionModel6.dispose();
  }
}
