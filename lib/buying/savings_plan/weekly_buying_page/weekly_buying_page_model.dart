import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/f_a_q_point/f_a_q_point_widget.dart';
import '/components/price_option/price_option_widget.dart';
import '/components/price_option_selected/price_option_selected_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'weekly_buying_page_widget.dart' show WeeklyBuyingPageWidget;
import 'package:flutter/material.dart';

class WeeklyBuyingPageModel extends FlutterFlowModel<WeeklyBuyingPageWidget> {
  ///  Local state fields for this page.

  double goldPrice = 6000.0;

  double? commisionFees = 1.0;

  double? discount = 1.0;

  double? buyingFees = 1.0;

  double? gst = 3.0;

  double? rewards = 1.0;

  double? goldDifference = 1.0;

  int? enteredAmount;

  String? rateIdApi;

  bool isLoading = false;

  double? buyRate;

  int? txId;

  String pincode = '560061';

  double? enteredGold;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in WeeklyBuyingPage widget.
  AppSettingsRecord? readAppSettings;
  InstantTimer? mainTimer;
  InstantTimer? refreshTimer;
  // Stores action output result for [Backend Call - API (Buy Price API)] action in WeeklyBuyingPage widget.
  ApiCallResponse? goldPriceFromApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in WeeklyBuyingPage widget.
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

  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel1;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel2;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel3;
  // Model for PriceOptionSelected component.
  late PriceOptionSelectedModel priceOptionSelectedModel;
  // Stores action output result for [Custom Action - encryptApiRequest] action in SetupBtn widget.
  String? encryptedBuyVerifyApiRequest;
  // Stores action output result for [Backend Call - API (Buy Verify API)] action in SetupBtn widget.
  ApiCallResponse? buyVerifyApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in SetupBtn widget.
  String? decryptedBuyVerifyApiResponse;
  // Stores action output result for [Backend Call - API (Create Customer)] action in SetupBtn widget.
  ApiCallResponse? razorpayCreateCustomerApiCall;
  // Stores action output result for [Backend Call - API (Plan)] action in SetupBtn widget.
  ApiCallResponse? razorpayPlansApiCall;
  // Stores action output result for [Backend Call - API (Subscription)] action in SetupBtn widget.
  ApiCallResponse? razorpaySubscriptionsApiCall;
  // Stores action output result for [Backend Call - API (Orders)] action in SetupBtn widget.
  ApiCallResponse? razorpayOrderApi;
  // Stores action output result for [Cloud Function - razorpayWebhookFunction] action in SetupBtn widget.
  RazorpayWebhookFunctionCloudFunctionCallResponse? razorpayWebhookFunctionCall;
  // Stores action output result for [Custom Action - encryptApiRequest] action in SetupBtn widget.
  String? encryptedBuyConfirmApiRequest;
  // Stores action output result for [Backend Call - API (Buy Confirm API)] action in SetupBtn widget.
  ApiCallResponse? buyConfirmApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in SetupBtn widget.
  String? decryptedBuyConfirmApiResponse;
  // Model for FAQPoint component.
  late FAQPointModel fAQPointModel1;
  // Model for FAQPoint component.
  late FAQPointModel fAQPointModel2;
  // Model for FAQPoint component.
  late FAQPointModel fAQPointModel3;

  @override
  void initState(BuildContext context) {
    amountFieldTextControllerValidator = _amountFieldTextControllerValidator;
    priceOptionModel1 = createModel(context, () => PriceOptionModel());
    priceOptionModel2 = createModel(context, () => PriceOptionModel());
    priceOptionModel3 = createModel(context, () => PriceOptionModel());
    priceOptionSelectedModel =
        createModel(context, () => PriceOptionSelectedModel());
    fAQPointModel1 = createModel(context, () => FAQPointModel());
    fAQPointModel2 = createModel(context, () => FAQPointModel());
    fAQPointModel3 = createModel(context, () => FAQPointModel());
  }

  @override
  void dispose() {
    mainTimer?.cancel();
    refreshTimer?.cancel();
    timerController.dispose();
    amountFieldFocusNode?.dispose();
    amountFieldTextController?.dispose();

    priceOptionModel1.dispose();
    priceOptionModel2.dispose();
    priceOptionModel3.dispose();
    priceOptionSelectedModel.dispose();
    fAQPointModel1.dispose();
    fAQPointModel2.dispose();
    fAQPointModel3.dispose();
  }
}
