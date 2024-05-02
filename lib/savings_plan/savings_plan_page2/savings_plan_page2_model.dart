import '/components/price_option_selected_widget.dart';
import '/components/price_option_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'savings_plan_page2_widget.dart' show SavingsPlanPage2Widget;
import 'package:flutter/material.dart';

class SavingsPlanPage2Model extends FlutterFlowModel<SavingsPlanPage2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for amountField widget.
  FocusNode? amountFieldFocusNode1;
  TextEditingController? amountFieldTextController1;
  String? Function(BuildContext, String?)? amountFieldTextController1Validator;
  String? _amountFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Choose at least Rs. 10';
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
  late PriceOptionSelectedModel priceOptionSelectedModel1;
  // State field(s) for amountField widget.
  FocusNode? amountFieldFocusNode2;
  TextEditingController? amountFieldTextController2;
  String? Function(BuildContext, String?)? amountFieldTextController2Validator;
  String? _amountFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Choose at least Rs. 10';
    }

    return null;
  }

  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel4;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel5;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel6;
  // Model for PriceOptionSelected component.
  late PriceOptionSelectedModel priceOptionSelectedModel2;
  // State field(s) for amountField widget.
  FocusNode? amountFieldFocusNode3;
  TextEditingController? amountFieldTextController3;
  String? Function(BuildContext, String?)? amountFieldTextController3Validator;
  String? _amountFieldTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Choose at least Rs. 10';
    }

    return null;
  }

  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel7;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel8;
  // Model for PriceOption component.
  late PriceOptionModel priceOptionModel9;
  // Model for PriceOptionSelected component.
  late PriceOptionSelectedModel priceOptionSelectedModel3;

  @override
  void initState(BuildContext context) {
    amountFieldTextController1Validator = _amountFieldTextController1Validator;
    priceOptionModel1 = createModel(context, () => PriceOptionModel());
    priceOptionModel2 = createModel(context, () => PriceOptionModel());
    priceOptionModel3 = createModel(context, () => PriceOptionModel());
    priceOptionSelectedModel1 =
        createModel(context, () => PriceOptionSelectedModel());
    amountFieldTextController2Validator = _amountFieldTextController2Validator;
    priceOptionModel4 = createModel(context, () => PriceOptionModel());
    priceOptionModel5 = createModel(context, () => PriceOptionModel());
    priceOptionModel6 = createModel(context, () => PriceOptionModel());
    priceOptionSelectedModel2 =
        createModel(context, () => PriceOptionSelectedModel());
    amountFieldTextController3Validator = _amountFieldTextController3Validator;
    priceOptionModel7 = createModel(context, () => PriceOptionModel());
    priceOptionModel8 = createModel(context, () => PriceOptionModel());
    priceOptionModel9 = createModel(context, () => PriceOptionModel());
    priceOptionSelectedModel3 =
        createModel(context, () => PriceOptionSelectedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
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
    priceOptionModel6.dispose();
    priceOptionSelectedModel2.dispose();
    amountFieldFocusNode3?.dispose();
    amountFieldTextController3?.dispose();

    priceOptionModel7.dispose();
    priceOptionModel8.dispose();
    priceOptionModel9.dispose();
    priceOptionSelectedModel3.dispose();
  }
}
