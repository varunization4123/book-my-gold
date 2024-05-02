import '/components/payment_provider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'savings_plan_checkout_page_widget.dart'
    show SavingsPlanCheckoutPageWidget;
import 'package:flutter/material.dart';

class SavingsPlanCheckoutPageModel
    extends FlutterFlowModel<SavingsPlanCheckoutPageWidget> {
  ///  Local state fields for this page.

  int amount = 0;

  String upiPlatform = 'PhonePe';

  bool phonePeSelected = true;

  bool gPaySelected = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PaymentProvider component.
  late PaymentProviderModel paymentProviderModel1;
  // Model for PaymentProvider component.
  late PaymentProviderModel paymentProviderModel2;

  @override
  void initState(BuildContext context) {
    paymentProviderModel1 = createModel(context, () => PaymentProviderModel());
    paymentProviderModel2 = createModel(context, () => PaymentProviderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    paymentProviderModel1.dispose();
    paymentProviderModel2.dispose();
  }
}
